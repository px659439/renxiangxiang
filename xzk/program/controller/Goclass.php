<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Goclass extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}

   		//上课首页展示
		public function classindex(){
				if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        $class = model('Goclass');
		        $data = $class->userlist($user_id);
		        $course = $class->courseall();

				$redis = new \Redis;
			    $redis->connect('39.105.163.231', 6379);
				$redis->auth("KKm123456"); //密码验证
				$name = 'xhkmuserid'.$user_id;
				$list = $redis->get($name); 
				 $time = date('Y-m-d',time());
				if($list){//有
					$list = json_decode($list,1);	

					$listnum = count($list);
					$coursenum = count($course);

					if($coursenum > $listnum){
						foreach ($course as $key => $val) {
							foreach ($list as $k => $v) {
								if($val['course_id'] == $v['course_id']){
									unset($course[$key]);
								}
							}
						}
						$arr = array();
						foreach ($course as $key => $val) {
							$arr[$key]['course_id'] = $val['course_id'];
							$arr[$key]['course_name'] = $val['course_name'];
							$arr[$key]['course_status'] = $val['course_status'];
							$arr[$key]['course_img'] = $val['course_img'];
							$arr[$key]['course_describe'] = $val['course_describe'];
							$arr[$key]['type'] = $val['type'];
							$arr[$key]['price'] = $val['price'];
							$arr[$key]['lastprice'] = $val['lastprice'];
							$arr[$key]['course_if'] = 0;
							$arr[$key]['coursetime'] = $time;
							$arr[$key]['coursesum'] = 1;
							$arr[$key]['coursenum'] = 0;
							$arr[$key]['num'] = 0;
						}
						array_splice($list, count($list), 0, $arr);
					}else{
						foreach ($course as $key => $val) {
							foreach ($list as $k => $v) {
								if($val['course_id'] == $v['course_id']){
									if($val['price'] != $v['price']){
										$list[$k]['price'] = $val['price'];
									}
									if($val['lastprice'] != $v['lastprice']){
										$list[$k]['lastprice'] = $val['lastprice'];
									}
									$list[$k]['course_status'] = $val['course_status'];
								}
							}
						}
					}

					foreach ($list as $key => $val) {
						$num = substr($data['status'],$key,1);
			        	if($num == '1'){
			        		$list[$key]['course_if'] = 1;
			        	}else{
			        		$list[$key]['course_if'] = 0;
			        	}

						if($val['coursetime'] == $time){
							if($val['num'] >= '1'){
								if($val['coursenum']>='1'){
									$arr = $class->classlist($val['course_id']);
									$count = count($arr);
									if($count > $val['coursesum']){
										$list[$key]['coursesum'] = $val['coursesum']+1;
									}
					        		$list[$key]['coursesum'] = $val['coursesum'];
					        		if($val['coursenum'] >= '1'){
					        			$list[$key]['coursenum'] = $val['coursenum']-1;
					        		}else{
					        			$list[$key]['coursenum'] = $val['coursenum'];
					        		}
					        		$list[$key]['coursetime'] = date('Y-m-d',time());
					        		$list[$key]['num'] = 0;
								}
							}
						}else{
							$d1=strtotime($time);
							$d2=strtotime($val['coursetime']);
							$days=round(($d1-$d2)/3600/24);
							if($days == '1'){
								if($val['num'] >= '1'){
									$arr = $class->classlist($val['course_id']);
									$count = count($arr);
									if($count > $val['coursesum']){
										$list[$key]['coursesum'] = $val['coursesum']+1;
									}
					        		if($val['coursenum'] >= '1'){
					        			$list[$key]['coursenum'] = $val['coursenum']-1;
					        		}else{
					        			$list[$key]['coursenum'] = $val['coursenum'];
					        		}
					        		$list[$key]['coursetime'] = date('Y-m-d',time());
					        		$list[$key]['num'] = 0;
								}else{
					        		$list[$key]['coursesum'] = $val['coursesum'];
					        		$list[$key]['coursenum'] = $val['coursenum']+$days;
					        		$list[$key]['coursetime'] = date('Y-m-d',time());
					        		$list[$key]['num'] = 0; 
								}
							}else{
								if($val['num'] >= '1'){
									$arr = $class->classlist($val['course_id']);
									$count = count($arr);
									if($count > $val['coursesum']){
										$list[$key]['coursesum'] = $val['coursesum']+1;
									}
					        		$list[$key]['coursenum'] = $val['coursenum']+$days-1;
					        		$list[$key]['coursetime'] = date('Y-m-d',time());
					        		$list[$key]['num'] = 0;
								}else{
					        		$list[$key]['coursesum'] = $val['coursesum'];
					        		$list[$key]['coursenum'] = $val['coursenum']+$days;
					        		$list[$key]['coursetime'] = date('Y-m-d',time());
					        		$list[$key]['num'] = 0;
								}
							}
						}
					}
					$arr = json_encode($list);
					$redis->set($name,$arr); 
				}else{//无
					$arr = array();
					foreach ($course as $key => $val) {
						$arr[$key]['course_id'] = $val['course_id'];
						$arr[$key]['course_name'] = $val['course_name'];
						$arr[$key]['course_status'] = $val['course_status'];
						$arr[$key]['course_img'] = $val['course_img'];
						$arr[$key]['course_describe'] = $val['course_describe'];
						$arr[$key]['type'] = $val['type'];
						$arr[$key]['course_if'] = 0;
						$arr[$key]['price'] = $val['price'];
						$arr[$key]['lastprice'] = $val['lastprice'];

						$arr[$key]['coursetime'] = $time;
						$arr[$key]['coursesum'] = 1;
						$arr[$key]['coursenum'] = 0;
						$arr[$key]['num'] = 0;
					}
					$arr = json_encode($arr);
					$redis->set($name,$arr); 
				}

				$datalist = $redis->get($name); 
				$datalist = json_decode($datalist,1);	

				foreach ($datalist as $key => $val) {
					$arr = $class->classlist($val['course_id']);
					$count = count($arr);
					if($count == '0'){
						unset($datalist[$key]);
					}else{
						if($val['course_if'] == '1' && $val['type'] == '3'){
							$datalist[$key]['type'] = '2';
						}

						$datalist[$key]['class_id'] = $arr[$val['coursesum']-1]['class_id'];
						$datalist[$key]['class_name'] = $arr[$val['coursesum']-1]['class_name'];
						if($val['course_status'] == '0'){
							unset($datalist[$key]);
						}
					}
				}
				$datalist['code'] = 1;
		        return json_encode($datalist);
		}

//课节详情
		public function classdetails(){
			if(!isset($_GET['class_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $class_id = $_GET['class_id'];
	        }
	
	        if(!isset($_GET['course_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $course_id = $_GET['course_id'];
	        }

	        $class = model('Goclass');
	        $courseclass = $class->detailslist($course_id);

	        foreach ($courseclass as $key => $val) {
	        	if($val['class_id'] == $class_id){
	        		$list['data'] = $courseclass[$key];
	        		$num = $key;
	        	}
	        }

	        $list['data']['num'] = $num+1;
 			$list['code'] = 1;
		    return json($list);
		} 

		//课程目录
		public function classcatalog(){
	        if(!isset($_GET['course_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $course_id = $_GET['course_id'];
	        }

			if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
	        }else{
	            $user_id = $_GET['user_id'];
	        }


	        $redis = new \Redis;
		    $redis->connect('39.105.163.231', 6379);
			$redis->auth("KKm123456"); //密码验证
			$name = 'xhkmuserid'.$user_id;
			$list = $redis->get($name); 
			$datalist = json_decode($list,1);	

			$sum = 1;
			foreach ($datalist as $key => $val) {
				if($val['course_id'] == $course_id){
					$sum = $val['coursesum'];
				}
			}

	        $class = model('Goclass');
        	$data = $class->userlist($user_id);
        	$courseclass = $class->detailslist($course_id);

			foreach ($courseclass as $key => $val) {
				if($key<$sum){
					$val['status'] = 1;
					$arr['data'][] = $val;
				}else{
					$val['status'] = 0;
					$arr['data'][] = $val;
				}
			}
			

	      	$arr['num'] = count($arr['data']);
 			$arr['code'] = 1;
		    return json($arr);
		} 

		//学员作品
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
		        if(!isset($_GET['class_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $class_id = $_GET['class_id'];
		        }

	  			$works = model('Goclass');
				$data = $works->workssels($page,$class_id);
				
				$users = model('Index');
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


		//上传作业
		public function uploadwork(){
			if(!isset($_GET['user_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $user_id = $_GET['user_id'];
	        }
	        if(!isset($_GET['class_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $class_id = $_GET['class_id'];
	        }
	        if(!isset($_GET['work_img'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $work_img = $_GET['work_img'];
	        }
	        if($work_img == ''){
	        	 $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }
	       if(!isset($_GET['course_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $course_id = $_GET['course_id'];
	        }
	        if(!isset($_GET['formId'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $formid = $_GET['formId'];
	        }

	        $data['user_id'] = $user_id;
	        $data['class_id'] = $class_id;
	        $data['work_img'] = $work_img;
	        $data['work_time'] = time();
	        $data['fromid'] =  $formid;

	        $works = model('Goclass');
	        $arr = $works->userlist($user_id);
			$res = $works->isworks($user_id,$class_id);

			$newtime = date('Y-m-d'); 
			$statustime = date("Y-m-d",$arr['user_time']);
			$lasttime = substr($statustime,0,10);
			if($lasttime!=$newtime){ 
				$uplist['days'] = $arr['days']+1;

				$times = substr($newtime,0,7);
				$ress = $works->ranklist($user_id,$times);
				if($ress){
					$rank['days'] = $ress['days']+1;
	        		$works->rankup($user_id,$times,$rank);
				}else{
					$rank['user_id'] = $user_id;
					$rank['days'] = 1;
					$rank['time'] = $times;
	        		$works->rankadd($rank);
				}
			}
			if($res){
				$data['status'] = 2;
				$works->addworks($data);

			}else{
				$data['status'] = 1;
				$works->addworks($data);

				$redis = new \Redis;
			    $redis->connect('39.105.163.231', 6379);
				$redis->auth("KKm123456"); //密码验证
				$name = 'xhkmuserid'.$user_id;
				$list = $redis->get($name); 
				$datalist = json_decode($list,1);	

				foreach ($datalist as $key => $val) {
					if($val['course_id'] == $course_id){
						$arr = $works->classlist($val['course_id']);
						$count = count($arr);
						
						if($val['coursenum'] >= '1'){
							$datalist[$key]['coursenum'] = $val['coursenum']-1;
							if($count > $val['coursesum']){
								$datalist[$key]['coursesum'] = $val['coursesum']+1;
							}
						}else{
							$datalist[$key]['num'] = $val['num']+1;
						}
 						$datalist[$key]['coursetime'] = date('Y-m-d',time());
					}
				}
				$arr = json_encode($datalist);
				$redis->set($name,$arr); 

			   	$uplist['user_time'] = time();
				$works->classupdata($user_id,$uplist);
			}

			$list['code'] = 1; 
		    return json($list);
		} 

		//作业详情页
		public function workdata(){
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

			$works = model('Goclass');
			$data = $works->worksfind($work_id);

			
			$users = model('Index');
			$data[$work_id]['num'] = $users->worknum($work_id);
			$res = $users->fabulous($work_id,$user_id);
			if($res){
				$data[$work_id]['isfabulous'] = 1;
			}else{
				$data[$work_id]['isfabulous'] = 0;
			}	

			$list['code'] = 1; //成功
			$list['data'] = $data[$work_id];
	        return json($list);
		}

		//查看老师点评内容
		public function teacherlist(){
			if(!isset($_GET['work_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $work_id = $_GET['work_id'];
	        }

	        $works = model('Goclass');
			$data = $works->teacherlist($work_id);
			if($data['status'] == '2'){
				unset($data);
				$data = array();
			}

			if($data){
				$time = date("Y-m-d-H-i-s",$data['com_time']);
		        list($year,$month,$day,$hour,$minute) = explode("-",$time);
				$year_diff = date("Y") - $year;
				$month_diff = date("m") - $month;
				$day_diff = date("d") - $day;
				$hour_diff = date("H") - $hour;
				$minute_diff = date("i") - $minute;

				if($year_diff > 0){
					$data['com_time'] = $year_diff.'年';
				}elseif($month_diff > 0){
					$data['com_time'] = $month_diff.'月';
				}elseif($day_diff > 0){
					$data['com_time'] = $day_diff.'天';
				}elseif($hour_diff > 0){
					$data['com_time'] = $hour_diff.'小时';
				}elseif($minute_diff > 0){
					$data['com_time'] = $minute_diff.'分钟';
				}else{
					$data['com_time'] = '1分钟';
				}
				$list['code'] = 1;
				$list['data'] = $data;
			}else{
				$list['code'] = 0;
			}
			
			 return json($list);
		}

		//隐藏课程目录
		public function hiddencourse(){
			$course = model('Goclass');
		    $data = $course->hiddencourse();

		    $count = count($data);
		    $arr['data'] = $data;
		    if($count == '0'){
		    	$arr['code'] = 0;
		    }else{
		    	$arr['code'] = 1;
		    }

			return json_encode($arr);
		}











		
}