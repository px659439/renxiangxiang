<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Verification extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}
   
	 //发送手机号验证码
    public function phonecode(){
        session_start();
        $types =1;   //短信类型 1注册短信、
        if(!isset($_GET['mobile'])){
            $list['code'] = 12;//手机号为空
            return json($list);
        }else{
            $mobile = $_GET['mobile'];
        }
        if($mobile == ''){
            $list['code'] = 12;//手机号为空
            return json($list);
        }
        if(!isset($_GET['user_id'])){
            $list['code'] = 12;//手机号为空
            return json($list);
        }else{
            $user_id = $_GET['user_id'];
        }
        $event = controller('Aliyun');
        //注册短信生成随机密码，并设置sessionb变量
        if ($types == 1) {
            // $admins = model('Index');
            // $ret = $admins->queryuser($mobile);
            // if (count($ret)) {
            //     $list['code'] = 13;//手机已经注册
            //     return json($list);
            // }
            $pass = rand(1, 9) . rand(1, 9) . rand(1, 9) . rand(1, 9);
          //  session('user'.$mobile, $pass);
            $res =  $event->sendsmsreg($mobile, $pass);
            if($res['code'] == 'OK'){
                $data['pass'] = $pass;
                $user = model('Index');
                $res = $user->userphoneup($user_id,$data);
                $list['code'] = 1;//手机已经注册
                $list['phonecode'] = $pass;
            }else{
                 $list['code'] = 27;//手机已经注册
            }
           
        }

        return json($list);
    }


     //提交判断验证码是否正确
    public function iscode(){
        session_start();
        if(!isset($_GET['mobile'])){
            $list['code'] = 12;//手机号为空
            return json($list);
        }else{
            $mobile = $_GET['mobile'];
        }
        // if(!isset($_GET['pass'])){
        //     $list['code'] = 16;//验证码不能为空
        //     return json($list);
        // }else{
        //     $pass = $_GET['pass'];
        // }
        if(!isset($_GET['user_id'])){
            $list['code'] = 18;//openid不能为空
            return json($list);
        }else{
            $user_id = $_GET['user_id'];
        }

        // $goclass = model('Goclass');
        // $ret = $goclass->userlist($user_id);
        // $getpass = $ret['pass'];
        // if($getpass == $pass)
        // {
            $data['user_phone'] = $mobile;
            $user = model('Index');
            $res = $user->userphoneup($user_id,$data);
            if($res){
                 $list['code'] = 1;//注册成功
            }else{
                 $list['code'] = 20;//注册失败,请重新注册
            }
        // }else{
        //     $list['code'] = 19;//验证码错误
        // }
        return json($list);
    }










	











		
}