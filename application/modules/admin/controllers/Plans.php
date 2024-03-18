<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Dashboard.php
 *
 * @package     CI-ACL
 * @author      Steve Goodwin
 * @copyright   2015 Plumps Creative Limited
 */
class Plans extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->template = 'template/admin/main';
        
        if (! $this->ion_auth->logged_in())
            redirect('auth/login');
        
            //$this->load->model('wallet_transaction_model');
    }
    public function index()
    {
    	$this->data['title'] = 'Plans';
        $this->data['content'] = 'admin/plans/index';
        $this->data['plans']=$this->db->where('status','1')->get('plans')->result_array();

        $this->_render_page($this->template, $this->data);
    }
    public function addplan()
    {
    	$this->form_validation->set_rules('plan_name', 'Plan Name', 'required|trim|is_unique[plans.plan_name]');
        $this->form_validation->set_rules('plan_duration', 'Plan Duration', 'required|trim');
        $this->form_validation->set_rules('min_amount', 'Min Amount', 'required|trim');
        $this->form_validation->set_rules('interest', 'Interest', 'required|trim');
        $this->form_validation->set_rules('interest_for', 'Interest for', 'required|trim');

        if ($this->form_validation->run() === FALSE) {
        	//print_r($_POST);die;
        	//redirect('plans');
        	$this->index();
        } else {
        	$this->db->insert('plans',$_POST);
        	$this->session->set_flashdata('message', 'Successfully Plan Added');
            redirect("plans", 'refresh');
        }
    }
}