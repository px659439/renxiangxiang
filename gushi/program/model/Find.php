<?php
namespace app\program\model;
use think\Model;
use think\DB;

class Find extends Model
{
	
	//分页获取用户作品
	public function comments($page=1){
		$num = $page*6;
		 $result = Db::table('comment')->alias('c')
		 		->join('works w','c.work_id = w.work_id')
		 		->join('users u','w.user_id = u.user_id')
		 		->join('weixin wx','u.wx_id = wx.wx_id')
		 		->where('c.status','1')
		 		->order('c.com_time desc')
		 		->limit($num)
		 		->field('c.com_time,u.user_name,u.user_img,wx.wx_name,wx.wx_img,c.commend,c.days,w.work_id,w.work_img')
		 		->select();
		return $result;	
	}


//分页获取人气排行榜
	public function popularity($page=1,$time){
		$num = $page*20;
		 $result = Db::table('ranking')->alias('r')
		 		->join('users u','r.user_id = u.user_id')
		 		->join('weixin wx','u.wx_id = wx.wx_id')
		 		->where('r.time',$time)
		 		->order('r.fabulous desc')
		 		->limit($num)
		 		->field('u.user_name,u.user_img,wx.wx_name,wx.wx_img,r.fabulous,u.user_id')
		 		->select();
		return $result;	
	}

	//分页获取坚持排行榜
	public function insist($page=1,$time){
		$num = $page*20;
		 $result = Db::table('ranking')->alias('r')
		 		->join('users u','r.user_id = u.user_id')
		 		->join('weixin wx','u.wx_id = wx.wx_id')
		 		->where('r.time',$time)
		 		->order('r.days desc')
		 		->limit($num)
		 		->field('u.user_name,u.user_img,wx.wx_name,wx.wx_img,r.days,u.user_id')
		 		->select();
		return $result;	
	}

//分页获取表彰排行榜
	public function commend($page=1,$time){
		$num = $page*20;
		 $result = Db::table('ranking')->alias('r')
		 		->join('users u','r.user_id = u.user_id')
		 		->join('weixin wx','u.wx_id = wx.wx_id')
		 		->where('r.time',$time)
		 		->order('r.commend desc')
		 		->limit($num)
		 		->field('u.user_name,u.user_img,wx.wx_name,wx.wx_img,r.commend,u.user_id')
		 		->select();
		return $result;	
	}


//查询单个用户的上月信息
	public function rankuser($user_id,$time){
		 $result = Db::table('ranking')
				->where('user_id',$user_id)
		 		->where('time',$time)
		 		->find();
		return $result;	
	}

	//查询用户openid
	public function getopenid($user_id){
		 $result = Db::table('users')->alias('u')
		 		->join('weixin wx','u.wx_id = wx.wx_id')
		 		->where('u.user_id',$user_id)
		 		->field('wx.wx_openid')
		 		->find();
		return $result;	
	}

	//查询作品formid
	public function getformid($work_id){
		 $result = Db::table('works')->alias('w')
		 		->join('class c','w.class_id = c.class_id')
		 		->where('w.work_id',$work_id)
		 		->field('w.fromid,c.class_name')
		 		->find();
		return $result;	
	}







}
?>