<?php
/**
 * Table Definition for t_metric
 */
require_once 'dbRoot.php';

class doT_metric extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_metric';            // table name
    public $ID;                              // int(4)  primary_key not_null
    public $name;                            // varchar(50)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_metric',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
