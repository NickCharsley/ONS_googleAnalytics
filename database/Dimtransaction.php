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
    protected $ID;                              // int(4)   not_null
    protected $TransactionId;                   // varchar(70)   not_null
    protected $Affiliation;                     // varchar(70)  
    protected $VisitsToTransaction;             // int(4)  
    protected $DaysToTransaction;               // int(4)  

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