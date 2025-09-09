<?php
// VAT Display Module - Invoice View Extension
// This file can be included at the end of invoice views to add VAT display functionality
?>

<!-- VAT Display Module Integration -->
<script>
$(document).ready(function() {
    // VAT Display Module - Enhanced client VAT information display
    
    function injectVatDisplay() {
        $('.client-address').each(function() {
            var $clientAddress = $(this);
            var $clientContainer = $clientAddress.parent();
            var $clientLink = $clientContainer.find('h3 a[href*="/clients/view/"]');
            
            if ($clientLink.length && !$clientAddress.find('.vat-display-injected').length) {
                // Extract client ID from URL
                var clientUrl = $clientLink.attr('href');
                var clientId = clientUrl.split('/').pop();
                
                // Get VAT info via AJAX
                $.ajax({
                    url: '<?php echo site_url('vat_display/get_client_vat'); ?>/' + clientId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.html && response.vat_id && response.vat_id.length > 0) {
                            // Find insertion point (after address2, before town line)
                            var $townLine = $clientAddress.find('.client-adress-town-line');
                            if ($townLine.length) {
                                // Insert VAT info before town line
                                $townLine.before(
                                    '<span class="client-vat-id-line vat-display-injected">' +
                                    'NIF/VAT ID: ' + response.vat_id + '<br>' +
                                    '</span>'
                                );
                            }
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log('VAT Display Module: Could not load VAT info for client ' + clientId);
                    }
                });
            }
        });
    }
    
    // Initial injection with slight delay to ensure DOM is ready
    setTimeout(injectVatDisplay, 100);
    
    // Re-inject if page content changes (for dynamic updates)
    $(document).on('DOMNodeInserted', '.client-address', function() {
        setTimeout(injectVatDisplay, 100);
    });
});
</script>

<!-- End VAT Display Module Integration -->