<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Dashboard.php
 *
 * @package     CI-ACL
 * @author      Steve Goodwin
 * @copyright   2015 Plumps Creative Limited
 */
class Dashboard extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        
        if (! $this->ion_auth->logged_in())
            redirect('auth/login');
        
            $this->load->model('wallet_transaction_model');
    }

    public function index()
    {
        $this->data['users_groups']           =   $this->ion_auth->get_users_groups()->result();
        $this->data['users_permissions']      =   $this->ion_auth_acl->build_acl();
        $this->data['title'] = 'Dashboard';
        $this->data['content'] = 'admin/dashboard';
        $this->_render_page($this->template, $this->data);
    }
    
    public function sample(){
        $this->data['title'] = 'Sample';
        $this->data['content'] = 'admin/sample';
        $this->_render_page($this->template, $this->data);
    }
    
    public function wallet(){
        $this->data['title'] = 'Admin Wallet Transactions';
        $this->data['content'] = 'admin/admin/wallet';
        $this->data['transactions'] = $this->wallet_transaction_model->where('user_id', $this->ion_auth->get_user_id() )->order_by('id', 'DESC')->get_all();
        $this->_render_page($this->template, $this->data);
    }

}
?>