<?php
/**
 * Table Definition for dimpagepathlevel1
 */
require_once 'dbRoot.php';

class doDimpagepathlevel1 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagepathlevel1';    // table name
    public $ID;                              // int(4)   not_null
    public $PagePathLevel1;                  // varchar(4096)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:PagePathLevel1");
    }
}
?>