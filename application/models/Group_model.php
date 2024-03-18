<?php

class Group_model extends MY_Model
{
    public $rules;
    public function __construct()
    {
        parent::__construct();
        $this->table = 'groups';
        $this->primary_key = 'id';
        $this->before_create[] = '_add_created_by';
        $this->before_update[] = '_add_updated_by';
        
        $this->_config();
        $this->_form();
        $this->_relations();
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
    public function _config(){
        $this->timestamps = TRUE;
        $this->soft_deletes = TRUE;
        $this->delete_cache_on_save = TRUE;
    }
    
    
    public function _relations() {
        
        $this->has_many_pivot['permissions'] = array(
            'foreign_model' => 'Permission_model',
            'pivot_table' => 'groups_permissions',
            'local_key' => 'id',
            'pivot_local_key' => 'group_id',
            'pivot_foreign_key' => 'perm_id',
            'foreign_key' => 'id',
            'get_relate' => FALSE
        );
    }
    
    public function _form(){
        $this->rules = array(
            array(
                'field' => 'name',
                'lable' => 'Name',
                'rules' => 'trim|required'
            ),
            array(
                'field' => 'desc',
                'lable' => 'Description',
                'rules' => 'trim|required'
            )
        );
    }
}

