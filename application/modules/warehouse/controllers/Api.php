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
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $target = $_GET['q'];
            //$where="lower('name') like '%".strtolower($target)."%'";
        $data = $this->db->select('*')
                ->order_by('created_at','desc')
                ->get('warehouse')
                ->result_array();
        $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
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
}

