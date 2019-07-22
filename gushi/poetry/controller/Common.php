<?php
namespace app\poetry\controller;

use think\Controller;
use think\Model;
use think\DB;

class Common extends Controller {

//限制非法登录
		public function __construct(){

		  parent::__construct();
		  //跨域
		   header("Access-Control-Allow-Origin: *");
	        header("Access-Control-Allow-Methods:POST,GET");
	        header("Access-Control-Allow-Headers:x-requested-with,content-type");
	        header("Content-type:text/json;charset=utf-8");

		   $admin_info=session('admin_info');
		  if(empty($admin_info)){
		  	$this->error('请先登录', 'Login/login');
		  }

		  //判断用户是否有权限访问已有方法
		  if(!$this->check_node()){
		  	$this->error('对不起，权限不足', 'Index/index');
		  }
			//判断是否为超级管理员
		   	$admin_name =  $admin_info['admin_name'];
		  	if($admin_name == 'admin'){
		 	$node = model('Node');
		    $nodes = $node->admin();
		     //递归查询父子级数据
		    $nodelist = $this->getChild($nodes);
		   
		  }else{

		  	$admin_id =  $admin_info['admin_id'];
		  	$node = model('Node');
		    $nodes = $node->adminrole($admin_id);
		  	//递归查询父子级数据
		   $nodelist = $this->getChild($nodes);

		  }

		   //发送数据menu
		  $this->assign("node",$nodelist);

		}


		//检查用户权限
		public function check_node(){

			$admin_info=session('admin_info');
		  	$admin_name =  $admin_info['admin_name'];

			//获取当前控制器/方法
			$controller =  request()->controller();
			$method = request()->action();

		  	$c_m = $controller.'/'.$method;
		  	$c_m = array('node'=>$c_m);

		 	$admin_id = $admin_info['admin_id'];
		 	$node = model('Node');
		    $nodes = $node->adminlist($admin_id);

			if(in_array($c_m,$nodes)){

			  	return true;
			}
			$conmet = array('Index/index','Index/out');


		  if(in_array($controller.'/'.$method,$conmet)){
		  	return true;
		  }
		  if($admin_name == 'admin'){
		  	return true;
		  }
		}

		function getChild($data,$pid=0){
		    
		    $arr = array();
		    foreach ($data as $key => $v){
		    	  if($v['node_pid']==$pid){
		    	  	  $son = $this->getChild($data,$v['node_id']);
		    	  	  if(!empty($son)){
		    	  	  	$v['son'] = $son;
		    	  	  }
		    	  	 $arr[] =$v;   
		    	  }
		          
		    }
		    return $arr;
		}

		function getChild_level($data,$pid=0,$level=0){
		    
		    $arr = array();
		    foreach ($data as $key => $v){
		    	  if($v['node_pid']==$pid){
		    	  	 
		    	  	  $v['level'] = $level;

		    	  	 $arr[] =$v;  
		    	  	 $arr = array_merge($arr,$this->getChild_level($data,$v['node_id'],$level+1));
		    	  }
		          
		    }
		    return $arr;
		}

		function Child_level($data,$pid=0,$level=0){
		    
		    $arr = array();
		    foreach ($data as $key => $v){
		          if($v['parent_id']==$pid){
		             
		              $v['level'] = $level;

		             $arr[] =$v;  
		             $arr = array_merge($arr,$this->Child_level($data,$v['cate_id'],$level+1));
		          }
		          
		    }
		    return $arr;
		}


		function file_img(){
			$image = $_FILES['file'];
			if ($image['error'] > 0) {
                $error = "上传失败了,原因是";
                switch ($image['error']) {
                    case 1:
                        $error .= "大小超过了服务器设置的限制！";
                        break;
                    case 2:
                        $error .= "文件大小超过了表单的限制！";
                        break;
                    case 3:
                        $error .= "文件只有部分被上传！";
                        break;
                    case 4:
                        $error .= "没有文件被上传!";
                        break;
                    case 6:
                        $error .= "上传文件的临时目录不存在！";
                        break;
                    case 7:
                        $error .= "写入失败!";
                        break;
                    default:
                        $error .= "未知的错误！";
                        break;
                }
                //输出错误
                exit($error);
            } else {
                //截取文件后缀名
                $type = strrchr($image['name'], ".");

 				$PHP_SELF = $_SERVER['DOCUMENT_ROOT'];
				$na = uniqid();
                //设置上传路径，我把它放在了upload下的interview目录下（需要在linux中给interview设置文件夹权限）
                $path = $PHP_SELF."/TP5/public/upload/img/" . time().$na.$type; 
                $src = "./upload/img/" . time().$na.$type;
                //判断上传的文件是否为图片格式
                 if (strtolower($type) == '.png' || strtolower($type) == '.jpg' || strtolower($type) == '.bmp' || strtolower($type) == '.gif') {
                    //将图片文件移到该目录下
                    move_uploaded_file($image['tmp_name'], $path);
          
					return $src;
                }
            }
			
		}

		

}