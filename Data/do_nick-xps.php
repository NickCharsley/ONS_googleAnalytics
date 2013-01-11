<?php

$vl=new Vanquis($client,$service, 61943476);
if ($test){
	$vl->test();
}
else {
	$vl->getResults();
}


?>