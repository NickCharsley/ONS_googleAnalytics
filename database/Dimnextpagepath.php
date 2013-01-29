<?php
/**
 * Table Definition for dimnextpagepath
 */
require_once 'dbRoot.php';

class doDimnextpagepath extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimnextpagepath';     // table name
    public $ID;                              // int(4)   not_null
    public $NextPagePath;                    // varchar(4096)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimnextpagepath',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:NextPagePath");
    }
}
?>