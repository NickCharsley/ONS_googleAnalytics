<?php
/**
 * Table Definition for dimproduct
 */
require_once 'dbRoot.php';

class doDimproduct extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimproduct';          // table name
    public $ID;                              // int(4)   not_null
    public $TransactionId;                   // varchar(70)   not_null
    public $ProductSku;                      // varchar(70)  
    public $ProductName;                     // varchar(70)  
    public $ProductCategory;                 // varchar(70)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimproduct',$k,$v); }

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