<?php
/**
 * Table Definition for dimpagepathlevel2
 */
require_once 'dbRoot.php';

class doDimpagepathlevel2 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagepathlevel2';    // table name
    public $ID;                              // int(4)   not_null
    public $PagePathLevel2;                  // varchar(4096)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimpagepathlevel2',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:PagePathLevel2");
    }
}
?>