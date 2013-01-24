<?php

if ($test) {
	/** /
	$profiles=array(55368687,61943476,67348193,68081878,68085948,68086044);
	/**/
	$profiles=array(68103870);//68232661,61943476,68103870,68243329);
	/**/
	$date="2013-01-23";

	foreach ($profiles as $profile){
		$pl=new Vanquis($client,$service,$profile);
		print_line("Profile $profile");
		$pl->test();
	}

	showTable("fctvsDevice","dimDate",str_replace('-','',$date));
	showTable("fctvsEvent","dimDate",str_replace('-','',$date));
	showTable("fctvsGeo","dimDate",str_replace('-','',$date));
	showTable("fctvsPageTracking","dimDate",str_replace('-','',$date));
	showTable("fctvsSystem","dimDate",str_replace('-','',$date));
	showTable("fctvsTraffic","dimDate",str_replace('-','',$date));
	die(__FILE__.":".__LINE__);
}

$pl=new Vanquis($client,$service,55368687);
if ($test){
	$pl->test();
}
else {	
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
print_line("Processing for $date");


	$pl->getPageTracking($date);
}

$cm=new Vanquis($client,$service,61943476);
if ($test){
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


?>