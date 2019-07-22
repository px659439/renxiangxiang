<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
class Order extends Common
{
	//订单列表展示
	public function orderlist(){
		$order = model('order');
  		$orderall = $order->orderall();

  		// echo "<pre>";
  		// print_r($orderall);die;

  		$this->assign('orderall',$orderall);
  		return $this->fetch('order/orderlist');
	}
	






	

}
?>