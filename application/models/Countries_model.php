<?php

class Countries_model extends CI_Model
{
public function get_countries()
{
   $query = $this->db->get('country');
   return $query->result_array();
}
public function save_country_info($data) {
    $this->db->insert('country', $data);
    
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return false; // Return false if insertion fails
    }
}
public function update_country($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('country', $data);
    
    return $this->db->affected_rows() > 0;
}
  public function get_countries_by_id($category_id) {
        $query = $this->db->get_where('country', array('id' => $category_id));
        return $query->row_array(); 
    }
     public function deletecountry($category_id)
 {
     if (!$category_id) {
               return false;
           }
           $this->db->where('id', $category_id);
           $this->db->delete('country');
           if ($this->db->affected_rows() > 0) {
               return true;
           } else {
               return false; 
           }
       }
}