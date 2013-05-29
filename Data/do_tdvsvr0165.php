<?php
	$cm_profiles=array(61943476);//68103870,68232661,68243329,61943476);
	$dl_profiles=array(67348193,68081878,68085948,68086044,64920522,42209706,42476341,42506344);
	$pl_profiles=array(55368687);
		
        $vars=array();
        
	if (!isset($type)) $type='loans:poland';
        if (isset($argv)){
            $ini="";
            for($i=1;$i<count($argv);$i++){
                $ini.=$argv[$i]."\n";
            }
            $vars=parse_ini_string($ini);
            foreach($vars as $var=>$value);
            $var=$value;
        }
        
        $date=isset($_GET['date'])?$_GET['date']:(isset($vars['date'])?$vars['date']:null);	
        
	
	$sql="insert into workcommer.dbo.emptyFactDate
	select dimdate,query 
	from workcommer.dbo.googleaudit ga
	where query like 'fctvs%'
	and not exists (
		select 1
		from workcommer.dbo.emptyFactDate ef
		where ga.dimDate=ef.dimDate
		and ga.Query=ef.factTable
	)
	group by query,dimdate
	having count(*)>5
	order by count(*) desc";
	
	global $db;
	$db->exec($sql);  				

	if (!(strpos(strtolower($type),'loans')===false)){
		if (isset($_GET['test'])) $cm_profiles=array(61943476); 	
		
		
	
		foreach ($cm_profiles as $profile){
			
			print("<H1>Profile $profile</H1>");
			$pl=new Vanquis($client,$service,$profile);
			$pl->Date($date);
			print("<H2>Session Data</H2>");
			if (isset($_GET['test'])) $pl->sessionData($date);
			else $pl->sessionData($date);
		}
	}

	if (!(strpos(strtolower($type),'loans-PT')===false)){
		if (isset($_GET['test'])) $cm_profiles=array(61943476); 	
	
		foreach ($cm_profiles as $profile){
			
			print("<H1>Profile $profile</H1>");
			$pl=new Vanquis($client,$service,$profile);
			$pl->Date($date);
			print("<H2>Page Tracking</H2>");
			$pl->sessionData($date);
			if (isset($_GET['test'])) $pl->getPageTracking($date);
			else $pl->getPageTracking($date);
		}
	}
	
	if (!(strpos(strtolower($type),'poland')===false)){
		foreach ($pl_profiles as $profile){
			print("<H1>Profile $profile</H1>");
			$pl=new Vanquis($client,$service,$profile);
			$pl->Date($date);
			if (isset($_GET['test'])){
				print("<H2>Testing for $date</H2>");
				$pl->test($date);
			}
			else {	
				print("<H2>Profile Dates ($date)</H2>");
				$pl->Date($date);			
				print("<H2>Performance Data</H2>");
				$pl->sessiondata($date);

	//			$pl->getPageTracking();
			}
		}
	}


?>