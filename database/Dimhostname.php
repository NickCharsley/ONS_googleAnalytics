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

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('Hostname');
    
    
    function keyDimensions(){
    	return array("ga:Hostname");
    }
}
?>