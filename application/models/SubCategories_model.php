<?php

class SubCategories_model extends CI_Model
{

public function get_subcategories_with_categories()
{
    $this->db->select('sub_categories.*, categories.name AS category_name');
    $this->db->from('sub_categories');
    $this->db->join('categories', 'sub_categories.category_id = categories.id');
    $query = $this->db->get();
    return $query->result_array();
}

  public function get_subcategory_by_id($category_id) {
        $query = $this->db->get_where('sub_categories', array('id' => $category_id));
        return $query->row_array(); 
    }
     public function deletesubCategory($category_id)
 {
     if (!$category_id) {
               return false;
           }
           $this->db->where('id', $category_id);
           $this->db->delete('sub_categories');
           if ($this->db->affected_rows() > 0) {
               return true;
           } else {
               return false; 
           }
       }
    public function update_subcategory($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('sub_categories', $data);
    
    return $this->db->affected_rows() > 0;
}
public function save_subcategory_info($data) {
    $this->db->insert('sub_categories', $data);
    
    if ($this->db->affected_rows() > 0) {
        return $this->db->insert_id();
    } else {
        return false; // Return false if insertion fails
    }
}

}
?>