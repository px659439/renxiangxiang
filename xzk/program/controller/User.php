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
				if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        $users = model('Index');
		        $data = $users->userlist($user_id);
		      //  $arr = $users->worklist($user_id);
		        // $num = array();
		        // foreach ($arr as $key => $val) {
		        // 	$num[$key] = $users->worknum($val['work_id']);
		        // }

		        if($data['user_birthday'] == ''){
		        	$data['user_birthday'] = '暂无年龄';
		        }else{
		        	$time = date("Y-m-d",$data['user_birthday']);
			        list($year,$month,$day) = explode("-",$time);
					$year_diff = date("Y") - $year;
					$month_diff = date("m") - $month;
					//$day_diff  = date("d") - $day;
					$data['user_birthday'] = $year_diff.'岁'.$month_diff.'个月';
		        }

		       // $data['fabulous'] = array_sum($num);
		        $list['code'] = 1;
		        $list['data'] = $data;
		        return json($list);
		}

//获取用户信息作品
		public function worklist(){
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
		        $users = model('Index');
		        $list['sum'] = $users->worksum($user_id);
				$data = $users->workssel($page,$user_id);

				foreach ($data as $key => $val) {
					$data[$key]['num'] = $users->worknum($val['work_id']);
					$res = $users->fabulous($val['work_id'],$user_id);
					if($res){
						$data[$key]['isfabulous'] = 1;
					}else{
						$data[$key]['isfabulous'] = 0;
					}	
					$time = date("Y-m-d-H-i-s",$val['work_time']);
			        list($year,$month,$day,$hour,$minute) = explode("-",$time);
					$year_diff = date("Y") - $year;
					$month_diff = date("m") - $month;
					$day_diff = date("d") - $day;
					$hour_diff = date("H") - $hour;
					$minute_diff = date("i") - $minute;
					if($year_diff > 0){
						$data[$key]['work_time'] = $year_diff.'年';
						continue;
					}elseif($month_diff > 0){
						$data[$key]['work_time'] = $month_diff.'月';
						continue;
					}elseif($day_diff > 0){
						$data[$key]['work_time'] = $day_diff.'天';
						continue;
					}elseif($hour_diff > 0){
						$data[$key]['work_time'] = $hour_diff.'小时';
						continue;
					}elseif($minute_diff > 0){
						$data[$key]['work_time'] = $minute_diff.'分钟';
						continue;
					}else{
						$data[$key]['work_time'] = '1分钟';
						continue;
					}
				}
		        $list['code'] = 1;
		        $list['num'] = count($data);
		        $list['data'] = $data;
		        return json($list);
		}

		//点赞接口
		public function addfabulous(){
			if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        if(!isset($_GET['work_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $work_id = $_GET['work_id'];
		        }
		        $users = model('Index');
		        $res = $users->fabulous($work_id,$user_id);
				if($res){
					$list['code'] = 25;//该用户已点赞
				}else{

		        	$fuser_id = $users->workuser($work_id);
					$time = date("Y-m-d");
					$times = substr($time,0,7);
					$arrs = $users->ranklist($fuser_id['user_id'],$times);
					if($arrs){
						$rank['fabulous'] = $arrs['fabulous']+1;
		        		$users->rankup($fuser_id['user_id'],$times,$rank);
					}else{
						$rank['user_id'] = $fuser_id['user_id'];
						$rank['fabulous'] = 1;
						$rank['time'] = $times;
		        		$users->rankadd($rank);
					}

					$arr = $users->userlist($fuser_id['user_id']);
					if($arr){
						$rank['fabulous'] = $arr['fabulous']+1;
		        		$users->userphoneup($fuser_id['user_id'],$rank);
					}

					$data['work_id'] = $work_id;
					$data['user_id'] = $user_id;
					$data['time'] = time();
					$users->fabulousadd($data);
					$list['code'] = 1;

				}

 			return json($list);
		}

		//用户信息修改展示数据
		public function usersingle(){
			if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        $users = model('Index');
		       	$data = $users->userlist($user_id);
		       	unset($data['days']);
		       	$time = date("Y-m-d",$data['user_birthday']);
		        list($year,$month,$day) = explode("-",$time);
		       	if($data['user_birthday'] == ''){
		       		$data['year'] = '';
		       	}else{
		       		$data['year'] = $year;
		       	}
		    	$data['month'] = $month;
		    	$data['day'] = $day;
		       	unset($data['user_birthday']);
		        $list['code'] = 1;
		        $list['data'] = $data;
		        return json($list);
		}


		//修改用户信息
		public function userupdate(){
			if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        if(!isset($_GET['user_sex'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $data['user_sex'] = $_GET['user_sex'];
		        }
		        if($data['user_sex'] == ''){
					unset($data['user_sex']);
				}
		        if(!isset($_GET['user_name'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $data['user_name'] = $_GET['user_name'];
		        }
		        if($data['user_name'] == ''){
					unset($data['user_name']);
				}
		        if(!isset($_GET['user_img'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $data['user_img'] = $_GET['user_img'];
		        }
		        if($data['user_img'] == '' or $data['user_img'] == 'null'){
					unset($data['user_img']);
				}
		        if(!isset($_GET['time'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $time = $_GET['time'];
		            $data['user_birthday'] = strtotime($time);
		        }
 				if($data['user_birthday'] == '0'){
					unset($data['user_birthday']);
				}
		        $users = model('Index');
		       	$res = $users->userphoneup($user_id,$data);
		       	if($res){
		       		 $list['code'] = 1;
		       	}else{
 					$list['code'] = 26;//修改用户信息失败
		       	}
		        return json($list);
		}





		
}