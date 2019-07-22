<?php
namespace app\poetry\model;
use think\Model;
use think\DB;

class Admin extends Model
{
	//查询用户表
	public function adminsel($name){
		 $result = Db::table('admin')
		 	//->field('admin_name,admin_pwd,admin_status,admin_id')
           ->where('admin_name','=',$name)
           ->find();
		return $result;	
	}

	//添加管理员
	public function adminadd($data){
		 $result = Db::table('admin')
		 	->insertGetId($data);
		return $result;	
	}

	//添加管理员与角色的关系
	public function adminrole($data){
		 $result = Db::table('admin_role')
		 	->insertAll($data);
		return $result;	
	}

	//查询所有管理员
	public function adminall(){
		 $result = Db::table('admin')
           ->select(); 
        return $result;	

	}

	//查询角色,管理员关系表
	public function adminrolesel($data)
	{
		$result = Db::table('role')->alias('r')
				->join('admin_role a_r','r.role_id = a_r.role_id')
				->where('a_r.admin_id','=',$data)
				->column('r.role_name');
		return $result;	
		
	}

	//修改管理员信息
	public function adminupd($admin_id,$data)
	{
		$result = Db::table('admin')
				->where('admin_id', $admin_id)
	    		->update($data);

		return $result;	
	}
		
	//删除角色
	public function admindel($data){
		 $result = Db::table('admin')
		 	->where('admin_id',$data)
		 	->delete();
		return $result;	
	}

	











}
?>