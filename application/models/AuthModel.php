<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AuthModel extends CI_Model {

	public function getAdminByUsername($username) {
		$this->db->where('username', $username);
		$this->db->where('admin_hide', 0);
		return $this->db->get('ms_admin')->row_object();
	}
	public function getTeacherByUsername($username) {
		$this->db->where('teacher_username', $username);
		$this->db->where('teacher_hide', 0);
		return $this->db->get('ms_teacher')->row_object();
	}
	public function checkToken($access_token) {
		$this->db->where('access_token', $access_token);
		return $this->db->get('ms_token')->row_object();
	}
	public function registToken($data) {
		return $this->db->insert('ms_token', $data);
	}
	public function deleteToken($access_token) {
		$this->db->where('access_token', $access_token);
		return $this->db->delete('ms_token');
	}
	public function getStudentByNis($nis) {
		$this->db->where('student_nis', $nis);
		$this->db->where('student_hide', 0);
		return $this->db->get('ms_student')->row_object();
	}

	public function getAllStudent($class = null) {
		$this->db->order_by('ms_student.student_name', 'asc');
		$this->db->where('ms_student.student_hide', '0');
		$this->db->where('ms_student.id_class',$class);
		$this->db->join('ms_class', 'ms_student.id_class = ms_class.id_class', 'left');
		return $this->db->get('ms_student')->result_object();
	}
	
	public function getStudentById($id_student) {
		$this->db->where('id_student', $id_student);
		$this->db->where('student_hide', 0);
		return $this->db->get('ms_student')->row_object();
	}
	public function getStudentByClass($id_class) {
		$this->db->where('ms_student.id_class', $id_class);
		$this->db->where('ms_student.student_hide', 0);
		$this->db->join('ms_class', 'ms_student.id_class = ms_class.id_class', 'left');
		return $this->db->get('ms_student')->result_object();
	}

	public function getAllClass() {
		$this->db->where('class_hide', 0);
		$this->db->order_by('class_name', 'asc');
		return $this->db->get('ms_class')->result_object();
	}
	
	public function regisStudent($data) {
		return $this->db->insert('ms_student', $data);
	}
}

/* End of file AuthModel.php */
/* Location: ./application/models/AuthModel.php */