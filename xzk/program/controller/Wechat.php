<?php
namespace app\program\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 

class Wechat extends Controller {
	public function __construct(){
		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");
		}

//获取openid并判断是否跳到小程序
	public function getcode(){

		$code = $_GET['code'];
		$AppID = 'wxcabcde7981d75cb2';
		$AppSecret = '4f112471042e00f021510b1d57df459d';
		$url = "https://api.weixin.qq.com/sns/jscode2session?appid=$AppID&secret=$AppSecret&js_code=$code&grant_type=authorization_code";

		 	$info=curl_init();
		    curl_setopt($info,CURLOPT_RETURNTRANSFER,true);
		    curl_setopt($info,CURLOPT_HEADER,0);
		    curl_setopt($info,CURLOPT_NOBODY,0);
		    curl_setopt($info,CURLOPT_SSL_VERIFYPEER, false);
		    curl_setopt($info,CURLOPT_SSL_VERIFYHOST, false);
		    curl_setopt($info,CURLOPT_URL,$url);
		    $arr= curl_exec($info);
		    curl_close($info);

		$arr = json_decode($arr, true);
		$session_key = $arr['session_key'];
		$openid = $arr['openid'];
		
		$weixin = model('weixin');
		$res = $weixin->weixinsel($openid);
		if($res){
			if($res['wx_name'] == ''){
					$list['code'] = 15;//获取用户信息
			}else{
					if($res['user_phone'] == ''){
						$list['code'] = 14;//跳转课程介绍页
						$list['user_id'] = $res['user_id'] ;
					}else{
						
							$list['code'] = 1;//跳转小程序
							$list['user_id'] = $res['user_id'] ;
						
					}
			}

		}else{
			$list['code'] = 15;//获取用户信息
		}

		$list['session_key'] = $session_key;
		$list['openid'] = $openid;
		return json($list);
	}


//获取微信入库用户信息
	public function rmation(){
		if(!isset($_GET['openid'])){
            $list['code'] = 18;//openid不能为空
            return json($list);
        }else{
            $data['wx_openid'] = $_GET['openid'];
        }
        if($data['wx_openid'] == ''){
        	$list['code'] = 18;//openid不能为空
            return json($list);
        }
		if(!isset($_GET['wx_img'])){
            $list['code'] = 21;//微信头像不能为空
            return json($list);
        }else{
            $data['wx_img'] = $_GET['wx_img'];
        }
        if(!isset($_GET['wx_name'])){
            $list['code'] = 22;//微信昵称不能为空
            return json($list);
        }else{
            $data['wx_name'] = $_GET['wx_name'];
        }
        $data['addtime'] = time();
        $weixin = model('weixin');
        $res = $weixin->weixinsel($data['wx_openid']);
        if($res){
        	$openid = $data['wx_openid'];
        	unset($data['wx_openid']);
        	$update = $weixin->weixinupdate($openid,$data);
        	$list['code'] = 1;
			$list['user_id'] = $res['user_id'] ;
        }else{
        	$wx_id = $weixin->weixinadd($data);
			if($wx_id){
				$arr['wx_id'] = $wx_id;
				$res = $weixin->useradd($arr);
				if($res){
					$list['code'] = 1;
					$list['user_id'] = $res;
				}else{
					$list['code'] = 23;//添加用户失败
				}
			}else{
				$list['code'] = 24;//添加微信用户失败
			}
        }
		
		return json($list);
	}

    	
//签名验证
	public  function autograph(){

		$accessKeyId = "LTAIQWfZax1hLcmH";
    	$accessKeySecret = "MZCaAEyJYoCiOXv3ZScpQInkXJmLZV";
    	$time = date('Y-m-d',strtotime("+1 day"));
		$Policy   =  array(
    			'expiration'=> $time.'T12:00:00.000Z',
    			'conditions'=>array(
    			    '0'=>array(
    			        '0'=>"content-length-range",
    				    '1'=>0,
    				    '2'=>20 * 1024 * 1024
    			        ),
    			)
    	);
		$policyjson = base64_encode(json_encode($Policy));
 		$signature = base64_encode(hash_hmac('sha1', $policyjson, $accessKeySecret, true));

    	$list['accessKeyId'] = $accessKeyId;
    	$list['policy'] = $policyjson;
    	$list['signature'] = $signature;
    	return json($list);
	}


//获取openid并判断是否跳到小程序
	public function getcodeuser(){

		$code = $_GET['code'];
		$AppID = 'wxcabcde7981d75cb2';
		$AppSecret = '4f112471042e00f021510b1d57df459d';
		$url = "https://api.weixin.qq.com/sns/jscode2session?appid=$AppID&secret=$AppSecret&js_code=$code&grant_type=authorization_code";

		 	$info=curl_init();
		    curl_setopt($info,CURLOPT_RETURNTRANSFER,true);
		    curl_setopt($info,CURLOPT_HEADER,0);
		    curl_setopt($info,CURLOPT_NOBODY,0);
		    curl_setopt($info,CURLOPT_SSL_VERIFYPEER, false);
		    curl_setopt($info,CURLOPT_SSL_VERIFYHOST, false);
		    curl_setopt($info,CURLOPT_URL,$url);
		    $arr= curl_exec($info);
		    curl_close($info);

		$arr = json_decode($arr, true);
		$openid = $arr['openid'];
		
		$data['openid'] = $openid;

		$weixin = model('weixin');
		$res = $weixin->weixinsel($openid);
		if($res){
			$list['user_id'] = $res['user_id'] ;
        }else{
        	$wx_id = $weixin->weixinadd($data);

			if($wx_id){
				$arr['wx_id'] = $wx_id;
				$res = $weixin->useradd($arr);
				if($res){
					$list['user_id'] = $res;
				}
        	}

		}
	return json($list);
	}

//判断用户是否开通课程
	public function isopening(){
		if(!isset($_GET['user_id'])){
            $list['code'] = 18;//user_id不能为空
            return json($list);
        }else{
            $user_id = $_GET['user_id'];
        }
        if($user_id == ''){
        	$list['code'] = 18;//user_id不能为空
            return json($list);
        }
  
			$list['code'] = 1;//跳转小程序
		
		return json($list);
	}


	//微信小程序消息推送	
	public  function weixin(){

		// $signature = $_GET["signature"];
	 //    $timestamp = $_GET["timestamp"];
	 //    $nonce = $_GET["nonce"];

	 //    $token = 'kaikaiwrite';
	 //    $tmpArr = array($token, $timestamp, $nonce);
	 //    sort($tmpArr, SORT_STRING);
	 //    $tmpStr = implode( $tmpArr );
	 //    $tmpStr = sha1( $tmpStr );

	 //    if ($tmpStr == $signature ) {
	 //        echo  $_GET["echostr"];
	 //    } else {
	 //        return false;   
		// }

		//接收客服消息
	    $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
	    if (!empty($postStr) && is_string($postStr)) {
	    $postArr = json_decode($postStr, true);
	    $fromUsername = $postArr['FromUserName'];   //发送者openid
	    if (!empty($postArr['MsgType']) && in_array($postArr['MsgType'], array("text"))) {
            //文字消息
             $content = $postArr['Content'];
	    	  $this->send_message($fromUsername,$content);

	        //记录客服消息到数据库,同事发邮箱通知运营同事,根据个人具体业务做相应处理;
	    } else {//用户进入到客服消息页面
	            $this->send_message($fromUsername);
	    	}
	    }
	    echo "success";
	    exit;
	}

	//回复微信客服消息
	public function send_message($fromUsername,$content)
	{

		if(is_numeric($content) && $content != '1'){
			$data = array(
		        "touser" => $fromUsername,
		        "msgtype" => 'link',
		        "link"	=> array(
					"title" => '【添加老师微信】',
			        "description"=>'请添加老师微信,老师会为你激活课程',
			        "url"=>'https://sixone.kkmandarin.cn/?code='.$content.'/index.html',
			        "thumb_url"=>'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/123.png',
		        ), 
	    	);
		}else{
			$data = array(
		        "touser" => $fromUsername,
		        "msgtype" => 'link',
		        "link"	=> array(
					"title" => '【激活课程】',
			        "description"=>'请添加老师微信,老师会为你激活课程',
			        "url"=>'https://sixone.kkmandarin.cn/?code=1/index.html',
			        "thumb_url"=>'https://kkmandarin.oss-cn-beijing.aliyuncs.com/xiaohou/img/123.png',
		        ), 
	    	);
		}

	    $json = $this->message($data);  //兼容php5.4以下json格式处理
	    if(session('access_tokenes') && time()-session('apptime') < 3600){
      			$access_token = session('access_tokenes');
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
	          $access_token = session('access_tokenes');
        }
	    /*
	    * POST发送https请求客服接口api
	    */
	    $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" . $access_token;
	    //以'json'格式发送post的https请求
	    $ch1 = curl_init();
        curl_setopt($ch1,CURLOPT_URL,$url);
        curl_setopt($ch1,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch1,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($ch1,CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch1,CURLOPT_POST,true);
        curl_setopt($ch1,CURLOPT_POSTFIELDS,$json);
        $data = curl_exec($ch1);
        curl_close($ch1);
	    return $data;

	}
	//json中文处理
	function message($array)
	{
	    if (version_compare(PHP_VERSION, '5.4.0', '<')) {
	    $str = json_encode($array);
	    $str = preg_replace_callback("#\\\u([0-9a-f]{4})#i", function ($matchs) {
	    return iconv('UCS-2BE', 'UTF-8', pack('H4', $matchs[1]));
	    }, $str);
	    return $str;
	    } else {
	    return json_encode($array, JSON_UNESCAPED_UNICODE);
	    }
	}



//解锁微信绑定手机号
	public function decrypt()
	{
      	 $appid = 'wxcabcde7981d75cb2';
            $sessionKey = $_GET['sessionKey'];
            $encryptedData = $_GET['encryptedData'];
            $iv = $_GET['iv'];
       
          $data = $this->decryptData($appid,$sessionKey,$encryptedData,$iv); 


          if($data == NULL){
          	$list['code'] = 0;
          }else{
          	$list['code'] = 1;
          	$list['phone'] = $data['purePhoneNumber'];
          }

          return json_encode($list);
	}

	//解锁微信绑定手机号
	function decryptData( $appid , $sessionKey, $encryptedData, $iv ){
		$OK = 0;
		$IllegalAesKey = -41001;
		$IllegalIv = -41002;
		$IllegalBuffer = -41003;
		$DecodeBase64Error = -41004;

		if (strlen($sessionKey) != 24) {
			return $IllegalAesKey;
		}
		$aesKey=base64_decode($sessionKey);

		if (strlen($iv) != 24) {
			return $IllegalIv;
		}
		$aesIV=base64_decode($iv);

		$aesCipher=base64_decode($encryptedData);

		$result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

		$dataObj=json_decode( $result );
		if( $dataObj  == NULL )
		{
			return $IllegalBuffer;
		}
		if( $dataObj->watermark->appid != $appid )
		{
			return $DecodeBase64Error;
		}
		$data = json_decode($result,true);

		return $data;
	}





}