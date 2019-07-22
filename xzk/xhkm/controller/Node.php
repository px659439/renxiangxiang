<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
class Node extends Common
{

		//权限添加
		public function node_add(){
			$data = $_POST;
			$node = model('Node');
        	if(empty($data)){
        		
				$nodelist = $node->nodelist();
				$node_type = $this->getChild_level($nodelist);

				$this->assign("node_type",$node_type);
				return $this->fetch('node/node_add');

			}else{

				$res = $node->nodeadd($data);
				if($res){
					$this->redirect("node/node_add",'',0,'成功');
				}else{
					$this->error("添加失败","node/node_add");
				}
			}
				
			
		}

		//权限展示
		public function node_list(){
			$data = $_POST;
			$node = model('Node');
			 if(empty($data)){
				
				$nodelist = $node->nodelist();
				$nodes = $this->getChild_level($nodelist);

				$this->assign("nodes",$nodes);
				return $this->fetch('node/node_list');
			 }
		}
		//权限删除
		public function node_delete(){
			$node_id = $_GET['node_id'];
			$node = model('Node');
			$res = $node->nodesel($node_id);

		   if(!empty($res)){
		   	  $this->error("该类下有子类","node/node_list");
		   }else{

		   	$del = $node->nodedel($node_id);
		   	  if($del){
		   	  	   $this->redirect("node/node_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","node/node_list");
		   	  }
		   }
		}

}
?>