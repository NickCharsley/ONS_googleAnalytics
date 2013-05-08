<?php
/**
 * Table Definition for dimpagepathlevel3
 */
require_once 'dbRoot.php';

class doDimpagepathlevel3 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagepathlevel3';    // table name
    public $ID;                              // int(4)   not_null
    public $PagePathLevel3;                  // varchar(4096)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:PagePathLevel3");
    }
}
?>