<?php
namespace app\poetry\model;
use think\Model;
use think\DB;

class Course extends Model
{
	
	//查询所有课程
	public function courseall(){
		 $result = Db::table('course')
		 	->where('status','1')
           ->select(); 
        return $result;	

	}

	//添加课程
	public function Courseadd($data){
		$result = Db::table('course')
		 	->insert($data);
		return $result;	
	}

	//删除课程
	public function Coursedel($cour_id,$data){
		 $result = Db::table('course')
		 	->where('cour_id',$cour_id)
		 	->update($data);
		return $result;	
	}

	//添加课件
	public function classadd($data){
		 $result = Db::table('class')
		 	->insert($data);
		return $result;	
	}


	//查询所有课件
	public function classall(){
		 $result = Db::table('class')
		 	->where('status','1')
           ->select(); 
        return $result;	

	}

		//删除课件
	public function classdel($class_id,$data){
		 $result = Db::table('class')
		 	->where('class_id',$class_id)
		 	->update($data);
		return $result;	
	}

	//查询课程关联的课节
	public function editclass($cour_id){
		 $result = Db::table('course_class')->alias('cc')
		 	->join('class c','cc.class_id = c.class_id')
		 	->where('cc.course_id',$cour_id)
		 	->where('c.status','1')
		 	->order('cc.desc asc')
		 	->field('c.class_name,c.class_author,c.class_url,cc.desc,c.class_id')
           ->select(); 
        return $result;	

	}

	//删除课程课件
	public function editclassdel($cour_id,$class_id){
		 $result = Db::table('course_class')
		 	->where('class_id',$class_id)
		 	->where('course_id',$cour_id)
		 	->delete();
		return $result;	
	}

	//课程添加课件
	public function editadd($data){
		 $result = Db::table('course_class')
		 	->insert($data);
		return $result;	
	}
	

	//查找课程课件
	public function editsel($cour_id,$class_id){
		 $result = Db::table('course_class')
		 	->where('class_id',$class_id)
		 	->where('course_id',$cour_id)
		 	->find();
		return $result;	
	}

	//添加题目
	public function topicadd($data){
		 $result = Db::table('topic')
		 	->insertGetId($data);
		return $result;	
	}

	//添加选项
	public function optionadd($data){
		 $result = Db::table('option')
		 	->insert($data);
		return $result;	
	}


	//课件关联的题
	public function classedit($class_id){
		 $result = Db::table('class')->alias('c')
		 	->join('topic t','c.class_id = t.class_id')
		 	->where('c.class_id',$class_id)
		 	->where('t.status','1')
		 	->order('t.topic_desc asc')
		 //	->field('c.class_name,c.class_author,c.class_url,cc.desc,c.class_id')
           ->select(); 
        return $result;	

	}


	//删除课件题
public function topicdel($t_id,$data){
		 $result = Db::table('topic')
		 	->where('t_id',$t_id)
		 	->update($data);
		return $result;	
	}









	




}
?>