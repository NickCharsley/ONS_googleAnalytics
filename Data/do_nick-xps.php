<?php

$sql="select dimdate from fctdate fd
where dimprofile=55368687 and visits>0
and not exists(select 1 from fctpagetracking fp
where fd.dimprofile=fp.dimprofile and fd.dimdate=fp.dimdate)
order by dimdate desc";

$res=New DateTime($db->query($sql)->fetchOne()) ;
$date=$res->format('Y-m-d');
print_line("Processing for $date");

$pl=new Vanquis($client,$service,55368687);
if ($test){
	$pl->test();
}
else {
	$pl->ProfileDates();	
	$pl->getPageTracking($date);
}

?>