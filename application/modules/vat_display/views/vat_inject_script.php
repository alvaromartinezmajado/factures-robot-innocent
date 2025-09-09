<script>
$(document).ready(function() {
    // VAT Display Module - Inject VAT ID into client address sections
    $('.client-address').each(function() {
        var $clientAddress = $(this);
        var $clientLink = $clientAddress.closest('.col-xs-12').find('h3 a[href*="/clients/view/"]');
        
        if ($clientLink.length) {
            // Extract client ID from URL
            var clientUrl = $clientLink.attr('href');
            var clientId = clientUrl.split('/').pop();
            
            // Call our module to get VAT info
            $.ajax({
                url: '<?php echo site_url('vat_display/get_client_vat'); ?>/' + clientId,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    if (response.html && response.vat_id) {
                        // Find the last address line and add VAT info after it
                        var $lastAddressLine = $clientAddress.find('span[class*="client-address"]:last');
                        if ($lastAddressLine.length) {
                            $lastAddressLine.after(response.html);
                        }
                    }
                },
                error: function() {
                    console.log('VAT Display Module: Could not load VAT info for client ' + clientId);
                }
            });
        }
    });
});
</script>