<?php
namespace app\poetry\model;
use think\Model;
use think\DB;

class Role extends Model
{
	//查询角色表
	public function Rolelist(){
		 $result = Db::table('role')
		 	->select();
		return $result;	
	}

	//添加角色
	public function Roleadd($data){
		$result = Db::table('role')
		 	->insertGetId($data);
		return $result;	
	}

	//添加角色,权限关系表
	public function Rolenode($data){
		$result = Db::table('role_node')
		 	->insertAll($data);
		return $result;	
	}

	//查询角色,权限关系表
	public function Rolenodesel($data)
	{
		$result = Db::table('node')->alias('n')
				->join('role_node r_n','n.node_id = r_n.node_id')
				->where('r_n.role_id','=',$data)
				->column('n.node_name');
		return $result;	
		
	}

//删除角色
	public function roledel($data){
		 $result = Db::table('role')
		 	->where('role_id',$data)
		 	->delete();
		return $result;	
	}

	//修改角色状态
	public function roleupd($role_id,$data)
	{
		$result = Db::table('role')
				->where('role_id', $role_id)
	    		->update($data);

		return $result;	
	}



}
?>