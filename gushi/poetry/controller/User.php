<?php
namespace app\poetry\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class User extends Common
{
	//添加课程
	public function content_list(){
		$user = model('user');
  		$userall = $user->userall();
  		foreach ($userall as $key => $val) {
  				if($val['user_moblic'] == ''){
  					unset($userall[$key]);
  				}
  		}
  		$this->assign('userall',$userall);
  		return $this->fetch('content/content_list');
	}
	
  //开通课程页面
  public function courseall(){
      $user_id = $_GET['user_id'];
      $user = model('user');

      $userfind = $user->userfind($user_id);

      $courall = $user->courall();

        // echo "<pre>";
        // print_r($courall);die;

        $this->assign('courall',$courall);
        $this->assign('userfind',$userfind);
        return $this->fetch('content/courseall');
      
    }

   //开通课程
    public function opencourse(){
        $user_id = $_GET['user_id'];
        $num = $_GET['num'];
        $user = model('user');
        $userfind = $user->userfind($user_id);

        $data['user_status'] = substr_replace($userfind['user_status'],1,$num,1);
        $user->userupd($user_id,$data);

        $userfind = $user->userfind($user_id);
        $courall = $user->courall();
       
          $this->assign('courall',$courall);
          $this->assign('userfind',$userfind);
          return $this->fetch('content/courseall');
       
      }























}
?>