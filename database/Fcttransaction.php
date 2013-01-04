<?php
/**
 * Table Definition for fcttransaction
 */
require_once 'dbRoot.php';

class doFcttransaction extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fcttransaction';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)  unique_key not_null
    public $dimProfile;                      // int(4)  unique_key not_null
    public $dimTransaction;                  // int(4)  unique_key not_null
    public $ItemQuantity;                    // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFcttransaction',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
