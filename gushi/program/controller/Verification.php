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
   

     //提交判断验证码是否正确
    public function iscode(){
        session_start();
        if(!isset($_GET['mobile'])){
            $list['code'] = 12;//手机号为空
            return json($list);
        }else{
            $mobile = $_GET['mobile'];
        }
        if(!isset($_GET['user_id'])){
            $list['code'] = 18;//openid不能为空
            return json($list);
        }else{
            $user_id = $_GET['user_id'];
        }
        $data['user_moblic'] = $mobile;
        $user = model('Index');
        $res = $user->userphoneup($user_id,$data);
        if($res){
             $list['code'] = 1;//注册成功
        }else{
             $list['code'] = 20;//注册失败,请重新注册
        }
        return json($list);
    }










	











		
}