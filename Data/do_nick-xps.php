<?php


/** /
$profiles=array(55368687,61943476,67348193,68081878,68085948,68086044);
/**/
$profiles=array(61943476);
/**/
$date='20130117';

foreach ($profiles as $profile){
	$pl=new Vanquis($client,$service,$profile);
	print_line("Profile $profile");
	if ($test){
		$pl->test();
	}
	else {
		//$pl->ProfileDates();	
			
		//$pl->getPageTracking($date);
	}
}
$fct=safe_dataobject_factory("fctGoalTraffic");
$fct->dimDate=str_replace('-','',$date);
$fct->find();
showTable($fct);
$fct=safe_dataobject_factory("fctDate");
$fct->dimDate=str_replace('-','',$date);
$fct->find();
showTable($fct);
?>