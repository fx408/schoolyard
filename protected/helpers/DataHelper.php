<?php

class DataHelper {
	
	public static function eachData($data, $keyName, $isArray = false) {
		$list = array();
		foreach($data as $item) {
			if($isArray) $list[$item->$keyName][] = $item->attributes;
			else $list[$item->$keyName] = $item->attributes;
		}
		
		return $list;
	}
	
	
	
	
}