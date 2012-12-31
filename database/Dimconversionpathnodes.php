<?php
/**
 * Table Definition for dimconversionpathnodes
 */
require_once 'dbRoot.php';

class doDimconversionpathnodes extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimconversionpathnodes';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $NodeName;                        // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimconversionpathnodes',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
