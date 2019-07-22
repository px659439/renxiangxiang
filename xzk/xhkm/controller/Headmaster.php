<?php
namespace app\xhkm\controller;

use think\Controller;
use think\Model;
use think\DB;
use think\Session;
use think\Upload; 
class Headmaster extends Common
{
	//添加班主任
	public function headmaster_add(){
		$data = $_POST;
        if(empty($data)){
	  		return $this->fetch('headmaster/headmaster_add');
	  	}else{
	  		$headmaster = model('Headmaster');
            if($res = $headmaster->headmasteradd($data)){
            	if($res){
            		$this->redirect("headmaster/headmaster_add",'',0);
            	}else{
            		$this->error("添加失败","headmaster/headmaster_add");
            	}
            }
		}
	}

	//班主任展示
	public function headmaster_list(){
		$headmaster = model('Headmaster');
        $headmasterlist = $headmaster->headmasterlist();
        $this->assign('headmasterlist',$headmasterlist);
	  	return $this->fetch('headmaster/headmaster_list');
	}

	//更改老师状态
	public function headmaster_status(){
		$h_id = $_GET['h_id'];
		$status = $_GET['status'];
		if($status==1){
			$list['status'] = 0;
		}else{
			$list['status'] = 1;
		}
		$headmaster = model('Headmaster');
		$res = $headmaster->Courseupd($h_id,$list);
		if($res){
	   	  	   $this->redirect("headmaster/headmaster_list",'',0);
	   	  }else{
	   	  	$this->error("变更状态失败","headmaster/headmaster_list");
	   	  }
		 	 
	}

















}
?>