<?php
namespace app\poetry\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class Course extends Common
{
	//添加课程
	public function course_add(){
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
			$cour_id = $_GET['cour_id'];
			$course = model('Course');
			$data['status'] = '0';
		   	$del = $course->Coursedel($cour_id,$data);
		   	  if($del){
		   	  	   $this->redirect("course/course_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","course/course_list");
		   	  }
		   
		}

		//添加课节
	public function class_add(){
		$data = $_POST;
        if(empty($data)){
	  		return $this->fetch('course/class_add');

			}else{

				$course = model('Course');
				if($class_id = $course->classadd($data)){
						$this->redirect("course/class_list",'',0);		
					}else{
						$this->error("添加失败","course/class_add");
					}
			}
		
		}


		//课件展示
		public function class_list(){
			$data = $_POST;
			 if(empty($data)){
				$course = model('Course');
				$classall = $course->classall();
	         	
				$this->assign("classall",$classall);
				return $this->fetch('course/class_list');
			 }

		}

			//课件删除
		public function class_delete(){
			$class_id = $_GET['class_id'];
			$course = model('Course');
			$data['status'] = '0';
		   	$del = $course->classdel($class_id,$data);
		   	  if($del){
		   	  	   $this->redirect("course/class_list",'',0);
		   	  }else{
		   	  	$this->error("删除失败","course/class_list");
		   	  }
		   
		}

		//编辑课节
		public function editclass(){
			$cour_id = $_GET['cour_id'];
			$course = model('Course');
			$classall = $course->editclass($cour_id);

			$all = $course->classall();
				
			$this->assign("all",$all);
			$this->assign("cour_id",$cour_id);
			$this->assign("classall",$classall);
			return $this->fetch('course/editclass');

		}

		//删除课程课节
		public function editclassdel(){

			$cour_id = $_GET['cour_id'];
			$class_id = $_GET['class_id'];

			$course = model('Course');
			$res = $course->editclassdel($cour_id,$class_id);

			$classall = $course->editclass($cour_id);

			$all = $course->classall();
				
			$this->assign("all",$all);
			$this->assign("cour_id",$cour_id);
			$this->assign("classall",$classall);
			
			return $this->fetch('course/editclass');

		}

		
		//课程添加课节
		public function editadd(){
			$data = $_POST;
			$course = model('Course');
			$arr = $course->editsel($data['course_id'],$data['class_id']);
			if($arr){
				$this->error('对不起，已有该课程', 'course/course_list');
			}else{
				$res = $course->editadd($data);
			
				$classall = $course->editclass($data['course_id']);
				$all = $course->classall();
				
				$this->assign("all",$all);
				$this->assign("cour_id",$data['course_id']);
				$this->assign("classall",$classall);
				return $this->fetch('course/editclass');
			}

		}

		//选择题
		public function class_choice(){
			$request = request();
			$isget = $request->isGet();
			if($isget){
				$this->assign("class_id",$_GET['class_id']);
				return $this->fetch('course/class_choice');
			}else{
				$data = $_POST;
				$data['topic_type'] = 1;
				$course = model('Course');
				$t_id = $course->topicadd($data);
				foreach ($data['option'] as $key => $val) {
					$val['t_id'] = $t_id;
					$val['option_type'] = 1;
					$res = $course->optionadd($val);
				}
				$this->redirect("course/class_list",'',0);		
			}
		}

		//填空题
		public function class_blanks(){
			$request = request();
			$isget = $request->isGet();
			if($isget){
				$this->assign("class_id",$_GET['class_id']);
				return $this->fetch('course/class_blanks');
			}else{
				$data = $_POST;

				$data['topic_type'] = 3;
				$course = model('Course');
				$t_id = $course->topicadd($data);

				foreach ($data['option'] as $key => $val) {
					foreach ($val as $k => $v) {
						if($val[$k]['option_name'] == ''){
							unset($val[$k]);
							continue;
						}else{
							$v['t_id'] = $t_id;
							$v['option_type'] = 3;
							$res = $course->optionadd($v);
						}

					}
				}

				$this->redirect("course/class_list",'',0);		
			}
		}

		//朗读题
		public function class_read(){
			$request = request();
			$isget = $request->isGet();
			if($isget){
				$this->assign("class_id",$_GET['class_id']);
				return $this->fetch('course/class_read');
			}else{
				$data = $_POST;
				$data['topic_type'] = 2;
				$course = model('Course');
				$t_id = $course->topicadd($data);
				foreach ($data['option'] as $key => $val) {
					$val['t_id'] = $t_id;
					$val['option_type'] = 2;
					$res = $course->optionadd($val);
				}
				$this->redirect("course/class_list",'',0);		
			}
		}

		//课件题目编辑
		public function classedit(){
			$class_id = $_GET['class_id'];
			$course = model('Course');
			$classall = $course->classedit($class_id);

			// echo "<pre>";
			// print_r($classall);die;

			$this->assign("classall",$classall);
			return $this->fetch('course/classedit');

		}

		//删除课件题
		public function topicdel(){
			$t_id = $_GET['t_id'];
			$class_id = $_GET['class_id'];
			$course = model('Course');

			$data['status'] = 0;
			
			$res = $course->topicdel($t_id,$data);

			$classall = $course->classedit($class_id);
			$this->assign("classall",$classall);
			return $this->fetch('course/class_list');

		}



















}
?>