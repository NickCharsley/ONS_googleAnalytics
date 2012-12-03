<?php
/**
 * Table Definition for t_testdimension_old
 */
require_once 'dbRoot.php';

class doT_testdimension_old extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_testdimension_old';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $parentID;                        // int(4)  unique_key
    public $dimensionID;                     // int(4)  unique_key not_null
    public $level;                           // int(4)  unique_key not_null
    public $valid;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_testdimension_old',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
