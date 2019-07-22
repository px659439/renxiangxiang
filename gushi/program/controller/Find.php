<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Find extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}


	//发现表彰墙	
		public function commendation(){
			if(!isset($_GET['user_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $user_id = $_GET['user_id'];
	        }
	        if(!isset($_GET['page'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $page = $_GET['page'];
	        }
	        if($page > '6'){
	        	$page = 6;
	        }
			$find = model('Find');
	        $data = $find->comments($page);
	        $users = model('Index');
	        foreach ($data as $key => $val) {
	        	if($val['user_name'] == ''){
	        		$data[$key]['name'] = $val['wx_name'];
	        		unset($data[$key]['user_name']);
	        		unset($data[$key]['wx_name']);
	        	}else{
	        		$data[$key]['name'] = $val['user_name'];
	        		unset($data[$key]['user_name']);
	        		unset($data[$key]['wx_name']);
	        	}
	        	if($val['user_img'] == ''){
	        		$data[$key]['img'] = $val['wx_img'];
	        		unset($data[$key]['user_img']);
	        		unset($data[$key]['wx_img']);
	        	}else{
	        		$data[$key]['img'] = $val['user_img'];
	        		unset($data[$key]['user_img']);
	        		unset($data[$key]['wx_img']);
	        	}
        		$data[$key]['num'] = $users->worknum($val['work_id']);
				$res = $users->fabulous($val['work_id'],$user_id);
				if($res){
					$data[$key]['isfabulous'] = 1;
				}else{
					$data[$key]['isfabulous'] = 0;
				}	
	    		$time = date("Y-m-d-H-i-s",$val['com_time']);
		        list($year,$month,$day,$hour,$minute) = explode("-",$time);
				$year_diff = date("Y") - $year;
				$month_diff = date("m") - $month;
				$day_diff = date("d") - $day;
				$hour_diff = date("H") - $hour;
				$minute_diff = date("i") - $minute;
				if($year_diff > 0){
					$data[$key]['com_time'] = $year_diff.'年';
					continue;
				}elseif($month_diff > 0){
					$data[$key]['com_time'] = $month_diff.'月';
					continue;
				}elseif($day_diff > 0){
					$data[$key]['com_time'] = $day_diff.'天';
					continue;
				}elseif($hour_diff > 0){
					$data[$key]['com_time'] = $hour_diff.'小时';
					continue;
				}elseif($minute_diff > 0){
					$data[$key]['com_time'] = $minute_diff.'分钟';
					continue;
				}else{
					$data[$key]['com_time'] = '1分钟';
					continue;
				}
	        }
	        $list['code'] = 1;
	        $list['sum'] = count($data);
	        $list['data'] = $data;
	        return  json($list);
		}

		//人气榜
		public function popularity(){
			if(!isset($_GET['user_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $user_id = $_GET['user_id'];
	        }
	        if(!isset($_GET['page'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $page = $_GET['page'];
	        }
	        if($page > '5'){
	        	$page = 5;
	        }
	        if(!isset($_GET['type'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $type = $_GET['type'];
	        }
			$lasttime = date("Y-m",mktime(0, 0 , 0,date("m")-1,1,date("Y")));
			$find = model('Find');

			if($type == '0'){
				 	$data = $find->popularity($page,$lasttime);
			}elseif($type == '1'){
  					$data = $find->insist($page,$lasttime);
			}elseif($type == '2'){
					 $data = $find->commend($page,$lasttime);
			}
			$num = 0;
	        foreach ($data as $key => $val) {
	        	if($val['user_name'] == ''){
	        		$data[$key]['name'] = $val['wx_name'];
	        		unset($data[$key]['user_name']);
	        		unset($data[$key]['wx_name']);
	        	}else{
	        		$data[$key]['name'] = $val['user_name'];
	        		unset($data[$key]['user_name']);
	        		unset($data[$key]['wx_name']);
	        	}
	        	if($val['user_img'] == ''){
	        		$data[$key]['img'] = $val['wx_img'];
	        		unset($data[$key]['user_img']);
	        		unset($data[$key]['wx_img']);
	        	}else{
	        		$data[$key]['img'] = $val['user_img'];
	        		unset($data[$key]['user_img']);
	        		unset($data[$key]['wx_img']);
	        	}
	        	if($val['user_id'] == $user_id){
	        		$num = $key+1;
	        	}
	        }

	        $arr =  $find->rankuser($user_id,$lasttime);
	        if($num == '0'){
	        	$list['num'] = $num;
	        }else{
				$list['num'] = $num;
	        }
			if($type == '0'){
				$list['content'] = $arr['fabulous'];
			}elseif($type == '1'){
  				$list['content'] = $arr['days'];
			}elseif($type == '2'){
				$list['content'] = $arr['commend'];
			}
	      //  $list['content'] = $arr['fabulous'];
	        $list['code'] = 1;
	        $list['sum'] = count($data);
	        $list['data'] = $data;
	        return  json($list);
		}


		
}