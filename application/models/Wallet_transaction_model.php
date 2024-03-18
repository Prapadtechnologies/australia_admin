<?php

class Wallet_transaction_model extends MY_Model
{
    public $rules;
    public function __construct()
    {
        parent::__construct();
        $this->table = 'wallet_transactions';
        $this->primary_key = 'id';
        
        $this->_config();
        $this->_form();
        $this->_relations();
    }
    
    public function _config(){
        $this->timestamps = TRUE;
        $this->soft_deletes = TRUE;
        $this->delete_cache_on_save = TRUE;
    }
    
    
    public function _relations() {
        $this->has_one['bank'] = array('Bank_details_model', 'id', 'bank_id');
    }
    
    public function _form(){
        
    }
    
    public function all($vendor_id = NULL, $start_date = NULL, $end_date = NULL)
    {
        
        $this->_query_all($vendor_id, $start_date, $end_date);
        $this->db->order_by('created_at', 'DESC');
        $rs     = $this->db->get($this->table);
        return $result = $rs->result_array();
    }
    
    private function _query_all($vendor_id = NULL, $start_date = NULL, $end_date = NULL)
    {
        $this->load->model(array('user_model'));
        
        $user_table       = '`' . $this->user_model->table . '`';
        $user_primary_key = '`' . $this->user_model->primary_key . '`';
        $user_foreign_key = '`' . 'user_id' . '`';
        
        $primary_key = '`' . $this->primary_key . '`';
        $table       = '`' . $this->table . '`';
        
        $str_select_vendor = '';
        foreach (array('type', 'user_id', 'cash', 'txn_id', 'id', 'order_id', 'balance', 'description', 'created_at', 'status') as $v)
        {
            $str_select_vendor .= "$table.`$v`,";
        }
        
        $this->db->select($str_select_vendor);
        $this->db->join($user_table, "$user_table.$user_primary_key=$table.$user_foreign_key", 'left');
        if( ! empty($start_date) && ! empty($end_date) ){
            $this->db->or_where('date(`wallet_transactions`.`created_at`) BETWEEN "'. date('Y-m-d H:i:s', strtotime($start_date)). '" and "'. date('Y-m-d H:i:s', strtotime($end_date)).'"');
        }
        $this->db->where("$table.`user_id`=", $vendor_id);
        //$this->db->where("$table.`status`=", '1');
        $this->db->where("$table.`deleted_at` =", NULL);
        return $this;
    }
}

