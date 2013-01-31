<?php
	$cm_profiles=array(68103870,68232661,68243329,61943476);
	$dl_profiles=array(67348193,68081878,68085948,68086044,64920522,42209706,42476341,42506344);
	$pl_profiles=array(55368687);

	$date="2013-01-29";
	
	if (isset($_GET['test'])) $cm_profiles=array(68103870); 
	
	foreach ($cm_profiles as $profile){
		print("<H1>Profile $profile</H1>");
		$pl=new Vanquis($client,$service,$profile);
		print("<H2>Session Data</H2>");
		if (isset($_GET['test'])) $pl->test();
		else $pl->sessionData();
	}
	totalTimes();
	
	showTable("fctvsPageTracking");	
	showTable("fctvsPlatform");	

if (isset($_GET['test'])) die(__FILE__.":".__LINE__);

$pl=new Vanquis($client,$service,55368687);
if (isset($_GET['test'])){
	$pl->test();
}
else {	
	print("<H2>Processing Page Tracking for $date</H2>");
	$pl->ProfileDates();
	$sql="with data as (
select top 2 dimdate from fctdate fd
where dimprofile=55368687 and visits>0
and not exists(select 1 from fctpagetracking fp
where (fd.dimprofile=fp.dimprofile and fd.dimdate=fp.dimdate))
order by dimdate desc
)
select top 1 * from data where dimdate<convert(varchar(10),getdate(),112)";

$res=New DateTime($db->query($sql)->fetchOne()) ;
$date=$res->format('Y-m-d');

	$pl->getPageTracking($date);
}

$cm=new Vanquis($client,$service,61943476);
if (isset($_GET['test'])){
	$cm->test();
}
else {	
	$cm->ProfileDates();
	
	$sql="with data as (
select top 2 dimdate from fctdate fd
where dimprofile=61943476 and visits>0
and not exists(select 1 from fctpagetracking fp
where (fd.dimprofile=fp.dimprofile and fd.dimdate=fp.dimdate))
order by dimdate desc
)
select top 1 * from data where dimdate<convert(varchar(10),getdate(),112)";

$res=New DateTime($db->query($sql)->fetchOne()) ;
$date=$res->format('Y-m-d');
print_line("Processing for $date");
	
	
	$cm->getPageTracking($date);
}

krumo($audit);

?>