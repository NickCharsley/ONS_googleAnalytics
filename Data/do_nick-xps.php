<?php


/** /
$profiles=array(55368687,61943476,67348193,68081878,68085948,68086044);
/**/
$cm_profiles=array(68103870,68232661,68243329,61943476);
$dl_profiles=array(67348193,68081878,68085948,68086044,64920522,42209706,42476341,42506344);
$pl_profiles=array(55368687);

foreach ($cm_profiles as $profile){
	print("<H1>Profile $profile</H1>");
	$pl=new Vanquis($client,$service,$profile);
	//print("<H2>Session Data</H2>");
	//$pl->sessionData();
	print("<H2>Page Tracking</H2>");
	$pl->getPageTracking();
}
	
	
?>