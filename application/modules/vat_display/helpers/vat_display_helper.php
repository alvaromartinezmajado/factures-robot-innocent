<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
 * VAT Display Module
 * 
 * Custom module to enhance client VAT display without modifying core files
 * Author: Custom Implementation
 * Note: This module extends InvoicePlane functionality via HMVC
 */

/**
 * Display enhanced client VAT information
 * 
 * @param object $client Client object with vat_id
 * @return string HTML output for VAT display
 */
function display_client_vat_info($client) 
{
    $output = '';
    
    // Display VAT ID if available
    if (isset($client->client_vat_id) && !empty($client->client_vat_id)) {
        $output .= '<span class="client-vat-id-line">';
        $output .= 'NIF/VAT ID: ' . htmlsc($client->client_vat_id) . '<br>';
        $output .= '</span>';
    }
    
    return $output;
}

/**
 * Inject VAT display into client address section
 * 
 * @param object $client Client object
 * @return void (outputs HTML directly)
 */
function inject_client_vat_display($client)
{
    echo display_client_vat_info($client);
}

/**
 * Check if VAT display module is active
 * 
 * @return bool
 */
function is_vat_display_active()
{
    return true; // Always active for now
}