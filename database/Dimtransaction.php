<?php
/**
 * Table Definition for dimtransaction
 */
require_once 'dbRoot.php';

class doDimtransaction extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimtransaction';      // table name
    public $ID;                              // int(4)   not_null
    public $TransactionId;                   // varchar(70)   not_null
    public $Affiliation;                     // varchar(70)  
    public $VisitsToTransaction;             // int(4)  
    public $DaysToTransaction;               // int(4)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimtransaction',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
	function keys(){
    	return array("ID");
    }
    
    function keyDimensions(){
    	return array("ga:TransactionId");
    }
}
?>