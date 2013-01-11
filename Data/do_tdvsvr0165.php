<?php

$cm=new Vanquis($client,$service,61943476);
if ($test){
	$cm->test();
}
else {	
	$cm->getResults($date);
}

$pl=new Vanquis($client,$service,55368687);
if ($test){
	$pl->test();
}
else {	
	$pl->getPageTracking($date);
}



?>