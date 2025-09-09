<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
 * VAT Display Controller
 * 
 * Handles VAT display functionality as a separate module
 */

class Vat_display extends Admin_Controller 
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('vat_display/vat_display');
        $this->load->database();
    }
    
    /**
     * AJAX endpoint to get VAT info for a client
     */
    public function get_client_vat($client_id = null)
    {
        header('Content-Type: application/json');
        
        if (!$client_id) {
            echo json_encode(['error' => 'No client ID provided']);
            return;
        }
        
        $this->db->select('client_vat_id, client_name');
        $this->db->where('client_id', $client_id);
        $client = $this->db->get('ip_clients')->row();
        
        if ($client) {
            echo json_encode([
                'vat_id' => $client->client_vat_id,
                'name' => $client->client_name,
                'html' => display_client_vat_info($client)
            ]);
        } else {
            echo json_encode(['error' => 'Client not found']);
        }
    }
}