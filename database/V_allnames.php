<?php
/**
 * Table Definition for v_allnames
 */
require_once 'dbRoot.php';

class doV_allnames extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'v_allnames';          // table name
    public $id;                              // int(4)   not_null
    public $level;                           // int(4)   not_null
    public $valid;                           // int(4)   not_null
    public $d1name;                          // varchar(50)  
    public $d2name;                          // varchar(50)  
    public $d3name;                          // varchar(50)  
    public $d4name;                          // varchar(50)  
    public $d5name;                          // varchar(50)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doV_allnames',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
