<?php
/**
 * Table Definition for dimecommerce
 */
require_once 'dbRoot.php';

class doDimecommerce extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimecommerce';        // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $TransactionId;                   // varchar(70)   not_null
    protected $Affiliation;                     // varchar(70)  
    protected $VisitsToTransaction;             // int(4)  
    protected $DaysToTransaction;               // int(4)  
    protected $ProductSku;                      // varchar(70)  
    protected $ProductName;                     // varchar(70)  
    protected $ProductCategory;                 // varchar(70)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimecommerce',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
