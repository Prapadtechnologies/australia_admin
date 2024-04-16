<?php

class Size_model extends CI_Model
{
    public function get_sizes_with_sizestypes()
    {
        $this->db->select('s.*,st.size_type as size_type_name'); 
        $this->db->from('sizes s');
        $this->db->join('size_types st', 'st.id = s.size_type','left');
        $query = $this->db->get();
        return $query->result_array();
    }
 public function save_size_info($data) {

    $this->db->insert('sizes', $data);
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return 0;
    }
}
 public function get_size_by_id($category_id) {
        $query = $this->db->get_where('sizes', array('id' => $category_id));
        return $query->row_array(); 
    }
    public function update_size($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('sizes', $data);
    
    return $this->db->affected_rows() > 0;
}
 public function deletesize($category_id)
 {
     if (!$category_id) {
               return false;
           }
           $this->db->where('id', $category_id);
           $this->db->delete('sizes');
           if ($this->db->affected_rows() > 0) {
               return true;
           } else {
               return false; 
           }
       }
}