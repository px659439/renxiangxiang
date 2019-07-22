<?php
namespace app\poetry\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
class Index extends Common
{

//后台首页
    public function index()
    {
        return $this->fetch('index/index');
    }

     //账号设置
    public function account(){
    	$data = $_POST;
    	$admin_info=session('admin_info');
    	$admin = model('Admin');
    	if(empty($data)){
	    	
	    	$admin_name = $admin_info['admin_name'];
	        $adminlist = $admin->adminsel($admin_name);

	        $this->assign('adminlist',$adminlist);
	  		return $this->fetch('admin/account');

        }else{
        	if(!empty($data['admin_name']))
        	{
        		$list['admin_name'] = $data['admin_name'];
        	}
        	if(!empty($data['admin_pwd']))
        	{
        		$list['admin_pwd'] = md5($data['admin_pwd']);
        	}
       		if(!empty($data['admin_tel']))
        	{
        		$list['admin_tel'] = $data['admin_tel'];
        	}
        	if(!empty($data['admin_mail']))
        	{
        		$list['admin_mail'] = $data['admin_mail'];
        	}

        	$admin_id = $admin_info['admin_id'];
        	$res = $admin->adminupd($admin_id,$list);
			if($res){
				$this->redirect("index/index",'',0,'成功');
			}else{
				$this->error("修改失败","admin/account");
			}
        	
		}


    }

//退出方法
    public function out()
    {
       //	Session::flush();
          $session = session("admin_info",null);
        if(empty($session)){
            $this->redirect("login/login",'',0,'成功');
        }else{
            $this->error("退出失败","lndex/index");
        }

       // $this->success('退出成功', 'Login/login');
    }


}
?>