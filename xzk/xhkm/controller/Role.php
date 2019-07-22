<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
class Role extends Common
{
	//添加角色
	public function role_add(){
		$data = $_POST;
        if(empty($data)){
  			$node = model('Node');
			$nodelist = $node->nodelist();
	  		//递归（父子级）
	  		$list =$this->getChild($nodelist);
	  		$this->assign('node_lists',$list);
	  		return $this->fetch('role/role_add');
  	}else{
		  	$datas = $data['node_id'];
		  	unset($data['node_id']);
		  	if(!empty($data)){
		  		$role = model('Role');
		  		if($role_id =$role->Roleadd($data)){

	                foreach($datas as $key =>$v){
	                	$data['mynode'][$key] = array("role_id"=>$role_id,"node_id"=>$v);
	                }
	                if($res = $role->Rolenode($data['mynode'])){
	                	if($res){
	                		$this->redirect("role/role_add",'',0);
	                	}else{
	                		$this->error("添加失败","role/role_add");
	                	}
	                }
		  		}
		  	}

	}
  	
  }

	 //角色展示
	public function role_list(){
		$data = $_POST;
        if(empty($data)){
        	$role = model('Role');
			$rolelist = $role->Rolelist();
			// print_r($rolelist);die;
	         foreach($rolelist as $key=>$v){
	         	$node = $role->Rolenodesel($v['role_id']);
	            $rolelist[$key]['mynode']=implode(",", $node);
	         }

			$this->assign("role",$rolelist);
			return $this->fetch('role/role_list');
		}
	}

	//角色删除
		public function role_delete(){
			$role_id = $_GET['role_id'];
			$role = model('Role');
		   	$del = $role->roledel($role_id);
		   	  if($del){
		   	  	   $this->redirect("role/role_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","role/role_list");
		   	  }
		   
		}

		//修改状态
		public function up_status(){
			$role_id = $_GET['role_id'];
			$role_status = $_GET['role_status'];
			
			if($role_status==1){
				$list['role_status'] = 0;
			}else{
				$list['role_status'] = 1;
			}

			$role = model('Role');
			$res = $role->roleupd($role_id,$list);

			if($res){
		   	  	   $this->redirect("role/role_list",'',0);
		   	  }else{
		   	  	$this->error("变更状态失败","role/role_list");
		   	  }
			 	 
		}

		

}
?>