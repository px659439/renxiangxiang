<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class Classes extends Common
{
	//添加班级
	public function classes_add(){
		$data = $_POST;
		$classes = model('Classes');
        if(empty($data)){
        	$courselist = $classes->courselist();
        	$this->assign("courselist",$courselist);
        	$headmasterlist = $classes->headmasterlist();
        	$this->assign("headmasterlist",$headmasterlist);
	  		return $this->fetch('classes/classes_add');
	  	}else{
	  		$list['c_name'] = $data['c_name'];
	  		$list['h_id'] = $data['h_id'];
	  		$list['time'] = time();

	  		$classes_id = $classes->classesadd($list);
	  		foreach ($data['user_id'] as $key => $val) {
	  			$arr['c_id'] = $classes_id;
 				$arr['user_id'] = $val;
 				$arr['time'] = time();
	  			$classes->learnersadd($arr);
	  		}
            $this->redirect("classes/classes_add",'',0); 
		}
	}

	//查询符合条件的学员列表
	public function userlist(){
		$data = $_GET;
		$classes = model('Classes');
		$list = array();
		$arr = 0;
		if($data['starttime'] == '' && $data['endtime'] == '' && $data['course'] == '' && $data['buystarttime'] == '' && $data['buyendtime'] == ''){
			$arr = 1;
			$list =  $classes->userlist();
		}else{
			if($data['starttime'] == ''){
				$starttime = 0;
			}else{
				$starttime = strtotime($data['starttime']);
			}
			if($data['endtime'] == ''){
				$endtime = '9999999999';
			}else{
				$endtime = strtotime($data['endtime']);
			}
			$list1 = $classes->usertime($starttime,$endtime);
			$list2 = array();
			if($data['course'] != ''){
				$res = explode(',',$data['course']);
				$userlist = $classes->userlist();
				foreach ($userlist as $key => $val) {
					$t = substr($val['status'],$res[0],1);
					if($t == '1'){
						$list2[] = $userlist[$key];
					}
				}
			}else{
				$list2 = $classes->userlist();
			}
			if($data['buystarttime'] == ''){
				$buystart = 0;
				$buystarttime = date('YmdHis',$buystart);
			}else{
				$buystart = strtotime($data['buystarttime']);
				$buystarttime = date('YmdHis',$buystart);
			}
			if($data['buyendtime'] == ''){
				// $buyend = '9999999999';
				// $buyendtime = date('YmdHis',$buyend);
				$buyendtime = "22861121014639";
			}else{
				$buyend = strtotime($data['buyendtime']);
				$buyendtime = date('YmdHis',$buyend);
			}
			if($data['course'] != ''){
				$res = explode(',',$data['course']);
				$list3 = $classes->orderuser($buystarttime,$buyendtime,$res[1]);
			}else{
				$list3 = $classes->orderusers($buystarttime,$buyendtime);
				$list3 = array_unique($list3,SORT_REGULAR);
			}
			$count1 = count($list1);
			$count2 = count($list2);
			$count3 = count($list3);
			if($count1 != '0' && $count2 != '0' && $count3 != '0'){//123
				foreach ($list1 as $keyr => $valu) {
					foreach ($list2 as $key => $val) {
						foreach ($list3 as $ke => $va) {
							if($valu['user_id'] == $val['user_id'] && $valu['user_id'] == $va['user_id']){
								$arr = 1;
								$list[] = $list1[$keyr];
							}
						}
					}
				}
			}elseif($count1 != '0' && $count2 != '0' && $count3 == '0'){//12
				foreach ($list1 as $keyr => $valu) {
					foreach ($list2 as $key => $val) {
						if($valu['user_id'] == $val['user_id']){
							$arr = 1;
							$list[] = $list1[$keyr];
						}
					}
				}
			}elseif($count1 != '0' && $count2 == '0' && $count3 == '0'){//1
				$arr = 1;
				$list = $list1;
			}elseif($count1 == '0' && $count2 == '0' && $count3 == '0'){//0
				$arr = 0;
			}elseif($count1 == '0' && $count2 != '0' && $count3 == '0'){//2
				$arr = 1;
				$list = $list2;
			}elseif($count1 == '0' && $count2 != '0' && $count3 != '0'){//23
				foreach ($list2 as $key => $val) {
					foreach ($list3 as $ke => $va) {
						if($val['user_id'] == $va['user_id']){
							$arr = 1;
							$list[] = $list2[$key];
						}
					}
				}
			}elseif($count1 == '0' && $count2 == '0' && $count3 != '0'){//3
				$arr = 1;
				$list = $list3;
			}elseif($count1 != '0' && $count2 == '0' && $count3 != '0'){//13
				foreach ($list1 as $key => $val) {
					foreach ($list3 as $ke => $va) {
						if($val['user_id'] == $va['user_id']){
							$arr = 1;
							$list[] = $list1[$key];
						}
					}
				}
			}
		}

		if($data['course'] != ''){
			$count2 = count($list2);
			if($count2 == '0'){
				$list = array();
			}
		}
		$array = array();
		$array['code'] = $arr;
		$array['list'] = array_unique($list,SORT_REGULAR);
		return json($array);	
	}

	//班级展示  
	public function classes_list(){
		$classes = model('Classes');
		$classeslist = $classes->classeslist();
		foreach ($classeslist as $key => $val) {
			$classeslist[$key]['num'] = $classes->learnersnum($val['c_id']);
		}
        $this->assign('classeslist',$classeslist);
	  	return $this->fetch('classes/classes_list');
	}

	//更改班级状态
	public function classes_status(){
		$c_id = $_GET['c_id'];
		$status = $_GET['status'];
		if($status==1){
			$list['status'] = 0;
		}else{
			$list['status'] = 1;
		}
		$classes = model('Classes');
		$res = $classes->Courseupd($c_id,$list);
		if($res){
	   	  	   $this->redirect("classes/classes_list",'',0);
	   	  }else{
	   	  	$this->error("变更状态失败","classes/classes_list");
	   	  } 	 
	}

	//学员列表
	public function classes_user(){
		$c_id = $_GET['c_id'];
		$classes = model('Classes');
		$list = $classes->classesuser($c_id);
		$this->assign('c_id',$c_id);
 		$this->assign('userlist',$list);
	  	return $this->fetch('classes/classes_user');
	}

	//移除班级学员
	public function user_del(){
		$c_id = $_GET['c_id'];
		$user_id = $_GET['user_id'];
		$classes = model('Classes');
		$classes->userdel($c_id,$user_id);
		$list = $classes->classesuser($c_id);
		$this->assign('c_id',$c_id);
 		$this->assign('userlist',$list);
	  	return $this->fetch('classes/classes_user');
	}






















}
?>