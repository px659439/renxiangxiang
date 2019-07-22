<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Classes extends Model
{

	//获取用户所在班级老师信息
	public function classeslist($user_id){
		 $result = Db::table('learners')->alias('l')
		 		->join('classes c','l.c_id = c.c_id')
		 		->join('headmaster h','c.h_id = h.h_id')
		 		->where('l.user_id',$user_id)
		 		->where('c.status','1')
		 		->order('l.time desc')
		 		->field('c.c_name,h.h_name,h.h_code')
		 		->select();
		return $result;	
	}

	//获取老师二维码
	public function gettwocode($code){
		 $result = Db::table('headmaster')
		 		->where('h_code',$code)
		 		->where('status','1')
		 		->field('h_img')
		 		->select();
		return $result;	
	}









}
?>