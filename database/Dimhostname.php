<?php
/**
 * Table Definition for dimhostname
 */
require_once 'dbRoot.php';

class doDimhostname extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimhostname';         // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Hostname;                        // varchar(512)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimhostname',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keyDimensions(){
    	return array("ga:Hostname");
    }
}
?>