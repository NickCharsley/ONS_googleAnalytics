<?php
/**
 * Table Definition for dimevent
 */
require_once 'dbRoot.php';

class doDimevent extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimevent';            // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $EventCategory;                   // varchar(70)  unique_key not_null
    protected $EventAction;                     // varchar(70)  unique_key not_null
    protected $EventLabel;                      // varchar(70)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimevent',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('EventAction','EventLabel');
}
?>