<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Goclass extends Model
{
	  /*
     * 根据手机号查询用户
     */
    
	public function userlist($user_id){
		 $result = Db::table('users')
		 	->where('user_id',$user_id)
           ->find();
        return $result;	
	}
//查询对应课程的课节
	public function classlist($type){
		 $result = Db::table('course')->alias('u')
		 		->join('cour_class cc','cc.course_id = u.course_id')
		 		->join('class c','cc.class_id = c.class_id')
				->where('u.course_id', $type)
				->where('c.class_status','1')
				->order('c.class_sort asc')
				->field('c.class_id,c.class_name,u.course_img,u.course_name,u.course_id')
	    		->select();
        return $result;	
	}

	//修改解锁课程
	public function classupdata($user_id,$data){
		$result = Db::table('users')
				->where('user_id', $user_id)
	    		->update($data);
	    return $result;	
	}

	//课节详情
	public function classdetails($class_id){
		$result = Db::table('class')
				->where('class_id',$class_id)
           		->find();
	    return $result;	
	}

	//查询对应课程的课节
	public function detailslist($type){
		 $result = Db::table('course')->alias('u')
		 		->join('cour_class cc','cc.course_id = u.course_id')
		 		->join('class c','cc.class_id = c.class_id')
				->where('u.course_id', $type)
				->where('c.class_status','1')
				->order('c.class_sort asc')
				->field('c.class_id,c.class_name,c.class_img,c.class_video')
	    		->select();
        return $result;	
	}


	//分页获取用户作品
	public function workssel($page=1,$class_id){
		$num = $page*4;
		 $result = Db::table('works')->alias('w')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('class_id',$class_id)
		 		->field('w.work_id,w.work_time,w.work_img,u.user_name,u.user_img,wx.wx_name,wx.wx_img')
		 		->order('work_id desc')
		 		->limit($num)
		 		->select();
		return $result;	
	}

	//查询课程是否提交过作品
	public function isworks($user_id,$class_id){
		 $result = Db::table('works')
		 		->where('class_id',$class_id)
		 		->where('user_id',$user_id)
		 		->select();
		return $result;	
	}

	//上传作业
	public function addworks($data){
			 $result = Db::table('works')
		 		->insertGetId($data);
		return $result;	
	}

		//查询作品详情
	public function worksfind($work_id){
		 $result = Db::table('works')->alias('w')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('class c','c.class_id = w.class_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('w.work_id',$work_id)
		 		->column('w.work_id,u.user_name,u.user_img,wx.wx_img,wx.wx_name,c.class_name,w.work_img,u.days');
		return $result;	
	}

		//查看老师点评内容
	public function teacherlist($work_id){
		 $result = Db::table('comment')->alias('c')
		 		->join('teacher t','c.teacher_id = t.teacher_id')
		 		->where('c.work_id',$work_id)
		 		//->where('c.status','1')
		 		->field('t.teacher_name,t.teacher_img,t.teacher_id,c.com_sound,c.com_time,c.com_id,c.status')
		 		->find();
		return $result;	
	}

	//查询表彰排行表
	public function ranklist($user_id,$times){
		 $result = Db::table('ranking')
		 		->where('user_id', $user_id)
		 		->where('time', $times)
	    		->find();
		return $result;
	}
	//修改表彰排行表
	public function rankup($user_id,$time,$data){
		 $result = Db::table('ranking')
		 		->where('user_id', $user_id)
		 		->where('time', $time)
	    		->update($data);
		return $result;
	}
	//表彰排行表
	public function rankadd($data){
		 $result = Db::table('ranking')
		 			->insertGetId($data);
		return $result;
	}


	//分页获取用户作品
	public function workssels($page=1,$class_id){
		$num = $page*4;
		 $result = Db::table('works')->alias('w')
		 		->join('comment c','w.work_id = c.work_id')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('c.status','1')
		 		->where('class_id',$class_id)
		 		->field('w.work_id,w.work_time,w.work_img,u.user_name,u.user_img,wx.wx_name,wx.wx_img')
		 		->order('work_id desc')
		 		->limit($num)
		 		->select();
		return $result;	
	}

	//获取课程
	public function courseall(){
			 $result = Db::table('course')
		 		->select();
		return $result;		
	}


	//获取隐藏课程
	public function hiddencourse(){
			 $result = Db::table('course')
			 		->where('type','3')
			 		->where('course_status','1')
		 			->select();
		return $result;		
	}








}
?>