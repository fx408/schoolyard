<?php

class MyController extends SController{
	
	public function actionIndex() {
		$list = School::model()->listByUserId;
		
		
		$this->render('index', array('list'=>$list));
	}
	
	public function actionDetail($id) {
		$data = School::model()->getDetailBySchoolId($id);
		$types = SchoolType::model()->BList;
		
		$this->render('detail', array('data'=>$data, 'types'=>$types));
	}
	
	
	
}