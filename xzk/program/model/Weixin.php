<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Weixin extends Model
{
	  /*
     * 根据查询openid用户
     */
	public function weixinsel($openid){
		 $result = Db::table('weixin')->alias('w')
		 	->join('users u','w.wx_id = u.wx_id')
		 	->where('w.wx_openid',$openid)
           ->find(); 
        return $result;	
	}
	//添加微信表
	public function weixinadd($data){
		 $result = Db::table('weixin')
		 	->insertGetId($data);
		return $result;	
	}
	//添加用户表
	public function useradd($data){
		 $result = Db::table('users')
		 	->insertGetId($data);
		return $result;	
	}


		//修改微信表数据
	public function weixinupdate($openid,$data){
		 $result = Db::table('weixin')
		 	->where('wx_openid',$openid)
		 	->update($data);
		return $result;	
	}

	public function users($user_id){
		 $result = Db::table('users')
		 	->where('user_id',$user_id)
		 	->field('status')
           ->find(); 
        return $result;	
	}



}
?>