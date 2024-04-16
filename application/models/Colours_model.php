 <?php

class Colours_model extends CI_Model
{

 public function get_colours()
 {
     $query = $this->db->get('colours');
     return $query->result_array();
 }
 public function save_color_info($data) {
    $this->db->insert('colours', $data);
    return $this->db->insert_id(); // Simplified return statement
}

  public function get_colours_by_id($category_id) {
        $query = $this->db->get_where('colours', array('id' => $category_id));
        return $query->row_array(); 
    }
public function update_colour($category_id, $data)
{
    $this->db->where('id', $category_id);
    $this->db->update('colours', $data);
    
    return $this->db->affected_rows() > 0;
}

 public function deleteColour($category_id)
 {
     if (!$category_id) {
               return false;
           }
           $this->db->where('id', $category_id);
           $this->db->delete('colours');
           if ($this->db->affected_rows() > 0) {
               return true;
           } else {
               return false; 
           }
       }

}