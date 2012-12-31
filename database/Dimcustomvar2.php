<?php
/**
 * Table Definition for dimcustomvar2
 */
require_once 'dbRoot.php';

class doDimcustomvar2 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimcustomvar2';       // table name
    public $ID;                              // int(4)   not_null
    public $CustomVarName2;                  // varchar(70)   not_null
    public $CustomVarValue2;                 // varchar(70)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimcustomvar2',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    	
	function  keyDimensions(){
		return array("ga:CustomVarName2","ga:CustomVarValue2");
	}
}
?>