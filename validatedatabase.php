<?php
	include_once 'ons_common.php';

	$opts=PEAR::getStaticProperty('DB_DataObject','options');
	$ini=buildpath($opts['schema_location'],safe_DataObject_factory("dimDate")->database().'.ini');
	$config = parse_ini_file($ini,true);
	Krumo::enable();
	foreach($config as $table=>$fields){
		if (strpos($table,"__keys")===false){
			
			$sql="select * from $table";
			try {				
				$res=$db->query($sql)->fetchRow();
				//Now Test Fields
				if (!isset($res)) $res=array();
				$fields=array_map('strtolower',array_keys($fields));
				$res=array_map('strtolower', array_keys($res));
				
				$diff_fr=array_diff($fields,$res);
				$diff_rf=array_diff($res,$fields);
				
				if (count($diff_fr)) {
					print_line("Fields Missing from Table $table");
					Krumo($diff_fr);
				}
				else if (count($diff_rf)) {
					print_line("Extra Fields in Table $table");
					Krumo($diff_rf);
				}
				else print_line("$table exists");					
				
				//krumo($fields);
				//krumo($res);
			} catch (exception $e){
				print_line("$table missing");					
			}
			
		}						
	}
	
	pageTime();    
?>