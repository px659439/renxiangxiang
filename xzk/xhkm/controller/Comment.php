<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;

class Comment extends Controller {

//限制非法登录
		public function __construct(){

		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");

	        $success = $_GET['success'];
	        if(md5(md5('success01').'kkm')!=$success){
	        	$list['code'] = 8; //请登录
	        	return json($list);
	        }
		}

		//老师详情
		public function teacherlist(){
			$teacher_id = $_GET['teacher_id'];
			if($teacher_id == ''){
				$list['code'] = 9; //老师id不能为空
	        	return json($list);
			}
			$teacher = model('teacher');
            $res = $teacher->teacherll($teacher_id);
            if($res){
            	$list['code'] = 1; //老师id不能为空
            	$list['data'] = $res;
	        	return json($list); 
		   	  }else{
		   	  	$list['code'] = 10; //获取老师详情失败
	        	return json($list);
		   	  }
		}

		//老师待点评作业
		public function noworks(){
			$page = $_GET['page'];
			$works = model('works');
			if($page == ''){
				$page = 1;
			}

			$data = $works->workssel($page);
			$num = $works->worksselall();
			//$newtime = time();
			foreach ($data as $key => $val) {
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

			$data = array_values($data);

			$list['code'] = 1; //成功
			$list['data'] = $data;
			$list['num'] = ceil($num/5);
 			
	        return json_encode($list);
		}

		//修改老师信息
		public function upteacher(){
			$data = $_GET;
			$teacher_id = $data['teacher_id'];
			unset($data['teacher_id']);
			$list['teacher_name'] = $data['teacher_name'];
			$list['teacher_img'] = $data['teacher_img'];

			if($data['teacher_name'] == ''){
				unset($data['teacher_name']);
				unset($list['teacher_name']);
			}
			if($data['teacher_img'] == ''){
				unset($data['teacher_img']);
				unset($list['teacher_img']);
			}
			$teacher = model('teacher');
			$res = $teacher->teacherupd($teacher_id,$data);
			if($res){
				$list['code'] = 1; //成功
			}else{
				$list['code'] = 11; //失败
			}
			return json($list);
		}

		//作业点评详情
		public function worklist(){
			$work_id = $_GET['work_id'];
			$works = model('works');
			$data = $works->worksfind($work_id);
			$list['code'] = 1; //成功
			$list['data'] = $data[$work_id];
	        return json($list);
		}

		//作业点评完成
		public function complete(){
			$data = $_GET;
			if($data['com_sound'] == ''){
				$list['code'] = 12; //发送失败
				 return json($list);
			}
			if(!isset($data['user_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }
	        if(!isset($data['status'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }
	        $users = model('works');
	        $arr = $users->userlist($data['user_id']);
	  
	        $data['days'] = $arr['days'];
	        //unset($data['user_id']);
			$data['com_time'] = time();
			$work_id = $data['work_id'];
			$works = model('works');
			$li = $works->worksel($work_id);
			if($li){
				unset($data['work_id']);
				$res = $works->worksupda($work_id,$data);
			}else{
				if($data['status'] == '1'){
					$uoda['commend'] = $arr['commend']+1;
	        	 	$users->usersup($data['user_id'],$uoda);
	        	 	$time = date("Y-m-d");
					$times = substr($time,0,7);
					$res = $users->ranklist($data['user_id'],$times);
					if($res){
						$rank['commend'] = $res['commend']+1;
		        		$users->rankup($data['user_id'],$times,$rank);
					}else{
						$rank['user_id'] = $data['user_id'];
						$rank['commend'] = 1;
						$rank['time'] = $times;
		        		$users->rankadd($rank);
					}

				}
				$data['commend'] = $arr['commend']+1;
				$res = $works->worksadd($data);
			}
			if($res){
				$arrs['status'] = 3;
				$id = $works->worksup($work_id,$arrs);
				$list['code'] = 1; //成功
			}else{
				$list['code'] = 12; //发送失败
			}
	        return json($list);
		}


}