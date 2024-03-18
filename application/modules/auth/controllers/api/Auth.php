<?php
require APPPATH . '/libraries/MY_REST_Controller.php';
require APPPATH . '/vendor/autoload.php';

use Firebase\JWT\JWT;

class Auth extends MY_REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('group_model');
        $this->load->helper('date');
        $this->load->model('social_auth_model');
    }

    /**
     *
     * @author Mehar
     *         Login Api
     */
    public function login_post()
    {
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $this->form_validation->set_rules($this->user_model->rules['login']);
        if ($this->form_validation->run() == FALSE) {
            $this->set_response(validation_errors());
        } else {
            $identity = strtoupper(html_escape($this->input->post('identity')));
            $this->ion_auth_model->identity_column = 'email';
            $password = html_escape($this->input->post('password'));
            $login_one = $this->ion_auth->login($identity, $password);
            if (! $login_one) {
                $this->ion_auth_model->identity_column = 'unique_id';
                $this->config->set_item('identity', 'unique_id');
                $login_two = $this->ion_auth->login($identity, $password);
                if ($login_two) {
                    $user_data = $this->user_model->fields('unique_id,username,email,phone')
                        ->where('id', $this->ion_auth->get_user_id())
                        ->get();
                    $timestamp = now();
                    $token = array(
                        "id" => $this->ion_auth->get_user_id(),
                        "userdetail" => $user_data,
                        "time" => $timestamp
                    );
                    $jwt = JWT::encode($token, $this->config->item('jwt_key'));
                    $this->set_response_simple([
                        "token" => $jwt
                    ], 'Login SuccessFully.!', http_response_code(), TRUE);
                } else {
                    $this->set_response_simple($this->ion_auth->errors(), 'Failed', http_response_code(), FALSE);
                }
            } else {
                $user_data = $this->user_model->fields('unique_id,username,email,phone')
                    ->where('id', $this->ion_auth->get_user_id())
                    ->get();
                $timestamp = now();
                $token = array(
                    "id" => $this->ion_auth->get_user_id(),
                    "userdetail" => $user_data,
                    "time" => $timestamp
                );
                $jwt = JWT::encode($token, $this->config->item('jwt_key'));
                $this->set_response_simple([
                    "token" => $jwt
                ], 'Login SuccessFully.!', http_response_code(), TRUE);
            }
        }
    }
    
    
    /**
     * @desc To login
     * @author Mehar
     * 
     * @param string $type
     */
    public function social_login_post($type = 'google'){
        if($type == 'google'){
            $_POST = json_decode(file_get_contents("php://input"), TRUE);
            $is_auth_id_exist = $this->social_auth_model->where('auth_id', $this->input->post('auth_id'))->get();
            if(empty($is_auth_id_exist)){
                $social_id = $this->social_auth_model->insert([
                    'auth_id' => $this->input->post('auth_id'),
                    'auth_token' => $this->input->post('auth_token'),
                    'mail' => $this->input->post('mail'),
                    'name' => $this->input->post('name'),
                    'mobile' => $this->input->post('mobile'),
                ]);
                $group = $this->group_model->where('name', 'user')->get();
                if(! empty($group)){
                    $unique_id = generate_serial_no($group['code'], 4, $group['last_id']);
                    $this->group_model->update([
                        'last_id' => $group['last_id'] + 1
                    ], $group['id']);
                    $email = strtolower($this->input->post('mail'));
                    $mobile = strtolower($this->input->post('mobile'));
                    $identity = ($this->config->item('identity', 'ion_auth') === 'email') ? $email : $unique_id;
                    $additional_data = array(
                        'first_name' => $this->input->post('name'),
                        'unique_id' => $unique_id,
                        'phone' => $mobile,
                        'active' => 1
                    );
                    $group_id[] = $group['id'];
                    $password = rand();
                    $user_id = $this->ion_auth->register($identity, $password, $email, $additional_data, $group_id);
                    if($user_id){
                        $this->social_auth_model->update([
                            'id' => $social_id,
                            'unique_id' => $unique_id,
                            'password' => base64_encode($password),
                        ], 'id');
                        //$login = $this->db->where('unique_id', $unique_id)->or_where('phone', $mobile)->get('users')->row_array();
                        $login = $this->db->where('unique_id', $unique_id)->get('users')->row_array();
                        if(! empty($login)){
                            $timestamp = now();
                            $token = array(
                                "id" => $login['id'],
                                "userdetail" => $login,
                                "time" => $timestamp
                            );
                            $jwt = JWT::encode($token, $this->config->item('jwt_key'));
                            $this->set_response_simple([
                                "token" => $jwt
                            ], 'Login SuccessFully.!', http_response_code(), TRUE);
                        }
                    }else{
                        $user = $this->user_model->where('email', $email)->get();
                        $timestamp = now();
                        $token = array(
                            "id" => $user['id'],
                            "userdetail" => $user,
                            "time" => $timestamp
                        );
                        $jwt = JWT::encode($token, $this->config->item('jwt_key'));
                        $this->set_response_simple([
                            "token" => $jwt
                        ], 'Login SuccessFully.!', http_response_code(), TRUE);
                    }
                }
                
            }else{
                $password = base64_decode($is_auth_id_exist['password']);
                $login = $this->user_model->where('unique_id', $is_auth_id_exist['unique_id'])->get();
                if($login){
                    $timestamp = now();
                    $token = array(
                        "id" => $login['id'],
                        "userdetail" => $login,
                        "time" => $timestamp
                    );
                    $jwt = JWT::encode($token, $this->config->item('jwt_key'));
                    $this->set_response_simple([
                        "token" => $jwt
                    ], 'Login SuccessFully.!', http_response_code(), TRUE);
                }
            }
        }
    }
    
    /**
     * @desc Forgot password Recovery
     * @param string emial
     * @author Mehar
     */
    public function forgot_password_post(){
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $this->form_validation->set_rules('identity', 'Identity', 'trim|required');
        if ($this->form_validation->run() == FALSE) {
            $this->set_response(validation_errors());
        } else {
            $identity_column = $this->config->item('identity', 'ion_auth');
            $identity = $this->ion_auth->where($identity_column, $this->input->post('identity'))->users()->row();
            if (empty($identity) || $identity == null) {
                if ($this->config->item('identity', 'ion_auth') != 'email') {
                    $this->set_response_simple(NULL, 'Identity not found', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                } else {
                    $this->set_response_simple(NULL, 'Email not found', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                }
            }else{
                //$forgotten = $this->ion_auth->forgotten_password($identity->{$this->config->item('identity', 'ion_auth')});

                $email=$identity->{$this->config->item('identity', 'ion_auth')};
                $rand_code=rand(1000,9999);
                $to=$email;
                $message = $this->load->view($this->config->item('email_templates', 'ion_auth').'forgot_password_app.tpl.php', ['rand_code' => $rand_code,'identity'=>$email], true);
                $subject='Daily Grows - Forgotten Password Verification';
                $res=sendEmail(NULL,$to, $subject, $message);
                $user_unique_id['otp']=$rand_code;
                $user_unique_id['identity']=$email;
                if ($res) {
                    $this->set_response_simple($user_unique_id, 'Check your email for OTP', REST_Controller::HTTP_OK, TRUE);
                } else {
                    $this->set_response_simple(NULL, 'Email not sent', REST_Controller::HTTP_NO_CONTENT, FALSE);
                }
            }
        }
    }
    public function reset_password_post(){
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $this->form_validation->set_rules('identity', 'Identity', 'trim|required');
        $this->form_validation->set_rules('new', 'Password', 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[new_confirm]');
        $this->form_validation->set_rules('new_confirm', 'Confirm Password', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->set_response(validation_errors(), REST_Controller::HTTP_NO_CONTENT, FALSE);
        } else {
            $identity_column = $this->config->item('identity', 'ion_auth');
            $identity = $this->ion_auth->where($identity_column, $this->input->post('identity'))->users()->row();
            if (empty($identity) || $identity == null) {
                if ($this->config->item('identity', 'ion_auth') != 'email') {
                    $this->set_response_simple(NULL, 'Identity not found', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                } else {
                    $this->set_response_simple(NULL, 'Email not found', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                }
            }else{

                $email=$identity->{$this->config->item('identity', 'ion_auth')};
                $change = $this->ion_auth->reset_password($email, $this->input->post('new'));
                if ($change) {
                    $this->set_response_simple($user_unique_id, $this->ion_auth->messages(), REST_Controller::HTTP_OK, TRUE);
                } else {
                    $this->set_response_simple(NULL, $this->ion_auth->errors(), REST_Controller::HTTP_NO_CONTENT, FALSE);
                }
            }
        }
    }

    public function verify_post(){
        $this->set_response_simple([
            "token" => $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'))
        ], 'verify', http_response_code(), TRUE);
    }
    public function logout_post()
    {
        $this->validate_token($this->input->get_request_header('X_AUTH_TOKEN'));
        //print_r($res);die;
        return $this->set_response(new stdclass(),"Logout SuccessFully.",MY_REST_Controller::HTTP_OK,TRUE);
    }
    public function create_user_post($id = 20){
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $group = $this->group_model->where('id', $id)->get();
        if(! empty($group)){
            $referal_id = NULL;
            $referal_found='1';
            if($_POST['referal_id'] != ''){
                $refer=$this->db->select('id')->get_where('users',['unique_id'=>$_POST['referal_id']])->row_array();
                if(count($refer)>0){
                    $referal_id=$refer['id'];    
                    $referal_found='1';
                }else{
                    $referal_found='0';
                }
            }
            if($referal_found == '1'){
                $unique_id = generate_serial_no($group['code'], 4, $group['last_id']);
                $this->group_model->update([
                    'last_id' => $group['last_id'] + 1
                ], $group['id']);
                $email = strtolower($this->input->post('email'));
                $identity = ($this->config->item('identity', 'ion_auth') === 'email') ? $email : $unique_id;
                $additional_data = array(
                    'first_name' => $this->input->post('name'),
                    'unique_id' => $unique_id,
                    'phone' => $this->input->post('mobile'),
                    'status' => 2
                );
                $group_id[0] = $id;
                $user_id = $this->ion_auth->register($identity, (empty($this->input->post('password')))? '1234': $this->input->post('password'),$email, $additional_data, $group_id);
                if($user_id){
                    //$this->db->insert('users_groups', ['user_id' => $user_id, 'group_id' => $id]);
                    $user_unique_id = $this->user_model->fields('unique_id')->where('id', $user_id)->get();
                    if (!file_exists(base_url().'uploads/profile_image/')) {
                        mkdir(base_url().'uploads/profile_image/', 0777, true);
                    }
                    copy('./assets/img/user-app.jpg', './uploads/profile_image/profile_'.$user_unique_id.'.jpg');
                    //file_put_contents(base_url()."/uploads/profile_image/profile_$user_unique_id.jpg", base64_decode($this->input->post('image')));
                    $rand_code=rand(1000,9999);
                    //$message = $this->load->view('emails/verify_user', ['rand_code' => $rand_code], TRUE);
                    $to=$email;
                    $message = $this->load->view($this->config->item('email_templates', 'ion_auth').'verify_user.tpl.php', ['rand_code' => $rand_code,'identity'=>$email], true);
                    $subject='Daily Grows - Account Activation';
                    $res=sendEmail(NULL,$to, $subject, $message);
                    $user_unique_id['verify_code']=$rand_code;
                    $this->set_response_simple($user_unique_id, $this->ion_auth->messages(), REST_Controller::HTTP_OK, TRUE);
                }else{
                    $this->set_response_simple($user_id, $this->ion_auth->errors(), REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
                }
            }else{
                $this->set_response_simple(null, 'Invalid Referal ID!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
            }
        }else{
            $this->set_response_simple(null, 'Group is not available!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        }
    }
    
    public function roles_get(){
        $data = $this->group_model->fields('id, name')->where('status', 1)->get_all();
        $this->set_response_simple($data, "List of roles", REST_Controller::HTTP_OK, TRUE);
    }
    public function activate_user_post(){
        $_POST = json_decode(file_get_contents("php://input"), TRUE);
        $this->load->model('wallet_transaction_model');
        $unique_id=$this->input->post('unique_id');
        if($unique_id != ''){
            $user_data = $this->user_model->where('unique_id', $unique_id)->get();
            if($user_data){
                $this->user_model->update(['status'=>1],$user_data['id']);
                $referal_id=$user_data['referal_id'];
                if($referal_id != ''){
                    $wallet = $this->user_model->where('id', $referal_id)->fields('wallet,unique_id,id')->as_array()->get();
                    $amount=$this->setting_model->where('key', 'pay_per_referal')->get()['value'];
                    $id = $this->wallet_transaction_model->insert([
                        'user_id' => $wallet['id'],
                        //'type' => 'CREDIT',
                        'credit' => $amount,
                        'balance' => floatval($wallet['wallet']) + $amount,
                        'transaction_id'=>'',
                        'transaction_type' => 'referrer',
                        'title' => get_transaction_type('referrer'),
                        'reference' => $wallet['unique_id'],
                        'description' => 'You got referal amount.',
                    ]);
                    $this->user_model->update(['wallet'=>(floatval($wallet['wallet']) + $amount)],$wallet['id']);
                }
                $this->set_response_simple($unique_id, 'SuccessFully Activated', REST_Controller::HTTP_OK, TRUE);
            }else{
                $this->set_response_simple(null, 'Invalid Unique Id!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
            }
        }else{
            $this->set_response_simple(null, 'Unique Id is Required!', REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION, FALSE);
        }

    }
}

