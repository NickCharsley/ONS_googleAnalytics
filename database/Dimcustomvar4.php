<?php
/**
 * Table Definition for dimcustomvar4
 */
require_once 'dbRoot.php';

class doDimcustomvar4 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimcustomvar4';       // table name
    protected $ID;                              // int(4)   not_null
    protected $CustomVarName4;                  // varchar(70)   not_null
    protected $CustomVarValue4;                 // varchar(70)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimcustomvar4',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    	
	function  keyDimensions(){
		return array("ga:CustomVarName4","ga:CustomVarValue4");
	}
}
?>