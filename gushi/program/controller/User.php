<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class User extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}
   		//获取用户信息
		public function userlist(){
			
		    $redis = new \Redis;
		    $redis->connect('39.105.163.231', 6379);
			$redis->auth("KKm123456"); //密码验证

		   	



		//	$redis->set('cat', 111);
 			
    		//获取一个字符串的值
 			 $res = $redis->get('cat'); // 111
 			 echo $res;die;
 			 if($res){
 			 	return 1;
 			 }else{
 			 	return 2;
 			 }
			







		}







		
}