<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class Course extends Common
{
	//添加课程
	public function Course_add(){
		$data = $_POST;
        if(empty($data)){
	  		return $this->fetch('course/course_add');

			}else{

				$course = model('Course');
				if($course_id = $course->Courseadd($data)){
						$this->redirect("course/course_list",'',0);		
					}else{
						$this->error("添加失败","course/course_add");
					}
				}

			
		}

	//课程展示
		public function course_list(){
			$data = $_POST;
			 if(empty($data)){
				$course = model('Course');
				$courseall = $course->courseall();
	         
				$this->assign("course",$courseall);
				return $this->fetch('course/course_list');
			 }

		}


		//课程删除
		public function course_delete(){
			$course_id = $_GET['course_id'];
			$course = model('Course');
		   	$del = $course->Coursedel($course_id);
		   	  if($del){
		   	  	   $this->redirect("course/course_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","course/course_list");
		   	  }
		   
		}

		//修改状态
		public function up_status(){
			$course_id = $_GET['course_id'];

			$course_status = $_GET['course_status'];
			
			if($course_status==1){
				$list['course_status'] = 0;
			}else{
				$list['course_status'] = 1;
			}

			$course = model('Course');
			
			$res = $course->Courseupd($course_id,$list);

			if($res){
		   	  	   $this->redirect("course/course_list",'',0);
		   	  }else{
		   	  	$this->error("变更状态失败","course/course_list");
		   	  }
			 	 
		}


		//添加课节
	public function class_add(){
		$data = $_POST;
		$course = model('Course');
        if(empty($data)){
    		
			$courselist = $course->coursesel();
			$this->assign("course",$courselist);
	  		return $this->fetch('course/class_add');
			}else{

				if($class_id = $course->classadd($data)){
					$arr = array();
					foreach($data['course_id'] as $key =>$v){
			              $arr[] = array("class_id"=>$class_id,"course_id"=>$v);
					}
					if(!empty($arr)){
						if($course->courseclass($arr)){
							$this->redirect("course/class_list",'',0);
							
						}else{
							$this->error("添加失败","course/class_add");
							
						}
					}
				}
			}
		}

		//课件展示
		public function class_list(){
			$data = $_POST;
			 if(empty($data)){
				$course = model('Course');
				$classall = $course->classall();
	         	foreach($classall as $key=>$v){
	         	$node = $course->courseclasssel($v['class_id']);
	            $classall[$key]['mynode']=implode(",", $node);

	         	}
	         	//print_r($adminall);die;
				$this->assign("classall",$classall);

				return $this->fetch('course/class_list');
			 }

		}

			//课件删除
		public function class_delete(){
			$class_id = $_GET['class_id'];
			$course = model('Course');
		   	$del = $course->classdel($class_id);
		   	  if($del){
		   	  	   $this->redirect("course/class_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","course/class_list");
		   	  }
		   
		}

		//修改课件状态
		public function class_status(){
			$class_id = $_GET['class_id'];
			$class_status = $_GET['class_status'];
			
			if($class_status==1){
				$list['class_status'] = 0;
			}else{
				$list['class_status'] = 1;
			}

			$course = model('Course');
			
			$res = $course->classupd($class_id,$list);

			if($res){
		   	  	   $this->redirect("course/class_list",'',0);
		   	  }else{
		   	  	$this->error("变更状态失败","course/class_list");
		   	  }
			 	 
		}















}
?>