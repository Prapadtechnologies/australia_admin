<?php

class Currency_model extends CI_Model
{
public function get_currency()
{
   $query = $this->db->get('currency');
   return $query->result_array();
}
public function save_currency_info($data) {
    $this->db->insert('currency', $data);
    
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return false; // Return false if insertion fails
    }
}
public function get_currency_by_id($category_id) {
    $query = $this->db->get_where('currency', array('id' => $category_id));
    return $query->row_array(); 
}
public function update_currency($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('currency', $data);
    
    return $this->db->affected_rows() > 0;
}
public function deletecurrency($category_id)
{
   if (!$category_id) {
     return false;
 }
 $this->db->where('id', $category_id);
 $this->db->delete('currency');
 if ($this->db->affected_rows() > 0) {
     return true;
 } else {
     return false; 
 }
}

}