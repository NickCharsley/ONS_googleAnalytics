<?php
/**
 * Table Definition for dimcustomvar
 */
require_once 'dbRoot.php';

class doDimcustomvar extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimcustomvar';        // table name
    public $ID;                              // int(4)  primary_key not_null
    public $customVarName;                   // varchar(70)  unique_key not_null
    public $customVarValue;                  // varchar(70)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimcustomvar',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
}
