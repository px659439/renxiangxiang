<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Headmaster extends Model
{
	//添加班主任
	public function headmasteradd($data){
		 $result = Db::table('headmaster')
		 	->insertGetId($data);
		return $result;	
	}

	//查询班主任
	public function headmasterlist(){
		 $result = Db::table('headmaster')
		 	->select();
		return $result;	
	}

	//修改班主任状态
	public function Courseupd($h_id,$data)
	{
		$result = Db::table('headmaster')
				->where('h_id', $h_id)
	    		->update($data);
		return $result;	
	}











}
?>