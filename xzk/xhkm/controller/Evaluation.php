<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;

class Evaluation extends Controller {

    public function __construct(){

      parent::__construct();
      //跨域
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods:POST,GET");
        header("Access-Control-Allow-Headers:x-requested-with,content-type");
        header("Content-type:text/json;charset=utf-8");
    }

	//登录方法
    public function login()
    {
        $data = $_GET;
        if(empty($data)){
        	 $list['code'] = 2;//参数不能为空
            return json($list);
       	}else{
       		if($data['teacher_account'] == ''){
   				$list['code'] = 6;//账号不能为空
        		return json($list);
       		}elseif($data['teacher_pwd'] == ''){
       			$list['code'] = 7;//密码不能为空
        		return json($list);
       		}
            $teacher = model('teacher');
            $res = $teacher->teachersel($data['teacher_account']);
            if(!empty($res)){
                if(md5($data['teacher_pwd'])==$res['teacher_pwd']){
                    if($res['status']==1){
                    	$list['code'] = 1;//登录成功
                    	$list['teacher_id'] = $res['teacher_id'];
                      $list['success'] = md5(md5('success01').'kkm');
         				     return json($list);
                    }else{
                       	$list['code'] = 3;//账号冻结
            			return json($list);
                    }
                }else{
                	$list['code'] = 4;//密码错误
        			     return json($list);
                }
            }else{
                $list['code'] = 5;//用户不存在
        		    return json($list);
            }
       }  
    }

}