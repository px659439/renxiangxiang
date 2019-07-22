<?php
namespace app\xhkm\model;
use think\Model;
use think\DB;

class Works extends Model
{
	//查询未点评作品
	public function workssel($page=1){
		$num = $page*5;
		 $result = Db::table('works')->alias('w')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('w.status','1')
		 		->order('w.work_time desc')
		 		->limit($num-5,5)
		 		->column('w.work_id,w.work_time,u.user_name,wx.wx_name');
		return $result;	
	}

	//查询作品详情
	public function worksfind($work_id){
		 $result = Db::table('works')->alias('w')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('class c','c.class_id = w.class_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('w.work_id',$work_id)
		 		->column('w.work_id,u.user_name,wx.wx_name,c.class_name,w.work_img,u.user_id');
		return $result;	
	}

	//作品完成
	public function worksadd($data){
		 $result = Db::table('comment')
		 			->insertGetId($data);
		return $result;
	}

	//修改作品状态
	public function worksup($work_id,$data){
		 $result = Db::table('works')
		 		->where('work_id', $work_id)
	    		->update($data);
		return $result;
	}

	//查询点评作品
	public function worksel($work_id){
		 $result = Db::table('comment')
		 		->where('work_id', $work_id)
	    		->select();
		return $result;
	}

	//修改点评内容
	public function worksupda($work_id,$data){
		 $result = Db::table('comment')
		 		->where('work_id', $work_id)
	    		->update($data);
		return $result;
	}

	//获取用户数据
	public function userlist($user_id){
		 $result = Db::table('users')
		 		->where('user_id', $user_id)
	    		->find();
		return $result;
	}
	//修改用户数据
	public function usersup($user_id,$data){
		 $result = Db::table('users')
		 		->where('user_id', $user_id)
	    		->update($data);
		return $result;
	}

	//查询表彰排行表
	public function ranklist($user_id,$times){
		 $result = Db::table('ranking')
		 		->where('user_id', $user_id)
		 		->where('time', $times)
	    		->find();
		return $result;
	}
	//修改表彰排行表
	public function rankup($user_id,$time,$data){
		 $result = Db::table('ranking')
		 		->where('user_id', $user_id)
		 		->where('time', $time)
	    		->update($data);
		return $result;
	}
	//表彰排行表
	public function rankadd($data){
		 $result = Db::table('ranking')
		 			->insertGetId($data);
		return $result;
	}

//查询未点评作品
	public function worksselall(){
		 $result = Db::table('works')->alias('w')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('weixin wx','wx.wx_id = u.wx_id')
		 		->where('w.status','1')
		 		->count();
		return $result;	
	}

}
?>