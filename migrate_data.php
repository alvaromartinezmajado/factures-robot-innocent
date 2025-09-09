<?php
/**
 * Data Migration Script for InvoicePlane
 * Migrates data from backup.json to InvoicePlane database
 */

// Database connection settings from Docker compose
$db_host = 'invoiceplane-db';
$db_user = 'ipdevdb';
$db_pass = 'ipdevdb';  
$db_name = 'invoiceplane_db';

try {
    // Connect to database
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8", $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected to database successfully\n";

    // Load backup data
    $backup_data = json_decode(file_get_contents('/var/www/projects/invoiceplane/backup.json'), true);
    if (!$backup_data) {
        throw new Exception("Failed to load backup.json");
    }
    echo "Loaded backup data successfully\n";

    // Start transaction
    $pdo->beginTransaction();

    // Migrate tax rates first
    echo "Migrating tax rates...\n";
    $tax_rate_mapping = [];
    foreach ($backup_data['tax_rates'] as $tax_rate) {
        // Skip deleted tax rates
        if ($tax_rate['is_deleted']) continue;

        $stmt = $pdo->prepare("
            INSERT INTO ip_tax_rates (
                tax_rate_name, tax_rate_percent
            ) VALUES (?, ?)
        ");

        $stmt->execute([
            $tax_rate['name'] ?: 'Tax',
            floatval($tax_rate['rate'] ?: 0)
        ]);

        $new_tax_rate_id = $pdo->lastInsertId();
        $tax_rate_mapping[$tax_rate['hashed_id']] = $new_tax_rate_id;
        echo "Migrated tax rate: {$tax_rate['name']} ({$tax_rate['rate']}%) (ID: $new_tax_rate_id)\n";
    }

    // Note: No IRPF needed - we are a company invoicing clients (including autónomos)
    // IRPF only applies when autónomos invoice companies, not the reverse

    // Migrate clients
    echo "Migrating clients...\n";
    $client_mapping = [];
    foreach ($backup_data['clients'] as $client) {
        // Skip deleted clients
        if ($client['is_deleted']) continue;

        $stmt = $pdo->prepare("
            INSERT INTO ip_clients (
                client_date_created, client_date_modified, client_name,
                client_address_1, client_address_2, client_city, client_state,
                client_zip, client_country, client_phone, client_email, 
                client_web, client_vat_id, client_active
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");

        $country = $client['country_id'] ? getCountryName($client['country_id']) : '';
        
        // Concatenate VAT number to address2 for backup records display
        $address2 = $client['address2'] ?: '';
        if ($client['vat_number']) {
            $address2 = $address2 ? $address2 . ' - VAT: ' . $client['vat_number'] : 'VAT: ' . $client['vat_number'];
        }

        $stmt->execute([
            $client['created_at'] ? date('Y-m-d H:i:s', strtotime($client['created_at'])) : date('Y-m-d H:i:s'),
            $client['updated_at'] ? date('Y-m-d H:i:s', strtotime($client['updated_at'])) : date('Y-m-d H:i:s'),
            $client['name'] ?: 'Unknown Client',
            $client['address1'] ?: '',
            $address2,
            $client['city'] ?: '',
            $client['state'] ?: '',
            $client['postal_code'] ?: '',
            $country,
            $client['phone'] ?: '',
            '', // email - not in backup data structure shown
            $client['website'] ?: '',
            $client['vat_number'] ?: '', // VAT ID in proper field
            1 // active
        ]);

        $new_client_id = $pdo->lastInsertId();
        $client_mapping[$client['hashed_id']] = $new_client_id;
        
        echo "Migrated client: {$client['name']} (ID: $new_client_id)\n";
    }

    // Migrate products
    echo "Migrating products...\n";
    $product_mapping = [];
    foreach ($backup_data['products'] as $product) {
        // Skip deleted products
        if ($product['is_deleted']) continue;

        $stmt = $pdo->prepare("
            INSERT INTO ip_products (
                family_id, product_sku, product_name, product_description,
                product_price, purchase_price, tax_rate_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ");

        $stmt->execute([
            0, // family_id - default to 0
            $product['product_key'] ?: '',
            $product['notes'] ?: 'Product',
            $product['notes'] ?: '',
            floatval($product['price'] ?: 0),
            floatval($product['cost'] ?: 0),
            0 // tax_rate_id - default to 0
        ]);

        $new_product_id = $pdo->lastInsertId();
        $product_mapping[$product['hashed_id']] = $new_product_id;
        echo "Migrated product: {$product['notes']} (ID: $new_product_id)\n";
    }

    // Migrate invoices
    echo "Migrating invoices...\n";
    
    // Use backup.json chronological order (as-is, no sorting)
    foreach ($backup_data['invoices'] as $invoice) {
        // Skip deleted invoices
        if ($invoice['is_deleted']) continue;
        
        // Get client ID
        $client_id = $client_mapping[$invoice['client_id']] ?? null;
        if (!$client_id) {
            echo "Skipping invoice {$invoice['number']} - client not found\n";
            continue;
        }

        // Map status (backup uses different status system)
        $status_map = [
            1 => 1, // draft
            2 => 2, // sent  
            3 => 2, // sent
            4 => 4, // paid
        ];
        $status = $status_map[$invoice['status_id']] ?? 1;

        $stmt = $pdo->prepare("
            INSERT INTO ip_invoices (
                user_id, client_id, invoice_group_id, invoice_status_id,
                invoice_date_created, invoice_date_modified, invoice_date_due,
                invoice_number, invoice_terms, invoice_url_key
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");

        $invoice_date = $invoice['date'] ? date('Y-m-d', strtotime($invoice['date'])) : date('Y-m-d');
        $due_date = $invoice['due_date'] ? date('Y-m-d', strtotime($invoice['due_date'])) : date('Y-m-d', strtotime('+30 days'));
        $invoice_datetime = $invoice['created_at'] ? date('Y-m-d H:i:s', strtotime($invoice['created_at'])) : date('Y-m-d H:i:s');

        $stmt->execute([
            1, // user_id - default to 1
            $client_id,
            1, // invoice_group_id - default to 1
            $status,
            $invoice_date,
            $invoice_datetime,
            $due_date,
            $invoice['number'] ?: 'INV-' . date('Y-m-d'),
            $invoice['terms'] ?: '',
            generateUrlKey()
        ]);

        $new_invoice_id = $pdo->lastInsertId();
        echo "Migrated invoice: {$invoice['number']} (ID: $new_invoice_id)\n";

        // Calculate taxes from invoice
        $iva_rate_id = null;
        $invoice_tax_total = floatval($invoice['total_taxes'] ?: 0);
        
        // Find IVA tax rate ID if invoice has IVA
        if ($invoice['tax_name1'] && floatval($invoice['tax_rate1']) > 0) {
            foreach ($tax_rate_mapping as $hash_id => $rate_id) {
                if ($backup_data['tax_rates']) {
                    foreach ($backup_data['tax_rates'] as $tax_rate) {
                        if ($tax_rate['hashed_id'] == $hash_id && $tax_rate['name'] == $invoice['tax_name1']) {
                            $iva_rate_id = $rate_id;
                            break 2;
                        }
                    }
                }
            }
        }

        // Migrate invoice line items
        if (isset($invoice['line_items']) && is_array($invoice['line_items'])) {
            foreach ($invoice['line_items'] as $index => $item) {
                $stmt = $pdo->prepare("
                    INSERT INTO ip_invoice_items (
                        invoice_id, item_tax_rate_id, item_date_added,
                        item_name, item_description, item_quantity,
                        item_price, item_order
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                ");

                $stmt->execute([
                    $new_invoice_id,
                    $iva_rate_id ?: 0, // Use IVA tax rate ID if found
                    date('Y-m-d'),
                    $item['product_key'] ?: 'Item',
                    $item['notes'] ?: '',
                    floatval($item['quantity'] ?: 1),
                    floatval($item['cost'] ?: 0),
                    $index + 1
                ]);
            }
        }

        // Add invoice tax rates if present
        if ($iva_rate_id && $invoice_tax_total > 0) {
            $stmt = $pdo->prepare("
                INSERT INTO ip_invoice_tax_rates (
                    invoice_id, tax_rate_id, include_item_tax, invoice_tax_rate_amount
                ) VALUES (?, ?, ?, ?)
            ");
            $stmt->execute([
                $new_invoice_id,
                $iva_rate_id,
                1, // include_item_tax
                $invoice_tax_total
            ]);
        }

        // No IRPF - we invoice clients as a company, not as autónomos

        // Calculate and insert invoice amounts
        $stmt = $pdo->prepare("
            INSERT INTO ip_invoice_amounts (
                invoice_id, invoice_item_subtotal, invoice_item_tax_total,
                invoice_tax_total, invoice_total, invoice_paid, invoice_balance
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ");

        $total = floatval($invoice['amount'] ?: 0);
        $balance = floatval($invoice['balance'] ?: 0);
        $paid = $total - $balance;

        $stmt->execute([
            $new_invoice_id,
            $total, // subtotal
            0, // item tax total
            0, // tax total  
            $total,
            $paid,
            $balance
        ]);
    }

    // Commit transaction
    $pdo->commit();
    echo "Data migration completed successfully!\n";
    
} catch (Exception $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo "Migration failed: " . $e->getMessage() . "\n";
    exit(1);
}

function getCountryName($country_id) {
    // Simple country mapping - you might want to expand this
    $countries = [
        '724' => 'Spain',
        '840' => 'United States',
        '826' => 'United Kingdom',
        '276' => 'Germany',
        '250' => 'France'
    ];
    return $countries[$country_id] ?? '';
}

function generateUrlKey() {
    return bin2hex(random_bytes(16));
}

echo "Migration script completed.\n";
?>