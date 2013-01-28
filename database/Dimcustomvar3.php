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
    protected $ID;                              // int(4)   not_null
    protected $CustomVarName3;                  // varchar(70)   not_null
    protected $CustomVarValue3;                 // varchar(70)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimcustomvar3',$k,$v); }

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