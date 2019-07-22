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

   		//上课首页展示体验课
		public function experience(){
				if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        $experience = model('Goclass');
		        $data = $experience->courselist(1,3);
		        foreach ($data as $k => $val) {
 			 		$num = $experience->classcount($val['cour_id']);
 			 		if($num == '0'){
 			 			unset($data[$k]);
 			 		}
 			 	}
		        $list = $experience->course(2,3);
		        $arr = array(
		        	'cour_id'=>array(),
		        	'position'=>array()
		        );
		        foreach ($data as $key => $val) {
		        	foreach ($list as $k => $v) {
		        		if($val['cour_id'] == $v['cour_id']){
		        			$arr['cour_id'][] = $v['cour_id'];
		        			$arr['position'][] = $k;
		        		}
		        	}
		        }
		        $user =  $experience->userfind($user_id);
		        $unlock = array();
 		        foreach ($arr['position'] as $k => $val) {
		        	$num = substr($user['user_status'],$val,1);
		        	if($num == '1'){
		        		$unlock[] = $arr['cour_id'][$k];
		        	}
		        }
		        foreach ($data as $key => $val) {
		        	foreach ($unlock as $k => $v) {
		        		if($val['cour_id'] == $v){
		        			$data[$key]['cour_type'] = 1;
		        		}
		        	}
		        }
		        return json_encode($data);
		}

		//上课首页展示正式课
		public function formal(){
				if(!isset($_GET['user_id'])){
		            $list['code'] = 18;//user_id不能为空
		            return json($list);
		        }else{
		            $user_id = $_GET['user_id'];
		        }
		        $experience = model('Goclass');
		        $data = $experience->courseformal(2);
		        foreach ($data as $k => $val) {
		        	$data[$k]['isopening'] = 0;
 			 		$num = $experience->classcount($val['cour_id']);
 			 		if($num == '0'){
 			 			unset($data[$k]);
 			 		}
 			 	}
		        $list = $experience->course(2,3);
		        $arr = array(
		        	'cour_id'=>array(),
		        	'position'=>array()
		        );
		        foreach ($data as $key => $val) {
		        	foreach ($list as $k => $v) {
		        		if($val['cour_id'] == $v['cour_id']){
		        			$arr['cour_id'][] = $v['cour_id'];
		        			$arr['position'][] = $k;
		        		}
		        	}
		        }
		        $user =  $experience->userfind($user_id);
		        $unlock = array();
 		        foreach ($arr['position'] as $k => $val) {
		        	$num = substr($user['user_status'],$val,1);
		        	if($num == '1'){
		        		$unlock[] = $arr['cour_id'][$k];
		        	}
		        }
		        foreach ($data as $key => $val) {
		        	foreach ($unlock as $k => $v) {
		        		if($val['cour_id'] == $v){
		        			$data[$key]['isopening'] = 1;
		        		}
		        	}
		        }
		        return json_encode($data);
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
	        $class = model('Goclass');
        	$courseclass = $class->classlist($course_id);
        	$redis = new \Redis;
		    $redis->connect('39.105.163.231', 6379);
			$redis->auth("KKm123456"); //密码验证
			$name = 'userid'.$user_id.$course_id;
			$list = $redis->get($name); 
			if($list){	//有
				$list = json_decode($list,1);	
				$time = date('Y-m-d',time());
				if($list['coursetime'] == $time){
					if($list['num'] >= '1'){
						if($list['coursenum']>='1'){
							$list['coursesum'] = $list['coursesum']+1;
								foreach ($courseclass as $key => $val) {
				        			if($key <= $list['coursesum']){
				        				$courseclass[$key]['isunlock'] = 1;
				        			}else{
				        				$courseclass[$key]['isunlock'] = 0;
				        			}
			        			}
				        		$arr['coursesum'] = $list['coursesum'];
				        		if($list['coursenum'] >= '1'){
				        			$arr['coursenum'] = $list['coursenum']-1;
				        		}else{
				        			$arr['coursenum'] = $list['coursenum'];
				        		}
				        		$arr['coursetime'] = date('Y-m-d',time());
				        		$arr['num'] = 0;
				        		$res = json_encode($arr);
				        		$redis->set($name,$res);
						}else{
							foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
						}
					}else{
						foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
					}
				}else{
					$d1=strtotime($time);
					$d2=strtotime($list['coursetime']);
					$days=round(($d1-$d2)/3600/24);
					if($days == '1'){
						if($list['num'] >= '1'){
							$list['coursesum'] = $list['coursesum']+1;
							foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
			        		$arr['coursesum'] = $list['coursesum'];
			        		if($list['coursenum'] >= '1'){
			        			$arr['coursenum'] = $list['coursenum']-1;
			        		}else{
			        			$arr['coursenum'] = $list['coursenum'];
			        		}
			        		$arr['coursetime'] = date('Y-m-d',time());
			        		$arr['num'] = 0;
			        		$res = json_encode($arr);
			        		$redis->set($name,$res); 	
						}else{
							foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
		        			$arr = array();
			        		$arr['coursesum'] = $list['coursesum'];
			        		$arr['coursenum'] = $list['coursenum']+$days;
			        		$arr['coursetime'] = date('Y-m-d',time());
			        		$arr['num'] = 0;
			        		$res = json_encode($arr);
			        		$redis->set($name,$res); 
						}
					}else{
						if($list['num'] >= '1'){
							$list['coursesum'] = $list['coursesum']+1;
							foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
			        		$arr['coursesum'] = $list['coursesum'];
			        		$arr['coursenum'] = $list['coursenum']+$days-1;
			        		$arr['coursetime'] = date('Y-m-d',time());
			        		$arr['num'] = 0;
			        		$res = json_encode($arr);
			        		$redis->set($name,$res); 	
						}else{
							foreach ($courseclass as $key => $val) {
			        			if($key <= $list['coursesum']){
			        				$courseclass[$key]['isunlock'] = 1;
			        			}else{
			        				$courseclass[$key]['isunlock'] = 0;
			        			}
		        			}
		        			$arr = array();
			        		$arr['coursesum'] = $list['coursesum'];
			        		$arr['coursenum'] = $list['coursenum']+$days;
			        		$arr['coursetime'] = date('Y-m-d',time());
			        		$arr['num'] = 0;
			        		$res = json_encode($arr);
			        		$redis->set($name,$res); 
						}
					}
				}
			}else{ //无
				foreach ($courseclass as $key => $val) {
        			if($key == '0'){
        				$courseclass[$key]['isunlock'] = 1;
        			}else{
        				$courseclass[$key]['isunlock'] = 0;
        			}
        		}
        		$arr = array();
        		$arr['coursesum'] = 0;
        		$arr['coursenum'] = 0;
        		$arr['coursetime'] = date('Y-m-d',time());
        		$arr['num'] = 0;
        		$res = json_encode($arr);
        		$redis->set($name,$res); 
			}
		    return json_encode($courseclass);
		} 

		//课节详情
		public function classdetails(){
			if(!isset($_GET['class_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $class_id = $_GET['class_id'];
	        }
	        $class = model('Goclass');
	        $courseclass = $class->detailslist($class_id);
		    return json_encode($courseclass);
		} 

		//查询测试题
		public function questions(){
			if(!isset($_GET['class_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $class_id = $_GET['class_id'];
	        }
	        if(!isset($_GET['page'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $page = $_GET['page'];
	        }
	        $class = model('Goclass');
	        $data = $class->testlist($class_id,$page);
	        $data[0]['option'] = $class->optionlist($data[0]['t_id']);
	   		$data = $data[0];
	        $data['num'] =  $class->testnum($class_id);

	        if($data['topic_type'] == '3'){
	        	foreach ($data['option'] as $key => $val) {
	        		for ($i=0; $i < 7; $i++) { 
	        			if($val['blanks'] == $i){
	        				$list[$i][] = $val;
	        			}
	        		}
	        	}
	        	$option = array_values($list);
	        	foreach ($option as $key => $value) {
	        		foreach ($value as $k => $val) {
	        			$arr = 'option_if'.$key;
	        			$option[$key][$k][$arr] = $val['option_if'];
	        			$option[$key][$k]['blanks'] = $k;
	        		}
	        	}
	        	$data['option'] = $option;
	        }

	        // echo "<pre>";
	        // print_r($data);die;

		    return json_encode($data);
		}

		//测试题完成记录解锁课节
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
	       	if(!isset($_GET['course_id'])){
	            $list['code'] = 18;//user_id不能为空
	            return json($list);
	        }else{
	            $course_id = $_GET['course_id'];
	        }
	        $data['user_id'] = $user_id;
	        $data['class_id'] = $class_id;
	       	$data['course_id'] = $course_id;
	        $works = model('Goclass');
			$res = $works->isworks($user_id,$class_id,$course_id);
			if(!$res){
				$redis = new \Redis;
			    $redis->connect('39.105.163.231', 6379);
				$redis->auth("KKm123456"); //密码验证
				$name = 'userid'.$user_id.$course_id;
				$list = $redis->get($name); 
				$list = json_decode($list,1);	
				$arr = array();
        		$arr['coursesum'] = $list['coursesum'];
        		$arr['coursenum'] = $list['coursenum'];
        		$arr['coursetime'] = date('Y-m-d',time());
        		$arr['num'] = $list['num']+1;
        		$arr = json_encode($arr);
				$redis->set($name,$arr); 
				$works->isworksadd($data);
			}
			$list['code'] = '1';
		    return json_encode($list);
		} 

		
		
}