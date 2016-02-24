<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Admin_model class.
 * 
 * @extends CI_Model
 */
class Admin_model extends CI_Model {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function __construct() 
	{
		parent::__construct();
		$this->load->database();
	}

	/**
	 * Get data for main page of admin panel
	 */
	public function get_comments($limit)
	{
		//get comments
		$this->db->select('c.id, users.login, c.comment_text, c.comment_created');
		$this->db->from('comments as c');
		$this->db->join('users', 'users.id = c.user_id');
		$this->db->order_by('c.comment_created', 'DESC');
		$this->db->limit($limit);
		$query = $this->db->get();
		
		return $query->result_array();
	}

	public function get_requests($limit)
	{
		//get requests
		$this->db->select('o.id, o.order_text, o.order_created, users.login, mediafiles.media_link');
		$this->db->from('order_for_assessment as o');
		$this->db->join('users', 'users.id = o.user_id');
		$this->db->join('mediafiles', 'mediafiles.id = o.photo_id');
		$this->db->order_by('o.order_created', 'DESC');
		$this->db->limit($limit);
		$query = $this->db->get();

        return $query->result_array();
	}

	public function get_cars()
	{
		//get cars
		$query = $this->db->query('SELECT cars_model.id, cars_model.model, cars_mark.mark as manufacture FROM cars_model JOIN cars_mark ON cars_model.mark_id = cars_mark.id');
		//$query = $this->db->get();
		
		return $query->result_array();
	}

	// public function add_car($data)
	// {
	// 	//add car in DB
	// 	$this->db->insert('cars_model', $item);
		
	// 	return $query->result_array();
	// }

	public function create_content() 
	{	
		//add content
		if ($this->input->post('status') == 'on')
		{
			$status = $this->config->item('STATUS_ON');
		}
		else
		{
			$status = $this->config->item('STATUS_OFF');
		}

		$data = array(
			'title'   		=> $this->input->post('title'),
			'content_text'  => $this->input->post('text'),
			'meta'   		=> $this->input->post('meta'),
			'category'  	=> $this->input->post('category'),
			'status'  		=> $status,
			'address'  		=> $this->category_url().$this->input->post('address'),
			);
		
		return $this->db->insert('Content', $data);
	}

	public function create_example() 
	{	
		//add example
		$data = array(
			'category'  	=> $this->input->post('category'),
			'about'   		=> $this->input->post('text'),
			'photo_before'  => $this->input->post('foto_before'),
			'photo_after'	=> $this->input->post('foto_after'),
			'additionally'  => $this->input->post('additionally'),
			);
		
		return $this->db->insert('example_works', $data);
	}

	public function delete_data($id, $table)
	{
		//delete data
		$this->db->from($table);
		$this->db->where('id', $id);
		$query = $this->db->delete();
		
		return TRUE;
	}

	public function category_url(){

		$data = $this->input->post('category');

		switch ($data) {
			case 'Главная':
				$url = 'pdr/';
				break;

			case 'Примеры работ':
				$url = 'pdr/examples/';
				break;

			case 'Обучение':
				$url = 'pdr/education/';
				break;
			
			case 'Инструмент':
				$url = 'pdr/#/';
				break;

			case 'Оценить вмятину':
				$url = 'pdr/#/';
				break;

			case 'Контакты':
				$url = 'pdr/contact/';
				break;
		}
		
		return $url;
	}

	public function get_article($id){
		
		if ($id != null) 
		{
			$this->db->where('id',$id);
			$query = $this->db->get('Content')->row_array();
		}
		
		else {
			$query = $this->db->get('Content')->result_array();
			}

		return $query;

	}

	public function edit_content($id) 
	{	
		
		if ($this->input->post('status') == 'on')
		{
			$status = $this->config->item('STATUS_ON');
		}
		else
		{
			$status = $this->config->item('STATUS_OFF');
		}

		$data = array(
			'title'   		=> $this->input->post('title'),
			'content_text'  => $this->input->post('text'),
			'meta'   		=> $this->input->post('meta'),
			'category'  	=> $this->input->post('category'),
			'status'  		=> $status,
			'address'  		=> $this->input->post('address'),
			);
		$this->db->where('id',$id);
		
		$this->db->update('Content', $data);
		
	}
}