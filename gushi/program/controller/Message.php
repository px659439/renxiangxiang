<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Message extends Controller {
		public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}
   
	 //获取token
    public function gettoken(){
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

            $find = model('Find');
            $wx = $find->getopenid($user_id);
            $form = $find->getformid($work_id);


        if(session('access_tokenes') && time()-session('apptime') < 3600){
          $accessToken = session('access_tokenes');
        }else{
          $appid = 'wxcabcde7981d75cb2';
          $appsecret = '4f112471042e00f021510b1d57df459d';
          $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;

          $curl = curl_init();
          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
          curl_setopt($curl, CURLOPT_TIMEOUT, 500);
          curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
          curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
          curl_setopt($curl, CURLOPT_URL, $url);
          $res = curl_exec($curl);
          curl_close($curl);
          
          //转化为数组  存session
          $url = json_decode($res);
          session('access_tokenes',$url->access_token);
          //加一个时间  判断过期
          session('apptime',time());
          $accessToken = session('access_tokenes');
        }
         $postData = array(
                "touser"        => $wx['wx_openid'],      //用户openid
                "template_id"   =>'rMKdIqgC6hLKmSTntif9Lwp2SUb32HRwrniPSo_0jsI',  //模板消息ID
                "page"          =>'pages/workDetails/workDetails?work_id='.$work_id,          
                "form_id"       => $form['fromid'],      //表单提交场景下，事件带上的 formId；支付场景下，为本次支付的 prepay_id 
                "data"          =>array(
                        'keyword1'  => array('value'=>$form['class_name'],'color'=>'#000000'),
                        'keyword2'  => array('value'=>'点击查看老师的点评内容吧！','color'=>'#000000'),
                        'keyword3'  => array('value'=>'老师点评后根据点评再练习一遍效果最好!♪(＾∀＾)ﾉ','color'=>'#000000'),
                    ),
        );

        $postData =  json_encode($postData,JSON_UNESCAPED_UNICODE);
        $url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=".$accessToken;
        $ch1 = curl_init();
        curl_setopt($ch1,CURLOPT_URL,$url);
        curl_setopt($ch1,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch1,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($ch1,CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch1,CURLOPT_POST,true);
        curl_setopt($ch1,CURLOPT_POSTFIELDS,$postData);
        $data = curl_exec($ch1);
        curl_close($ch1);
        return $data;
    }




  




		
}