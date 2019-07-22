<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Order extends Model
{
		//查询订单列表
	public function orderall(){
		 $result = Db::table('order')->alias('o')
		 			->join('users u','o.user_id = u.user_id')
		 			->join('weixin wx','u.wx_id = wx.wx_id')
		 			->where('o.order_money_status','1')
		 			->field('wx.wx_name,wx.wx_img,o.order_sn,o.order_name,o.money_pay,o.order_money_status,o.pay_time')
		 			->select();
		return $result;
	}







}
?>