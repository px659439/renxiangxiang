<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Goclass extends Model
{

	//查询课程信息
		public function courselist($type1,$type2){
			 $result = Db::table('course')
			 	->where('cour_type',$type1)
			 	->whereOr('cour_type',$type2)
			 	->where('status','1')
	            ->select();
	        return $result;	
		}

		//查询解锁课程位于第几位
		public function course($type1,$type2){
			 $result = Db::table('course')
			 	->where('cour_type',$type1)
			 	->whereOr('cour_type',$type2)
	            ->select();
	        return $result;	
		}

		//查询个人用户信息
		public function userfind($user_id){
			 $result = Db::table('users')
			 	->where('user_id',$user_id)
			 	->field("user_status,user_id")
	            ->find();
	        return $result;	
		}

		//查询课程课件数量
		public function classcount($cour_id){
			 $result = Db::table('course_class')
		 				->where('course_id',$cour_id)
	            		->count();
	        return $result;	


		}

		//查询课程课件
		public function classlist($cour_id){
			 $result = Db::table('course_class')->alias('cc')
		 				->join('class c','cc.class_id = c.class_id')
		 				->where('cc.course_id',$cour_id)
			 			->where('c.status','1')
		 				->order('cc.desc asc')
	            		->select();
	        return $result;	
		}

		//查询解锁课程位于第几位
		public function courseformal($type1){
			 $result = Db::table('course')
			 	->where('cour_type',$type1)
			 	->where('status','1')
	            ->select();
	        return $result;	
		}

		//查询课件详情
		public function detailslist($class_id){
			 $result = Db::table('class')
			 	->where('class_id',$class_id)
			 	->where('status','1')
	            ->find();
	        return $result;	
		}

		//查询是否完成测试题
		public function isworks($user_id,$class_id,$course_id){
			 $result = Db::table('user_topic')
			 	->where('user_id',$user_id)
			 	->where('class_id',$class_id)
			 	->where('course_id',$course_id)
	            ->find();
	        return $result;	
		}

		//记录完成测试题
		public function isworksadd($data){
			 $result = Db::table('user_topic')
			 			->insertGetId($data);
	        return $result;	
		}

		//查询测试题题干内容
		public function testlist($class_id,$page){
			$num = $page-1;
			 $result = Db::table('topic')
		 				->where('class_id',$class_id)
			 			->where('status','1')
		 				->order('topic_desc asc')
		 				->limit($num,1)
	            		->select();
	        return $result;	
		}

		//查询测试题总数
		public function testnum($class_id){
			 $result = Db::table('topic')
			 		->where('class_id',$class_id)
			 		->where('status','1')
			 		->count();
	        return $result;	
		}

		//查询测试题选项内容
		public function optionlist($t_id){
			 $result = Db::table('option')
		 				->where('t_id',$t_id)
		 				->field('option_name,option_if,option_type,url,blanks')
	            		->select();
	        return $result;
		}


















	



	



}
?>