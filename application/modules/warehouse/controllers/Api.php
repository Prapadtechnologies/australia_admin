<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Api extends MY_REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    /**
     * To get states and relatd details
     *
     * @author Mehar
     * */

    // public function venue_address_get()
    // {
    //     $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
    //     $target = $_GET['q'];
    //     if (strlen($target) >= 3) {
    //         $where="lower('name') like '%".strtolower($target)."%'";
    //        $data = $this->db->select('id, name, addressLineOne')
    //                 ->like('name', $target, 'both')
    //                 ->or_like('addressLineOne', $target, 'both')
    //                 ->get('venue_address')
    //                 ->result_array();
    //         //echo $this->db->last_query();die;
    //         //print_r($data);die;
    //         $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    //     }else{
    //         $this->set_response_simple(FALSE, 'Minimum 3 charactes need to be there', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, TRUE);
    //     }
    // }

    public function warehouse_list_get()
    {
        $token_data=$this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        //$target = $_GET['q'];
            //$where="lower('name') like '%".strtolower($target)."%'";
        $data = $this->db->select('*')
                ->order_by('created_at','desc')
                ->where('user_id',$token_data->id)
                ->get('warehouse')
                ->result_array();
        $this->set_response_simple(($data == FALSE) ? [] : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    public function warehouse_create_post()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        /*$this->form_validation->set_rules($this->users_address_model->rules);
        if ($this->form_validation->run() == false) {
            $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        } else {*/
            $raw_data=[
                "user_id"=>$token_data->id,
                "warehouse_name"=>$_POST['warehouse_name'],
                "contact_person"=>$_POST['contact_person'],
                "phone_number"=>$_POST['phone_number'],
                "address"=>$_POST['address'],
                "created_at"=>date('Y-m-d H:i:s'),
                "created_by"=>$token_data->id
            ];
            $id = $this->db->insert('warehouse',$raw_data);
            $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
        // }
    }

    public function warehouse_edit_post($warehouse_id)
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);

        // Fetch token data and validate if necessary
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));

        $existing_warehouse_data = $this->db->get_where('warehouse', array('id' => $warehouse_id))->row_array();

        if (!$existing_warehouse_data) {
            $this->set_response_simple("Warehouse not found", 'Error..!', REST_Controller::HTTP_NOT_FOUND, FALSE);
            return;
        }

        $updated_data  = array(
            "user_id"=>$token_data->id,
            "warehouse_name" => isset($_POST['warehouse_name']) ? $_POST['warehouse_name'] : $existing_warehouse_data['warehouse_name'],
            "contact_person" => isset($_POST['contact_person']) ? $_POST['contact_person'] : $existing_warehouse_data['contact_person'],
            "phone_number" => isset($_POST['phone_number']) ? $_POST['phone_number'] : $existing_warehouse_data['phone_number'],
            "address" => isset($_POST['address']) ? $_POST['address'] : $existing_warehouse_data['address'],
            "updated_at" => date('Y-m-d H:i:s'),
            "updated_by" => $token_data->id 
        );

        // Update the warehouse record in the database
        $this->db->where('id', $warehouse_id);
        $this->db->update('warehouse', $updated_data );

        // Check if the update was successful
        if ($this->db->affected_rows() > 0) {
             // Fetch the updated warehouse data
            $updated_warehouse_data = $this->db->get_where('warehouse', array('id' => $warehouse_id))->row_array();
            
            // Include the updated warehouse data in the response
            $this->set_response_simple(($updated_warehouse_data == FALSE) ? [] : $updated_warehouse_data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
            //$this->response($updated_warehouse_data, REST_Controller::HTTP_OK);
        } else {
            $this->set_response_simple("Failed to update warehouse", 'Error..!', REST_Controller::HTTP_BAD_REQUEST, FALSE);
        }
    }

}

