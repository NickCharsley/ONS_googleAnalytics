<?php
/*
 * Created on 11 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 include_once 'ons_common.php';
 
 class googleHelper {
 
	 static function getFirstId(&$collection) {
	    $items = $collection->getItems();
	    return $items[0]->getId();
	  }
 
 }
?>
