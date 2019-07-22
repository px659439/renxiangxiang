<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Order extends Model
{
	//根据用户user_id获取openid
	public function weixinsel($user_id){
		 $result = Db::table('users')->alias('u')
		 	->join('weixin wx','u.wx_id = wx.wx_id')
		 	->where('u.user_id',$user_id)
		 	->field('wx.wx_openid')
           	->find(); 
        return $result;	
	}
	

	//生成订单
	public function orderadd($data){
		  $result = Db::table('order')
		 	->insertGetId($data);
		return $result;	
	}

	//修改订单
	public function orderupd($order_sn,$user_id,$data){
		  $result = Db::table('order')
		  		->where('order_sn', $order_sn)
		  		->where('user_id', $user_id)
	    		->update($data);
		return $result;	
	}

	//查看订单
	public function orderfind($order_sn,$user_id){
		  $result = Db::table('order')
		  		->where('order_sn', $order_sn)
		  		->where('user_id', $user_id)
	    		->find();
		return $result;	
	}


	//查询单个用户信息
	public function userfind($user_id){
		 $result = Db::table('users')
		 			->where('user_id',$user_id)
		 			->field('status')
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

}
?>