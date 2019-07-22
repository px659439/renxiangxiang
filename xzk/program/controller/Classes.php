<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Classes extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}

		//班级列表
		public function classeslist(){
	        if(!isset($_GET['user_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $user_id = $_GET['user_id'];
	        }

	        $classes = model('Classes');

	        $classeslist = $classes->classeslist($user_id);
	        $arr = array(
	        	'0'	=> array(
	        		'c_name' => '《免费体验班》',
		            'h_name' => '',
		            'h_code' => '1'
	        	),

	        );
	        $classeslist = array_merge($arr,$classeslist);

        	$list['code'] = 1;
       		$list['data'] = $classeslist;
	        
		    return json($list);
		} 

		//获取二维码
		public function gettwocode(){
			if(!isset($_GET['getcode'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $getcode = $_GET['getcode'];
	        }
	        $classes = model('Classes');
	        if($getcode == '1'){
	        	$code = $classes->gettwocode($getcode);
	        	$count = count($code);
	        	$num = rand(0, $count-1);
	        	$url = $code[$num]['h_img'];
	        }else{
	        	$code = $classes->gettwocode($getcode);
	        	$count = count($code);
	        	if($count == '0'){
	        		$code = $classes->gettwocode(1);
		        	$count = count($code);
		        	$num = rand(0, $count-1);
		        	$url = $code[$num]['h_img'];
	        	}else{
	        		$url = $code[0]['h_img'];
	        	}
	        }	

	        $url = urlencode($url);
 			return json($url);
		}
		
}