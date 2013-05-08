<?php
/**
 * Table Definition for dimcustomvar3
 */
require_once 'dbRoot.php';

class doDimcustomvar3 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimcustomvar3';       // table name
    public $ID;                              // int(4)   not_null
    public $CustomVarName3;                  // varchar(70)   not_null
    public $CustomVarValue3;                 // varchar(70)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    	
	function  keyDimensions(){
		return array("ga:CustomVarName3","ga:CustomVarValue3");
	}
}
?>