<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Order extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}
   		
   		//同步
		public function orderlist(){
			if(!isset($_GET['user_id'])){
	            $list['code'] = 18;//openid不能为空
	            return json($list);
	        }else{
	            $user_id= $_GET['user_id'];
	        }

	        if(!isset($_GET['course_id'])){
	            $list['code'] = 18;//openid不能为空
	            return json($list);
	        }else{
	            $course_id= $_GET['course_id'];
	        }
	        if($course_id == ''){
	        	 $list['code'] = 18;//openid不能为空
	            return json($list);
	        }

	        $order = model('order');
			$course = $order->coursefind($course_id);
	        
        	$body = $course['course_name'];	//商品名必填
        	$total_fee = $course['lastprice']*100;	//价格，这是一分钱
	   
			$open = $order->weixinsel($user_id);
			$openid = $open['wx_openid'];
			$time = time();
			$appid = 'wxcabcde7981d75cb2';	//appid必填
			$mch_id = '1542745721';	//商户号
			$nonce_str = $user_id; //随机字符串,不长于32位。
			$notify_url = 'https://xiaohou.kkmandarin.com/program/Order/orderupdate';	//通知地址必填
			$trade_type = 'JSAPI';
			$key = '08522580comcoMALexanderKaiKai702';	//商户key必填，在商户后台获得
			$out_trade_no = time().$user_id.$course_id;	//自定义订单号必填

			$data = array();
			$data['order_name'] = $body;
			$data['order_money'] = $total_fee/100;
			$data['order_sn'] = $out_trade_no;
			$data['add_time'] = time();
			$data['user_id'] = $user_id;
			$data['goods_id'] =$course_id;
			
			$orderadd = $order->orderadd($data);

			$signlist = 'appid='.$appid.'&body='.$body.'&mch_id='.$mch_id.'&nonce_str='.$nonce_str.'&notify_url='.$notify_url.'&openid='.$openid.'&out_trade_no='.$out_trade_no.'&total_fee='.$total_fee.'&trade_type='.$trade_type.'&key='.$key;
			$sign = strtoupper(md5($signlist));	//签名

			$formData = '<xml><appid>'.$appid.'</appid><body>'.$body.'</body><mch_id>'.$mch_id.'</mch_id><nonce_str>'.$nonce_str.'</nonce_str><notify_url>'.$notify_url.'</notify_url><openid>'.$openid.'</openid><out_trade_no>'.$out_trade_no.'</out_trade_no><total_fee>'.$total_fee.'</total_fee><trade_type>'.$trade_type.'</trade_type><sign>'.$sign.'</sign></xml>';

			$url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
			$header = array('application/x-www-form-urlencoded');

	      	$ch1 = curl_init();
	        curl_setopt($ch1,CURLOPT_URL,$url);
	        curl_setopt($ch1,CURLOPT_RETURNTRANSFER,true);
	        curl_setopt($ch1,CURLOPT_SSL_VERIFYPEER,false);
	        curl_setopt($ch1,CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch1, CURLOPT_HTTPHEADER, $header);	//添加header头
	        curl_setopt($ch1,CURLOPT_POST,true);
	        curl_setopt($ch1,CURLOPT_POSTFIELDS,$formData);
	        $res = curl_exec($ch1);
	        curl_close($ch1);

			$data = $this->xmlToArray($res);

			 $params2 = [
	            'appId'     => 'wxcabcde7981d75cb2',
	            'timeStamp'     => strval($time),   //建议把时间戳转变成字符串
	            'nonceStr'     => $data['nonce_str'],
	            'package'     => 'prepay_id='.$data['prepay_id'],
	            'signType'     => 'MD5'
        		];

        		if(isset($data['sign'])){
		            unset($data['sign']);
		        }
		        ksort($params2);
		        $str = urldecode(http_build_query($params2));
		        $str .= '&key=08522580comcoMALexanderKaiKai702';
		        $data['paySign'] = strtoupper(md5($str));


			$data['timeStamp'] = strval($time);
			return json_encode($data);

		}


		//php 解析xml
		function xmlToArray($xml)
		{
			//禁止引用外部xml实体
			libxml_disable_entity_loader(true);
			$values = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
			return $values;

		}


		//异步回调修改订单状态
		public function orderupdate(){
			
			//获取返回的xml
			$testxml  = file_get_contents("php://input");

			//将xml转化为json格式
			$result = $this->xmlToArray($testxml);

			//转成数组
			if($result){
		          //如果成功返回了
		         if($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
		          //进行改变订单状态等操作。。。。 
					$order_sn = $result['out_trade_no'];
					$user_id = $result['nonce_str'];
					$data['money_pay'] =  $result['total_fee']/100;
					$data['order_money_status'] =  1;
					$data['pay_time'] =  $result['time_end'];
						
					$order = model('order');
					$open = $order->orderupd($order_sn,$user_id,$data);
					if($open){
						$users = $order->userfind($user_id);
						
						$orderfind = $order->orderfind($order_sn,$user_id);
						if($orderfind['order_money_status'] == '1'){

							 $order = model('order');
							 $course = $order->courseall();

							 foreach ($course as $key => $val) {
							 	if($orderfind['goods_id'] ==  $val['course_id']){
							 		$list['status'] = substr_replace($users['status'],1,$key,1);
							 	}
							 }
							$order->userup($user_id,$list);
						}
					}
				}
			}
		}










  




		
}