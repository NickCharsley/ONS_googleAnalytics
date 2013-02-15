<?php
	$cm_profiles=array(68103870,68232661,68243329,61943476);
	$dl_profiles=array(67348193,68081878,68085948,68086044,64920522,42209706,42476341,42506344);
	$pl_profiles=array(55368687);
		
	if (!isset($type)) $type='loans:poland';
	
	if (!(strpos(strtolower($type),'loans')===false)){
		if (isset($_GET['test'])) $cm_profiles=array(68103870); 	
	
		foreach ($cm_profiles as $profile){
			
			print("<H1>Profile $profile</H1>");
			$pl=new Vanquis($client,$service,$profile);
			$pl->Date();
			print("<H2>Session Data</H2>");
			if (isset($_GET['test'])) $pl->sessionData();
			else $pl->sessionData();
		}
	}
	
	if (!(strpos(strtolower($type),'poland')===false)){
		foreach ($pl_profiles as $profile){
			print("<H1>Profile $profile</H1>");
			$pl=new Vanquis($client,$service,$profile);
			$pl->Date();
			if (isset($_GET['test'])){
				print("<H2>Testing for $date</H2>");
				$pl->test($date);
			}
			else {	
				print("<H2>Profile Dates</H2>");
				$pl->ProfileDates();			
				print("<H2>Performance Data</H2>");
				$pl->performance();

	//			$pl->getPageTracking();
			}
		}
	}


?>