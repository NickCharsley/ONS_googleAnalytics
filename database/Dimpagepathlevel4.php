<?php
/**
 * Table Definition for dimpagepathlevel4
 */
require_once 'dbRoot.php';

class doDimpagepathlevel4 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagepathlevel4';    // table name
    public $ID;                              // int(4)   not_null
    public $PagePathLevel4;                  // varchar(4096)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:PagePathLevel4");
    }
}
?>