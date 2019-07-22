<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Index extends Model
{
	  /*
     * 根据手机号查询用户
     */
	public function queryuser($mobile){
		$mobile=trim($mobile);
		 $result = Db::table('users')
		 	->where('user_phone',$mobile)
           ->select(); 
        return $result;	
	}
	//修改添加手机号
	public function userphoneup($user_id,$data){
			$result = Db::table('users')
				->where('user_id', $user_id)
	    		->update($data);
		return $result;	
	} 
	//获取用户信息
	public function userlist($user_id){
		$result = Db::table('users')->alias('u')
		 		->join('weixin w','w.wx_id = u.wx_id')
				->where('user_id', $user_id)
	    		->field('w.wx_img,w.wx_name,u.user_name,u.user_img,u.days,u.user_birthday,u.user_sex,u.commend,u.fabulous')
	    		->find();
		return $result;
	}
	//获取用户作品
	public function worklist($user_id){
		$result = Db::table('works')
				->field('work_id')
				->where('user_id', $user_id)
	    		->select();
		return $result;
	}
	//获取获取作品赞数
	public function worknum($work_id){
		$result = Db::table('fabulous')
				->where('work_id', $work_id)
	    		->count();
		return $result;
	}

//获取用户作品数量
	public function worksum($user_id){
		$result = Db::table('works')
				->field('work_id')
				->where('user_id', $user_id)
	    		->count();
		return $result;
	}
//分页获取用户作品
	public function workssel($page=1,$user_id){
		$num = $page*4;
		 $result = Db::table('works')
		 		->where('user_id',$user_id)
		 		->field('work_id,work_time,work_img')
		 		->order('work_id desc')
		 		->limit($num)
		 		->select();
		return $result;	
	}
//是否点过赞
	public function fabulous($work_id,$user_id){
		 $result = Db::table('fabulous')
		 		->where('user_id',$user_id)
		 		->where('work_id',$work_id)
		 		->select();
		return $result;	
	}

	//点赞
	public function fabulousadd($data){
		 $result = Db::table('fabulous')
		 		->insertGetId($data);
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

	//根据作品查询user_id
	public function workuser($work_id){
		 $result = Db::table('works')
				->where('work_id', $work_id)
				->field('user_id')
	    		->find();
		return $result;
	}

	//查询用户信息
	public function userdata($user_id){
			$result = Db::table('users')
				->where('user_id', $user_id)
				->find();
		return $result;	
	} 




}
?>