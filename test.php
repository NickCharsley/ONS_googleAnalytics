<?php

	include_once("ons_common.php");
	
	$test=safe_DataObject_factory('t_Tests');	
	DB_Dataobject::debugLevel(5);
	
	$test->find(true);
	print_pre($test->dimensions());
	
	krumo($test);
 
?>