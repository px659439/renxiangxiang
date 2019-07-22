<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Course extends Model
{
	

	//查询所有课程
	public function courseall(){
		 $result = Db::table('course')
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
	public function Coursedel($data){
		 $result = Db::table('course')
		 	->where('course_id',$data)
		 	->delete();
		return $result;	
	}


	//修改课程状态
	public function Courseupd($course_id,$data)
	{
		$result = Db::table('course')
				->where('course_id', $course_id)
	    		->update($data);

		return $result;	
	}


	//查询所有课程id,名称
	public function coursesel(){
		 $result = Db::table('course')
		 	->field('course_id,course_name')
		 	->where('course_status','1')
           ->select(); 
        return $result;	
	}

//添加课件
	public function classadd($data){
		 $result = Db::table('class')
		 	->insertGetId($data);
		return $result;	
	}

//添加课程与课件的关系
	public function courseclass($data){
		 $result = Db::table('cour_class')
		 	->insertAll($data);
		return $result;	
	}


	//查询所有课件
	public function classall(){
		 $result = Db::table('class')
           ->select(); 
        return $result;	

	}

	//查询课件,课程关系表
	public function courseclasssel($data)
	{
		$result = Db::table('course')->alias('c')
				->join('cour_class c_c','c.course_id = c_c.course_id')
				->where('c_c.class_id','=',$data)
				->column('c.course_name');
		return $result;	
		
	}

		//删除课件
	public function classdel($data){
		 $result = Db::table('class')
		 	->where('class_id',$data)
		 	->delete();
		return $result;	
	}


	//修改课件状态
	public function classupd($class_id,$data)
	{
		$result = Db::table('class')
				->where('class_id', $class_id)
	    		->update($data);

		return $result;	
	}


}
?>