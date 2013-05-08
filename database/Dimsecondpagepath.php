<?php
/**
 * Table Definition for dimsecondpagepath
 */
require_once 'dbRoot.php';

class doDimsecondpagepath extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimsecondpagepath';    // table name
    public $ID;                              // int(4)   not_null
    public $SecondPagePath;                  // varchar(4096)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:SecondPagePath");
    }
}
?>