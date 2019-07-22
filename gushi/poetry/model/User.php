<?php
namespace app\poetry\model;
use think\Model;
use think\DB;

class User extends Model
{
	//查询对应课程用户
	public function userall(){
		 $result = Db::table('users')->alias('u')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->field('wx.wx_name,wx.wx_img,u.user_moblic,u.user_id,u.user_status')
		 			->select();
		return $result;
	}

	//查询课程
	public function courall(){
		 $result = Db::table('course')
		 			->where('cour_type','2')
		 			->whereOr('cour_type','3')
		 			->field('cour_name,cour_type,status')
		 			->select();
		return $result;
	}

	//查询个人用户信息
	public function userfind($user_id){
		 $result = Db::table('users')
		 			->where('user_id',$user_id)
		 			->field('user_id,user_status')
		 			->find();
		return $result;
	}

//修改个人用户信息
	public function userupd($user_id,$data){
		 $result = Db::table('users')
		 			->where('user_id',$user_id)
					->update($data);
		return $result;
	}











}
?>