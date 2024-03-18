<?php

class Common extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        /*if (! $this->ion_auth->logged_in())
            redirect('auth/login');*/
        
        $this->load->model('notifications_model');
    }

    /**
     * Notifications crud
     *
     * @author Mahesh
     * @param string $type
     * @param string $target
     */
    public function notifications($type = 'r',$user_id = '')
    {
        /*if (! $this->ion_auth_acl->has_permission('category'))
            redirect('admin');*/
        
            if ($type == 'c') {
            $this->form_validation->set_rules($this->notifications_model->rules);
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();die;
            } else {
                $id = $this->notifications_model->insert([
                    'user_id' => $this->input->post('user_id'),
                    'title' => $this->input->post('title'),
                    'desc' => $this->input->post('desc')
                ]);
            }
        } elseif ($type == 'r') {
            $notifications = $this->notifications_model->fields('id,title,desc')->where('user_id',$user_id)->order_by('id', 'DESC')->get_all();
            echo json_encode($notifications);
        } elseif ($type == 'd') {
            echo $this->category_model->delete(['id' => $this->input->post('id')]);
        }
    }
    public function sendMail_com($email, $sub, $message)
    {
     return sendEmail(NULL,$email, $sub, $message);
    }
}