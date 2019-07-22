<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class User extends Common
{
	//添加课程
	public function content_list(){
		$data = $_GET;
		$user = model('users');
      
  		$userall = $user->userall();

  		// foreach ($userall as $key => $val) {
  		// 		if($val['user_phone'] == ''){
  		// 			unset($userall[$key]);
  		// 		}
  		// }
		
  		//课程列表
  		$courseall = $user->courseall();

  		$count = $user->usercount();

  		$page = ceil($count/10);
  		$this->assign('page',$page);

  		$this->assign('courseall',$courseall);
  		$this->assign('userall',$userall);
  		return $this->fetch('content/content_list');
	}
	//分页
	public function contentpage(){
		$data = $_GET;
		$user = model('users');
     
  		$userall = $user->userall($data['page']);

  		// foreach ($userall as $key => $val) {
  		// 		if($val['user_phone'] == ''){
  		// 			unset($userall[$key]);
  		// 		}
  		// }

  		$courseall = $user->courseall();

  		$count = $user->usercount();
  		$page = ceil($count/10);
  		$this->assign('courseall',$courseall);
  		$this->assign('page',$page);
  		$this->assign('userall',$userall);
  		return $this->fetch('content/content_list');
	}

	//跳转用户课程修改确定页
	public function lesson(){
		$user_id = $_GET['user_id'];
		$type = $_GET['type'];

		$user = model('users');
		$listall = $user->userlist($user_id);

		$this->assign('type',$type);
		$this->assign('listall',$listall);
  		return $this->fetch('content/lesson');
	}

	//修改用户课程状态
	public function updateuser(){
		$data = $_GET;
		$user = model('users');
		$users = $user->userfind($data['user_id']);
	
		$list['status'] = substr_replace($users['status'],1,$data['type'],1);
		
		$course = $user->coursefind($data['course_id']);
		$arr = array();
		$arr['order_name'] = $course['course_name'];
		$arr['order_money'] = $course['lastprice'];
		$arr['order_sn'] = time().$data['user_id'].$data['course_id'];
		$arr['add_time'] = time();
		$arr['user_id'] = $data['user_id'];
		$arr['goods_id'] = $data['course_id'];
		$arr['pay_time'] = date("YmdHis",time());
		$arr['money_pay'] = $course['lastprice'];
		$arr['order_money_status'] = 1;

		$user->orderadd($arr);

		$res = $user->userup($data['user_id'],$list);
		 if($res){
	   	  	   $this->redirect("user/content_list",'',0);
	   	  }else{
	   	  	$this->error("修改失败","user/content_list");
	   	  }

	}

//添加跟进记录
	public function follow(){
		$data = $_POST;
		if(empty($data)){
			$user_id = $_GET['user_id'];
			$this->assign('user_id',$user_id);
	  		return $this->fetch('content/follow');
		}else{
			$data['record_time'] = time();
  			$admin_info=session('admin_info');
  			$data['admin_id'] = $admin_info['admin_id'];
  			$user = model('users');
  			$res = $user->recordadd($data);
	  		if($res){
		   	  	   $this->redirect("user/content_list",'',0);
		   	  }else{
		   	  	$this->error("修改失败","user/content_list");
		   	  }
		}
		
	}


	//展示跟进记录
	public function followlist(){
		$user_id = $_GET['user_id'];
		$user = model('users');
  		$record = $user->recordlist($user_id);

		$this->assign('record',$record);
  		return $this->fetch('content/followlist');
		
	}

	//退款
	public function refund(){
		$user_id = $_GET['user_id'];
		$user = model('users');

		$courseall = $user->courseall();
  		$userlist = $user->userlist($user_id);

  		$this->assign('userlist',$userlist);
		$this->assign('courseall',$courseall);
  		return $this->fetch('content/refund');
		
	}

	//退款修改状态
	public function refundup(){
		$data = $_GET;
		$user = model('users');
		$users = $user->userfind($data['user_id']);
	
		$list['status'] = substr_replace($users['status'],0,$data['type'],1);


		$arr = array();
		$arr['order_money_status'] = 0;
		$arr['pay_time'] = date("YmdHis",time());

		$user->orderup($data['user_id'],$data['course_id'],$arr);

		$user->userup($data['user_id'],$list);

		$courseall = $user->courseall();
  		$userlist = $user->userlist($data['user_id']);

  		$this->assign('userlist',$userlist);
		$this->assign('courseall',$courseall);
  		return $this->fetch('content/refund');
	}











}
?>