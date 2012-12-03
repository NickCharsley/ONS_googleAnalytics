<?php
/**
 * Table Definition for v_pass
 */
require_once 'dbRoot.php';

class doV_pass extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'v_pass';              // table name
    public $id;                              // int(4)   not_null
    public $level;                           // int(4)   not_null
    public $valid;                           // int(4)   not_null
    public $d1ID;                            // int(4)  
    public $d2ID;                            // int(4)  
    public $d3ID;                            // int(4)  
    public $d4ID;                            // int(4)  
    public $d5ID;                            // int(4)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doV_pass',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
