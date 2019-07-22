<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class Teacher extends Common
{
	//老师账号添加
	public function teacher_add(){
		$data = $_POST;
        if(empty($data)){
	  			return $this->fetch('teacher/teacher_add');
			}else{
				$teacher = model('Teacher');
				$data['teacher_pwd'] = md5($data['teacher_pwd']);
						if($teacher->teacheradd($data)){
							$this->redirect("teacher/teacher_list",'',0);
						}else{
							$this->error("添加失败","teacher/teacher_add");
						}
				}
	}
	//老师展示
	public function teacher_list(){
		$teacher = model('Teacher');
		$teacherlist = $teacher->teacherlist();
		$this->assign("teacherlist",$teacherlist);
		return $this->fetch('teacher/teacher_list');
	}
	//删除老师
	public function teacher_delete(){
			$teacher_id = $_GET['teacher_id'];
			$teacher = model('Teacher');
		   	$del = $teacher->teacherdel($teacher_id);
		   	  if($del){
		   	  	   $this->redirect("teacher/teacher_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","teacher/teacher_list");
		   	  }
		}

	//变更老师状态
		public function up_status(){
			$teacher_id = $_GET['teacher_id'];
			$status = $_GET['status'];
			
			if($status==1){
				$list['status'] = 0;
			}else{
				$list['status'] = 1;
			}

			$teacher = model('Teacher');
			$res = $teacher->teacherupd($teacher_id,$list);
			if($res){
		   	  	   $this->redirect("teacher/teacher_list",'',0);
		   	  }else{
		   	  	$this->error("变更状态失败","teacher/teacher_list");
		   	  }	 	 
		}

		//重置老师密码
		public function up_pwd(){
			$teacher_id = $_GET['teacher_id'];
			$list['teacher_pwd'] = md5('123456'); 
			//var_dump($list);die;

			$teacher = model('Teacher');
			$res = $teacher->teacherupd($teacher_id,$list);
			if($res){
		   	  	   $this->redirect("teacher/teacher_list",'',0);
		   	  }else{
		   	  	$this->error("重置已密码","teacher/teacher_list");
		   	  }	 	 
		}

}
?>