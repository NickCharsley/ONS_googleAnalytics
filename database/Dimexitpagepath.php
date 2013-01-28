<?php
/**
 * Table Definition for dimexitpagepath
 */
require_once 'dbRoot.php';

class doDimexitpagepath extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimexitpagepath';     // table name
    protected $ID;                              // int(4)   not_null
    protected $ExitPagePath;                    // varchar(4096)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimexitpagepath',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:ExitPagePath");
    }
}
?>