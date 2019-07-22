<?php

/*
 * 阿里云控制器
 */

namespace app\program\controller;
use DateTime;
use think\Controller;

class Aliyun extends Controller {
    /**
     * 发送验证码，进行快速登录
     */
    public function quickloginsms(){
        $mobile=$_POST['mobile'];
        $county=$_POST['country'];
        if ($county != 86) {
            $mobile = "00" . $county . $mobile;
            $tempcode = "SMS_143560411";
        } else {
            $tempcode = "SMS_135720022";
        }
        $pass = rand(1, 9) . rand(1, 9) . rand(1, 9) . rand(1, 9);
        session('userloginquicksmscode', $pass);
        //发送手机验证码
        $accessKeyId = "LTAIBb2UQLYZbc69";
        $accessKeySecret = "6alE4QLzACWxzJ9xHyXDRadHcioW9i";
        $params["PhoneNumbers"] = $mobile;
        $params["SignName"] = "开开教育";
        $params["TemplateCode"] = $tempcode;
        $params['TemplateParam'] = Array(
            "code" => $pass);
        $params['OutId'] = "6688";
        $params['SmsUpExtendCode'] = "1234567";
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        $helper = new \Aliyun\DySDKLite\SignatureHelper();
        $content = $helper->request(
            $accessKeyId, $accessKeySecret, "dysmsapi.aliyuncs.com", array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action" => "SendSms",
                "Version" => "2017-05-25",
            ))
            );
        return array("code" =>200);
    } 
    /**
     * 发送测试邮件
     */
    public function sendemail_reg(){
        $mailto='beiqiaofeng@163.com';
        $mailsubject="测试邮件";
        $mailbody="kk平台测试邮件内容";
        $smtpserver     = "smtpdm.aliyun.com";
        $smtpserverport = 25;
        $smtpusermail   = "service@mailyun.kkmandarin.com";
        $smtpuser       = "service@mailyun.kkmandarin.com";
        $smtppass       = "KYtm12345678";
        $mailsubject    = "=?UTF-8?B?" . base64_encode($mailsubject) . "?=";
        $mailtype       = "HTML";
        $smtp           = new \Email\Smtp($smtpserver, $smtpserverport, true, $smtpuser, $smtppass);
        $smtp->debug    = true;
        $ret=$smtp->sendmail($mailto, $smtpusermail, $mailsubject, $mailbody, $mailtype);
        print_r($ret);
    }
    /*
     * 发送注册短信
     */

    public function sendsmsreg($mobile, $authcode, $county = 86) {
        if ($county != 86) {
            $mobile = "00" . $county . $mobile;
            $tempcode = "SMS_136385789";
        } else {
            $tempcode = "SMS_167180087";
        }
        $accessKeyId = "LTAIBb2UQLYZbc69";
        $accessKeySecret = "6alE4QLzACWxzJ9xHyXDRadHcioW9i";
        $params["PhoneNumbers"] = $mobile;
        $params["SignName"] = "小猴开开写字课";
        $params["TemplateCode"] = $tempcode;
        $params['TemplateParam'] = Array(
            "code" => $authcode);
        $params['OutId'] = "6688";
        $params['SmsUpExtendCode'] = "1234567";

        
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        $helper = new \Aliyun\DySDKLite\SignatureHelper();
        $content = $helper->request(
                $accessKeyId, $accessKeySecret, "dysmsapi.aliyuncs.com", array_merge($params, array(
            "RegionId" => "cn-hangzhou",
            "Action" => "SendSms",
            "Version" => "2017-05-25",
                ))
        );

        return array("code" => $content['Code'], "rid" => $content['RequestId']);
    }

    /*
     * 发送密码修改验证码
     */

    public function sendsmsupd($mobile, $authcode, $county = 86) {
        if ($county != 86) {
            $mobile = "00" . $county . $mobile;
            $tempcode = "SMS_136385791";
        } else {
            $tempcode = "SMS_135720018";
        }
        $accessKeyId = "LTAIBb2UQLYZbc69";
        $accessKeySecret = "6alE4QLzACWxzJ9xHyXDRadHcioW9i";
        $params["PhoneNumbers"] = $mobile;
        $params["SignName"] = "开开教育";
        $params["TemplateCode"] = $tempcode;
        $params['TemplateParam'] = Array(
            "code" => $authcode);
        $params['OutId'] = "6688";
        $params['SmsUpExtendCode'] = "1234567";
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        $helper = new \Aliyun\DySDKLite\SignatureHelper();
        $content = $helper->request(
                $accessKeyId, $accessKeySecret, "dysmsapi.aliyuncs.com", array_merge($params, array(
            "RegionId" => "cn-hangzhou",
            "Action" => "SendSms",
            "Version" => "2017-05-25",
                ))
        );

        return array("code" => $content['Code'], "rid" => $content['RequestId']);
    }

    /*
     * 上传到oss获取密钥
     */

    public function ossupload() {
        $id = 'LTAIBb2UQLYZbc69';
        $key = '6alE4QLzACWxzJ9xHyXDRadHcioW9i';
        $host = 'http://kkmandarin.oss-cn-beijing.aliyuncs.com';
        $now = time();
        $expire = 30; //设置该policy超时时间是10s. 即这个policy过了这个有效时间，将不能访问
        $end = $now + $expire;
        $expiration = $this->gmt_iso8601($end);
        $dir = 'img/';
        //最大文件大小.用户可以自己设置
        $condition = array(0 => 'content-length-range', 1 => 0, 2 => 1048576000);
        $conditions[] = $condition;
        //表示用户上传的数据,必须是以$dir开始, 不然上传会失败,这一步不是必须项,只是为了安全起见,防止用户通过policy上传到别人的目录
        $start = array(0 => 'starts-with', 1 => '$key', 2 => $dir);
        $conditions[] = $start;
        $arr = array('expiration' => $expiration, 'conditions' => $conditions);
        //echo json_encode($arr);
        //return;
        $policy = json_encode($arr);
        $base64_policy = base64_encode($policy);
        $string_to_sign = $base64_policy;
        $signature = base64_encode(hash_hmac('sha1', $string_to_sign, $key, true));
        $response = array();
        $response['accessid'] = $id;
        $response['host'] = $host;
        $response['policy'] = $base64_policy;
        $response['signature'] = $signature;
        $response['expire'] = $end;
        //这个参数是设置用户上传指定的前缀
        $response['dir'] = $dir;
        return $response;
    }

    function gmt_iso8601($time) {
        $dtStr = date("c", $time);
        $mydatetime = new DateTime($dtStr);
        $expiration = $mydatetime->format(DateTime::ISO8601);
        $pos = strpos($expiration, '+');
        $expiration = substr($expiration, 0, $pos);
        return $expiration . "Z";
    }

}
