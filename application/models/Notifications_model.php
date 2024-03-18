<?php

class Notifications_model extends MY_Model
{
    public $rules;
    public $foreign_key;
    public function __construct()
    {
        parent::__construct();
        $this->table = 'notifications';
        $this->primary_key = 'id';
        $this->foreign_key = 'user_id';
        /*$this->before_create[] = '_add_created_by';
        $this->before_update[] = '_add_updated_by';*/
        
       $this->_config();
       $this->_form();
       $this->_relations();
    }
   /* protected function _add_created_by($data)
    {
        $data['created_user_id'] = $this->ion_auth->get_user_id(); //add user_id
        return $data;
    }
    protected function _add_updated_by($data)
    {
        $data['updated_user_id'] = $this->ion_auth->get_user_id(); //add user_id
        return $data;
    } */
    public function _config() {
        $this->timestamps = TRUE;
        $this->soft_deletes = TRUE;
        $this->delete_cache_on_save = TRUE;
    }
    
    public function _relations(){
        $this->has_one['user'] = array('User_model', 'id', 'user_id');
    }

    public function _form(){
        $this->rules = array(
            array (
                'lable' => 'User',
                'field' => 'user_id',
                'rules' => 'required'
            ),
            array (
                'lable' => 'Title',
                'field' => 'title',
                'rules' => 'required'
            ),
            array (
                'lable' => 'Description',
                'field' => 'desc',
                'rules' => 'required'
            ),
        );
    }
}

