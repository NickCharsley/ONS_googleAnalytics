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
    protected $ID;                              // int(4)   not_null
    protected $LandingPagePath;                 // varchar(4096)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimlandingpagepath',$k,$v); }

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