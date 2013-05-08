<?php
/**
 * Table Definition for dimlandingpagepath
 */
require_once 'dbRoot.php';

class doDimlandingpagepath extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimlandingpagepath';    // table name
    public $ID;                              // int(4)   not_null
    public $LandingPagePath;                 // varchar(4096)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
    function keyDimensions(){
    	return array("ga:LandingPagePath");
    }
}
?>