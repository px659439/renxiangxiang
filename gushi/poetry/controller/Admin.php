<?php
namespace app\poetry\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
class Admin extends Common
{
	//添加管理员
	public function admin_add(){
		$data = $_POST;
        if(empty($data)){
        	$role = model('Role');
		  	$rolelist = $role->Rolelist();
	  		//递归（父子级）
	  		$this->assign('role_lists',$rolelist);
	  		//$this->display();
	  		return $this->fetch('admin/admin_add');

			}else{
				$admin = model('Admin');
				$data['admin_pwd'] = md5($data['admin_pwd']);
				if($admin_id = $admin->adminadd($data)){
					// var_dump($admin_id);die;
					$arr = array();
					foreach($data['role_id'] as $key =>$v){
			              $arr[] = array("admin_id"=>$admin_id,"role_id"=>$v);
					}
					// print_r($arr);die;
					if(!empty($arr)){
						if($admin->adminrole($arr)){
							$this->redirect("admin/admin_list",'',0);
							
						}else{
							$this->error("添加失败","admin/admin_add");
							
						}
					}
				}

			}
		
		}

	//管理员展示
		public function admin_list(){
			$data = $_POST;
			 if(empty($data)){
				$admin = model('Admin');
				$adminall = $admin->adminall();
	         	foreach($adminall as $key=>$v){
	         	$node = $admin->adminrolesel($v['admin_id']);
	            $adminall[$key]['mynode']=implode(",", $node);

	         	}
	         	foreach ($adminall as $key => $val) {
	         		if($val['admin_name'] == 'admin'){
	         			unset($adminall[$key]);
	         		}
	         	}
	         	//print_r($adminall);die;
				$this->assign("admin",$adminall);

				return $this->fetch('admin/admin_list');
			 }

		}


		//管理员删除
		public function admin_delete(){
			$admin_id = $_GET['admin_id'];
			$admin = model('Admin');
		   	$del = $admin->admindel($admin_id);
		   	  if($del){
		   	  	   $this->redirect("admin/admin_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","admin/admin_list");
		   	  }
		   
		}

		//修改状态
		public function up_status(){
			$admin_id = $_GET['admin_id'];
			$admin_status = $_GET['admin_status'];
			
			if($admin_status==1){
				$list['admin_status'] = 0;
			}else{
				$list['admin_status'] = 1;
			}

			$admin = model('Admin');
			$res = $admin->adminupd($admin_id,$list);

			if($res){
		   	  	   $this->redirect("admin/admin_list",'',0);
		   	  }else{
		   	  	$this->error("变更状态失败","admin/admin_list");
		   	  }
			 	 
		}












}
?>