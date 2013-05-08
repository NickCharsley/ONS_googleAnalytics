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
    public $ID;                              // int(4)  primary_key not_null
    public $TransactionId;                   // varchar(70)   not_null
    public $Affiliation;                     // varchar(70)  
    public $VisitsToTransaction;             // int(4)  
    public $DaysToTransaction;               // int(4)  
    public $ProductSku;                      // varchar(70)  
    public $ProductName;                     // varchar(70)  
    public $ProductCategory;                 // varchar(70)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
