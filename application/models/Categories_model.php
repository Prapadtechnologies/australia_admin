<?php

class Categories_model extends CI_Model
{
  public function get_categories()
  {
     $query = $this->db->get('categories');
     return $query->result_array();
 }
 public function save_category_info($data) 
 {

    $this->db->insert('categories', $data);
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return 0;
    }
}
public function update_category($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('categories', $data);
    
    return $this->db->affected_rows() > 0;
}

public function deleteCategory($category_id)
{
 if (!$category_id) {
   return false;
}
$this->db->where('id', $category_id);
$this->db->delete('categories');
if ($this->db->affected_rows() > 0) {
   return true;
} else {
   return false; 
}
}

public function get_categories_by_id($category_id) {
    $query = $this->db->get_where('categories', array('id' => $category_id));
    return $query->row_array(); 
}





































public function get_users()
{
    $query = $this->db->get('users');
    return $query->result_array();
}




}
