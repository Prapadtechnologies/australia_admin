<?php
class User_model extends MY_Model {
	public $rules;
	public function __construct() {
		parent::__construct ();
		$this->table = 'users';
		$this->primary_key = 'id';
		$this->before_create[] = '_add_created_by';
		$this->before_update[] = '_add_updated_by';

		$this->_config ();
		$this->_form ();
		$this->_relations ();
	}
	protected function _add_created_by($data)
	{
	    $data['created_user_id'] = $this->ion_auth->get_user_id(); //add user_id
	    return $data;
	}
	protected function _add_updated_by($data)
	{
	    $data['updated_user_id'] = $this->ion_auth->get_user_id(); //add user_id
	    return $data;
	} 
	private function _config() {
		$this->timestamps = TRUE;
		$this->soft_deletes = TRUE;
		$this->delete_cache_on_save = TRUE;
	}
	public function update_walet($user_id,$amount,$description,$type='CREDIT')
	{
		$user = $this->user_model->where('id', $user_id)->get();
		if($type == 'CREDIT'){
		$balance = $user['wallet'] + floatval($amount);
		}elseif($type == 'DEBIT'){
		$balance = $user['wallet'] - floatval($amount);
		}
		$is_updated = $this->user_model->update([
                'id' => $user_id,
                'wallet' => $balance
            ], 'id');
		$this->load->model('wallet_transaction_model');
		 $id = $this->wallet_transaction_model->insert([
                          'user_id' => $user_id,
                          'type' => 'CREDIT',
                          'cash' => $amount,
                          'balance' => $balance,
                          'description' => $description,
                          'status' => 1
                      ]);
	}
	private function _relations() {
		$this->has_many_pivot ['groups'] = array (
				'foreign_model' => 'Group_model',
				'pivot_table' => 'users_groups',
				'local_key' => 'id',
				'pivot_local_key' => 'user_id',
				'pivot_foreign_key' => 'group_id',
				'foreign_key' => 'id',
				'get_relate' => FALSE
		);

		$this->has_many_pivot ['permissions'] = array (
				'foreign_model' => 'Permission_model',
				'pivot_table' => 'users_permissions',
				'local_key' => 'id',
				'pivot_local_key' => 'user_id',
				'pivot_foreign_key' => 'perm_id',
				'foreign_key' => 'id',
				'get_relate' => FALSE
		);
		
		
		$this->has_many['addresses'] = array(
		    'foreign_model' => 'Users_address_model',
		    'foreign_table' => 'users_address',
		    'local_key' => 'id',
		    'foreign_key' => 'user_id',
		    'get_relate' => FALSE
		);
	}
	private function _form() {
		$tables = $this->config->item('tables','ion_auth');
		$this->rules['creation'] = array (
				array (
						'lable' => 'First Name',
						'field' => 'first_name',
						'rules' => 'trim|required|min_length[5]',
				        'errors'=>array(
				            'required'=>'Please give at least 5 characters'
				        )
				    
				),
				array (
						'lable' => 'Last Name',
						'field' => 'last_name',
						'rules' => 'trim|required'
				),
				array (
						'lable' => 'Role',
						'field' => 'role[]',
						'rules' => 'trim|required'
				),
				array (
						'lable' => 'Phone Number',
						'field' => 'phone',
						'rules' => 'trim|required|min_length[10]|max_length[10]|regex_match[/^[0-9]{10}$/]',
				        'errors'=>array(
				            'min_length'=>'Please give minimum 10 digits number',
				            'max_length'=>'You can give maximum 10 digits number',
				            'regex_match'=>'Please give a valid number',
				        )
				),
				array (
						'lable' => 'email',
						'field' => 'email',
						'rules' => 'trim|required|valid_email',
                        'errors'=>array(
                            'valid_email'=>'Please give valid email!'
                        )
				),
				array (
						'lable' => 'Password',
						'field' => 'password',
						'rules' => 'trim|required|required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[confirm_password]',
				),
				array (
						'lable' => 'Confirm Password',
						'field' => 'confirm_password',
						'rules' => 'trim|required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password]',
    				    'errors'=>array(
    				        'matches'=>'Sorry!Password Not Matched!',
    				    )
				)
		);
		$this->rules['login'] = array(
		    array (
		        'lable' => 'Identity',
		        'field' => 'identity',
		        'rules' => 'trim|required',
		        'errors'=>array(
		            'required'=>'Please give password',
		        )
		    ),
		    array (
		        'lable' => 'Password',
		        'field' => 'password',
		        'rules' => 'trim|required',
		    ),
		);
		
		$this->rules['update'] = array (
		    array (
		        'lable' => 'First Name',
		        'field' => 'first_name',
		        'rules' => 'trim|required'
		    ),
		    array (
		        'lable' => 'Last Name',
		        'field' => 'last_name',
		        'rules' => 'trim|required'
		    ),
		    array (
		        'lable' => 'Role',
		        'field' => 'role[]',
		        'rules' => 'trim|required',
		        'errors'=>array(
		            'required'=>'Please give an role!'
		        )
		    ),
		    array (
		        'lable' => 'Phone Number',
		        'field' => 'phone',
		        'rules' => 'trim|required|min_length[10]|max_length[10]|regex_match[/^[0-9]{10}$/]',
		        'errors'=>array(
		            'min_length'=>'Please give minimum 10 digits number',
		            'max_length'=>'You can give maximum 10 digits number',
		            'regex_match'=>'Please give a valid number'
		        )
		    ),
		    array (
		        'lable' => 'email',
		        'field' => 'email',
		        'rules' => 'trim|required|valid_email',
                'errors'=>array(
                    'valid_email'=>'Please give valid email'
                )
		    ),
		);
		
		$this->rules['profile'] = array (
		    array (
		        'lable' => 'First Name',
		        'field' => 'fname',
		        'rules' => 'trim|required'
		    ),
		    array (
		        'lable' => 'Last Name',
		        'field' => 'lname',
		        'rules' => 'trim|required'
		    ),
		    array (
		        'lable' => 'Phone Number',
		        'field' => 'phone',
		        'rules' => 'trim|required|min_length[10]|max_length[10]|regex_match[/^[0-9]{10}$/]',
		        'errors'=>array(
		            'min_length'=>'Please give minimum 10 digits number',
		            'max_length'=>'You can give maximum 10 digits number',
		            'regex_match'=>'Please give a valid number',
		        )
		    ),
		    array (
		        'lable' => 'email',
		        'field' => 'email',
		        'rules' => 'trim|required|valid_email',
		        'errors'=>array(
		            'valid_email'=>'Please give valid email',
                   // 'is_unique' => 'email is already exist'
		        )
		    ),
		);
		$this->rules['reset'] = array (
		    array (
		        'lable' => 'Old Password',
		        'field' => 'opass',
		        'rules' => 'trim|required'
		    ),
		    array (
		        'lable' => 'New Password',
		        'field' => 'npass',
		        'rules' => 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[cpass]'
		    ),
		    array (
		        'lable' => 'Confirm Password',
		        'field' => 'cpass',
		        'rules' => 'trim|required'
		    ),
		);
		
	}
}

