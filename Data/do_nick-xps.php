<?php


/** /
$profiles=array(55368687,61943476,67348193,68081878,68085948,68086044);
/**/
$cm_profiles=array(68103870,68232661,68243329,61943476);
$dl_profiles=array(67348193,68081878,68085948,68086044,64920522,42209706,42476341,42506344);
$pl_profiles=array(55368687);

if (isset($_GET['test'])) $cm_profiles=array(68103870); 

foreach ($cm_profiles as $profile){
	print("<H1>Profile $profile</H1>");
	$pl=new Vanquis($client,$service,$profile);
	print("<H2>Session Data</H2>");
	if (isset($_GET['test'])) $pl->sessionData('2013-01-29');
	else $pl->sessionData();
}
	
krumo($audit);

showTable("fctvsPlatform");

totalTimes();
	
?>