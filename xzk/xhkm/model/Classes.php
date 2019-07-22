<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Classes extends Model
{
	//添加班级
	public function classesadd($data){
		 $result = Db::table('classes')
		 	->insertGetId($data);
		return $result;	
	}

	//查询班主任
	public function headmasterlist(){
		 $result = Db::table('headmaster')
		 		->where('status','1')
		 	->select();
		return $result;	
	}

	//修改班主任状态
	public function Courseupd($c_id,$data)
	{
		$result = Db::table('classes')
				->where('c_id', $c_id)
	    		->update($data);
		return $result;	
	}

	//查询课程
	public function courselist(){
		 $result = Db::table('course')
		 		->select();
		return $result;	
	}

	//根据注册时间查询
	public function usertime($starttime, $endtime){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('wx.addtime','>=',$starttime)
		 			->where('wx.addtime','<=',$endtime)
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}

	//查询所有用户
	public function userlist(){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}

	//根据购买时间查询(1)
	public function orderuser($buystarttime,$buyendtime,$course_id=0){
		 $result = Db::table('order')->alias('o')
		 			->join('users u','o.user_id = u.user_id')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('o.pay_time','>=',$buystarttime)
		 			->where('o.pay_time','<=',$buyendtime)
		 			->where('o.goods_id',$course_id)
		 			->where('o.order_money_status','1')
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}

	//根据购买时间查询(2)
	public function orderusers($buystarttime,$buyendtime){
		 $result = Db::table('order')->alias('o')
		 			->join('users u','o.user_id = u.user_id')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('o.pay_time','>=',$buystarttime)
		 			->where('o.pay_time','<=',$buyendtime)
		 			->where('o.order_money_status','1')
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}



	//根据出生时间查询
	public function userbirthday($birthstarttime,$birthendtime){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('u.user_birthday','>=',$birthstarttime)
		 			->where('u.user_birthday','<=',$birthendtime)
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}

	//添加班级学生
	public function learnersadd($data){
		 $result = Db::table('learners')
		 	->insertGetId($data);
		return $result;	
	}

	//查询所有班级信息
	public function classeslist(){
		$result = Db::table('classes')->alias('c')
		 		->join('headmaster h','c.h_id = h.h_id')
		 		->field('c.c_id,c.status,c.time,c.c_name,h.h_name')
	    		->select();
		return $result;	
	}

	//添加班级学生数
	public function learnersnum($c_id){
		 $result = Db::table('learners')
		 	->where('c_id',$c_id)
		 	->count();
		return $result;	
	}

	//查询班级中所有学员的信息
	public function classesuser($c_id){
		 $result = Db::table('learners')->alias('l')
		 			->join('users u','l.user_id = u.user_id')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('l.c_id',$c_id)
		 			->field('u.user_id,wx_name,wx_img,u.user_phone')
		 			->select();
		return $result;
	}

	//移除班级学员
	public function userdel($c_id,$user_id){
		 $result = Db::table('learners')
		 	->where('c_id',$c_id)
		 	->where('user_id',$user_id)
		 	->delete();
		return $result;
	}

	//根据出生时间查询
	public function userbirthdayall(){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->field('u.user_id,wx_name,wx_img,u.user_phone,u.status')
		 			->select();
		return $result;
	}



}
?>