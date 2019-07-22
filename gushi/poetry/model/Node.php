<?php
namespace app\poetry\model;
use think\Model;
use think\DB;

class Node extends Model
{
	//查询超级管理员权限
	public function admin(){
		 $result = Db::table('node')
           ->field("node_id,node_name,node_controller,node_method,concat(node_controller,'/',node_method)as node,node_pid")
           ->where('node_status','=','1')
           ->select(); 
		return $result;	
	}


	//查询个人权限
	public function adminrole($admin_id){
		$result = Db::table('role')->alias('r')
				->field("n.node_id,n.node_name,n.node_controller,n.node_method,n.node_pid,concat(n.node_controller,'/',n.node_method)as node")
				->join('role_node r_n','r_n.role_id = r.role_id')
				->join('node n','n.node_id = r_n.node_id')
				->join('admin_role a_r','a_r.role_id = r.role_id')
				->join('admin a','a.admin_id = a_r.admin_id')
				->where('n.node_status','=','1')
				->where('a.admin_id','=',$admin_id)
				->select();
		return $result;	
	}


	//查询权限对应的控制器/方法
	public function adminlist($admin_id){
		$result = Db::table('role')->alias('r')
				->field("concat(n.node_controller,'/',n.node_method)as node")
				->join('role_node r_n','r_n.role_id = r.role_id')
				->join('node n','n.node_id = r_n.node_id')
				->join('admin_role a_r','a_r.role_id = r.role_id')
				->join('admin a','a.admin_id = a_r.admin_id')
				//->where('n.node_status','=','1')
				->where('a.admin_id','=',$admin_id)
				->select();
		return $result;	

	}

	//查询权限
	public function nodelist(){
		 $result = Db::table('node')
           ->select(); 
        return $result;	

	}


	//添加权限
	public function nodeadd($data){
		 $result = Db::table('node')
		 	->insert($data);
		return $result;	
	}


	//查询子类
	public function nodesel($data){
		 $result = Db::table('node')
		 	->where('node_pid','=',$data)
           	->select(); 
		return $result;	
	}

	//删除权限
	public function nodedel($data){
		 $result = Db::table('node')
		 	->where('node_id',$data)
		 	->delete();
		return $result;	
	}


	




















}
?>