<?php

class Sizes_types_model extends CI_Model
{

public function get_sizes_types()
{
    $query = $this->db->get('size_types');
    return $query->result_array();
}
 public function save_size_types_info($data) {

    $this->db->insert('size_types', $data);
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return 0;
    }
}
 public function get_size_types_by_id($category_id) {
        $query = $this->db->get_where('size_types', array('id' => $category_id));
        return $query->row_array(); 
    }
    public function update_size_types($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('size_types', $data);
    
    return $this->db->affected_rows() > 0;
}
 public function deletesize_types($category_id)
 {
     if (!$category_id) {
               return false;
           }
           $this->db->where('id', $category_id);
           $this->db->delete('size_types');
           if ($this->db->affected_rows() > 0) {
               return true;
           } else {
               return false; 
           }
       }
}