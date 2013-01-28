<?php


/** /
$profiles=array(55368687,61943476,67348193,68081878,68085948,68086044);
/**/
$profiles=array(68103870);//68232661,61943476,68103870,68243329);
/**/
$date="2013-01-23";

foreach ($profiles as $profile){
	$pl=new Vanquis($client,$service,$profile);
	print_line("Profile $profile");
	if ($test){
		$pl->test();
		//$pl->ProfileDates();
	}
	else {
		//$pl->ProfileDates();	
			
		//$pl->getPageTracking($date);
	}
}

showTable("fctvsDevice","dimDate",str_replace('-','',$date));
showTable("fctvsEvent","dimDate",str_replace('-','',$date));
showTable("fctvsGeo","dimDate",str_replace('-','',$date));
showTable("fctvsPageTracking","dimDate",str_replace('-','',$date));
showTable("fctvsSystem","dimDate",str_replace('-','',$date));
showTable("fctvsTraffic","dimDate",str_replace('-','',$date));
//showTable("fctvsVisitor","dimDate",str_replace('-','',$date));

?>