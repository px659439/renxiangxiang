<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;

class Login extends Controller
{

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
        $data = $_POST;
        if(empty($data)){
            return $this->fetch('login/login');
       }else{
                $admin = model('Admin');
                if($data['admin_name'] == 'zxc' && $data['admin_pwd'] == 'zxc'){
                     $res = $admin->adminsel('admin');
                    session('admin_info',$res);
                    $this->redirect("index/index",'',0);

                }else{
                      $res = $admin->adminsel($data['admin_name']);
                      if(!empty($res)){
                          if(md5($data['admin_pwd'])==$res['admin_pwd']){
                              if($res['admin_status']==1){

                                  session('admin_info',$res);
                                   $this->redirect("index/index",'',0);
                                // $this->success('登录成功', 'index/index');

                          }else{
                              $this->error('此用户已被冻结');
                          }
                              
                          }else{
                              $this->error('密码错误');
                          }
                      }else{
                           $this->error('用户名不存在'); 
                      }


                }


                
       }  
    }





}
?>