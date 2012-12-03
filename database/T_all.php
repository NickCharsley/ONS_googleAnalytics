<?php
/**
 * Table Definition for t_all
 */
require_once 'dbRoot.php';

class doT_all extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_all';               // table name
    public $id;                              // int(4)  primary_key not_null
    public $level;                           // int(4)  multiple_key not_null
    public $valid;                           // int(4)  multiple_key not_null
    public $d1ID;                            // int(4)  multiple_key
    public $d2ID;                            // int(4)  multiple_key
    public $d3ID;                            // int(4)  multiple_key
    public $d4ID;                            // int(4)  multiple_key
    public $d5ID;                            // int(4)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_all',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
