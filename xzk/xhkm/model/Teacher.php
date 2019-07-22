<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Teacher extends Model
{
	//添加老师
	public function teacheradd($data){
		 $result = Db::table('teacher')
		 		->insertGetId($data);
		return $result;	
	}

	//添加老师
	public function teacherlist(){
		 $result = Db::table('teacher')
		 	  ->field("teacher_id,teacher_name,teacher_account,status")
		 		 ->select(); 
		return $result;	
	}

	//删除老师
	public function teacherdel($data){
		 $result = Db::table('teacher')
		 	->where('teacher_id',$data)
		 	->delete();
		return $result;	
	}

	//修改老师状态
	public function teacherupd($teacher_id,$data)
	{
		$result = Db::table('teacher')
				->where('teacher_id', $teacher_id)
	    		->update($data);
		return $result;	
	}

	//查询老师信息
	public function teachersel($name){
		 $result = Db::table('teacher')
		 	->field('teacher_account,teacher_pwd,status,teacher_id')
           ->where('teacher_account','=',$name)
           ->find();
		return $result;	
	}

//查询单个老师
	public function teacherll($teacher_id){
		 $result = Db::table('teacher')
		 	->field('teacher_id,teacher_name,teacher_img')
		 	  ->where('teacher_id','=',$teacher_id)
		 		 ->select(); 
		return $result;	
	}


}
?>