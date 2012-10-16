<?php
/**
 * Table Definition for v_all
 */
require_once 'dbRoot.php';

class doV_all extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'v_all';               // table name
    public $ID;                              // int(4)   not_null
    public $dimensionID;                     // int(4)   not_null
    public $level;                           // int(4)   not_null
    public $valid;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doV_all',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
