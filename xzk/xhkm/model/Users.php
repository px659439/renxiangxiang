<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Users extends Model
{
	//查询对应课程用户
	public function userall($page=0){
		$num = 10*$page;
		$result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->order('u.user_id desc')
		 			->limit($num,10)
		 			->select();
		return $result;
	}

	//查询单个用户信息
	public function userlist($user_id){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('u.user_id',$user_id)
		 			->find();
		return $result;
	}

	//查询单个用户信息
	public function userfind($user_id){
		 $result = Db::table('users')
		 			->where('user_id',$user_id)
		 			->find();
		return $result;
	}

	//修改单个用户信息
	public function userup($user_id,$data){
		 $result = Db::table('users')
		 			->where('user_id',$user_id)
	    			->update($data);
		return $result;
	}

	//添加跟进记录
	public function recordadd($data){
		$result = Db::table('record')
		 	->insert($data);
		return $result;	
	}

	//查询跟进记录时间倒序
	public function recordlist($user_id){
		$result = Db::table('record')->alias('r')
		 			->join('admin a','r.admin_id = a.admin_id')
		 			->where('r.user_id',$user_id)
		 			->order('record_id desc')
		 			->select();
		return $result;
	}

	//查询课程列表
	public function courseall(){
		$result = Db::table('course')
		 		->select();
		return $result;	
	}

//查询用户总数  usercount
	public function usercount(){
		$result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->count();
		return $result;
	}

	//查询课程信息
	public function coursefind($course_id){
		 $result = Db::table('course')
		 			->where('course_id',$course_id)
		 			->find();
		return $result;
	}

	//生成订单
	public function orderadd($data){
		 $result = Db::table('order')
		 			->insert($data);
		return $result;
	}

	//退款修改订单信息
	public function orderup($user_id,$course_id,$data){
		 $result = Db::table('order')
		 			->where('user_id',$user_id)
		 			->where('goods_id',$course_id)
		 			->where('order_money_status','1')
	    			->update($data);
		return $result;
	}













}
?>