<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Master extends MY_REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('vendor_list_model');
        $this->load->model('news_model');
        $this->load->model('users_address_model');
        $this->load->model('location_model');
        $this->load->model('setting_model');
        $this->load->model('user_service_model');
        $this->load->model('vendor_banner_model');
    }

    /**
     * User address
     *
     * To Manage address
     *
     * @author Trupti
     * @param string $type
     */
    public function user_address_post($type = 'r')
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        if ($type == 'c') {
            $this->form_validation->set_rules($this->users_address_model->rules);
            if ($this->form_validation->run() == false) {
                $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
            } else {
                $v = $this->location_model->where('latitude', $this->input->post('latitude'))
                    ->where('longitude', $this->input->post('longitude'))
                    ->get();
                if ($v != '') {
                    $l_id = $v['id'];
                } else {
                    $l_id = $this->location_model->insert([
                        'latitude' => $this->input->post('latitude'),
                        'longitude' => $this->input->post('longitude'),
                        'address' => $this->input->post('address')
                    ]);
                }

                $id = $this->users_address_model->insert([
                    'user_id' => $token_data->id,
                    'name' => $this->input->post('name'),
                    'phone' => $this->input->post('phone'),
                    'email' => $this->input->post('email'),
                    'address' => $this->input->post('address'),
                    'location_id' => $l_id
                ]);
                $this->set_response_simple($id, 'Success..!', REST_Controller::HTTP_CREATED, TRUE);
            }
        } elseif ($type == 'r') {
            $data = $this->users_address_model->with_location('fields: id, address, latitude, longitude')->fields('id, user_id, name, phone, email, address, location_id')->where('user_id', $token_data->id)->get_all();
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif ($type == 's') {
            $data = $this->users_address_model->fields('id, user_id, name, phone, email, address, location_id')->get('id', $this->input->post('id'));
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        } elseif ($type == 'u') {
            $this->form_validation->set_rules($this->users_address_model->rules);
            if ($this->form_validation->run() == FALSE) {
                $this->set_response_simple(validation_errors(), 'Validation Error', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
            } else {
                $v = $this->location_model->where('latitude', $this->input->post('latitude'))
                    ->where('longitude', $this->input->post('longitude'))
                    ->get();
                if ($v != '') {
                    $l_id = $v['id'];
                } else {
                    $l_id = $this->location_model->insert([
                        'latitude' => $this->input->post('latitude'),
                        'longitude' => $this->input->post('longitude'),
                        'address' => $this->input->post('address')
                    ]);
                }
                $ll = $this->users_address_model->update([
                    'id' => $this->input->post('id'),
                    'user_id' => $token_data->id,
                    'name' => $this->input->post('name'),
                    'phone' => $this->input->post('phone'),
                    'email' => $this->input->post('email'),
                    'address' => $this->input->post('address'),
                    'location_id' => $l_id
                ], 'id');
                $this->set_response_simple($ll, 'Success..!', REST_Controller::HTTP_ACCEPTED, TRUE);
            }
        } elseif ($type == 'd') {
            $ll = $this->users_address_model->delete([
                'id' => $this->input->post('id')
            ]);
            $this->set_response_simple($ll, 'Deleted..!', REST_Controller::HTTP_OK, TRUE);
        }
    }

    /**
     * To get the User Dettails
     *
     * @author Mahesh
     *        
     */
    public function user_details_get()
    {
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $this->load->model('user_model');
        $result = $this->user_model->order_by('id', 'DESC')
            ->fields('id,unique_id,first_name,last_name,email,phone, wallet')
            ->with_groups('fields:name,id')
            ->where('id', $token_data->id)
            ->get();
        $this->set_response_simple(($result == FALSE) ? FALSE : $result, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
    
    /**
     * @desc Manage profile
     * 
     * @author Mehar
     */
    public function profile_post($type = 'r'){
        $token_data = $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        $this->load->model('user_model');
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        if($type == 'r'){
            $data = $this->user_model
            ->fields('id,unique_id,first_name,last_name,email,phone, wallet')
            ->with_groups('fields:name,id')
            ->where('id', $token_data->id)
            ->get();
            if (file_exists('./uploads/profile_image/profile_' . $data['unique_id'] . '.jpg')) {
            $data['image'] = base_url() . 'uploads/profile_image/profile_' . $data['unique_id'] . '.jpg';
                    }else{
                    $data['image'] = base_url() . 'assets/img/user-app.png';
                    }
            
            $this->set_response_simple(($data == FALSE) ? FALSE : $data, 'Success..!', REST_Controller::HTTP_OK, TRUE);
        }elseif($type == 'u'){
            $is_updated = $this->user_model->update([
                'id' => $token_data->id,
                'first_name' => $this->input->post('first_name'),
                'last_name' => $this->input->post('last_name'),
                'email' => $this->input->post('email'),
                'phone' => $this->input->post('phone'),
            ], 'id');
            if($this->input->post('image')){
            file_put_contents("./uploads/profile_image/profile_".$this->input->post('unique_id').".jpg", base64_decode($this->input->post('image')));
            }
            if($is_updated){
                $this->set_response_simple(($is_updated == FALSE) ? FALSE : $is_updated, 'Success..!', REST_Controller::HTTP_ACCEPTED, TRUE);
            }else {
                $this->set_response_simple(($is_updated == FALSE) ? FALSE : $is_updated, 'Failed..!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, TRUE);
            }
        }
    }

    public function payment_settings_get()
    {
        $result['pay_per_vendor'] = $this->setting_model->where('key', 'pay_per_vendor')->get()['value'];
        $result['vendor_validation'] = $this->setting_model->where('key', 'vendor_validation')->get()['value'];
        $this->set_response_simple(($result == FALSE) ? FALSE : $result, 'Success..!', REST_Controller::HTTP_OK, TRUE);
    }
}

