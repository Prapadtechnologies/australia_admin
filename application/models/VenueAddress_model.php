<?php

class VenueAddress_model extends CI_Model
{
    public function get_venue_address()
    {
        $query = $this->db->get('venue_address');
        return $query->result_array();
    }
    public function save_venue_address_info($data)
    {
        $this->db->insert('venue_address', $data);
        return $this->db->affected_rows() > 0;
    }
    public function get_venue_address_by_id($category_id)
    {
        $query = $this->db->get_where('venue_address', ['id' => $category_id]);
        return $query->row_array();
    }
    public function update_venue_address($category_id, $data)
    {
        $this->db->where('id', $category_id);
        $this->db->update('venue_address', $data);

        return $this->db->affected_rows() > 0;
    }
    public function deletevenue_address($category_id)
    {
        if (!$category_id) {
            return false;
        }
        $this->db->where('id', $category_id);
        $this->db->delete('venue_address');
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }
}
?>