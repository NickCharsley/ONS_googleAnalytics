<?php
/**
 * Table Definition for t_testdimension
 */
require_once 'dbRoot.php';

class doT_testdimension extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_testdimension';     // table name
    public $ID;                              // int(4)  primary_key not_null
    public $testID;                          // int(4)   not_null
    public $dimensionID;                     // int(4)   not_null
    public $level;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_testdimension',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
