<?php
	include_once 'ons_common.php';

	$opts=PEAR::getStaticProperty('DB_DataObject','options');
	$ini=buildpath($opts['schema_location'],safe_DataObject_factory("dimDate")->database().'.ini');
	$config = parse_ini_file($ini,true);
	foreach($config as $table=>$fields){
		if (strpos($table,"__keys")===false){
			
			$do=safe_dataobject_factory($table);
			try {				
				$do->find(true);
				print_line("$table exists");	
			} catch (exception $e){
				print_line("$table missing");					
			}
		}						
	}
	
	pageTime();    
?>