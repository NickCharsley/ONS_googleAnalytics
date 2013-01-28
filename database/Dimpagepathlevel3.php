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
    protected $ID;                              // int(4)   not_null
    protected $PagePathLevel3;                  // varchar(4096)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimpagepathlevel3',$k,$v); }

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