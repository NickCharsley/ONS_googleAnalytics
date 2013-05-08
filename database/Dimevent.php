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
    public $ID;                              // int(4)  primary_key not_null
    public $EventCategory;                   // varchar(70)  unique_key not_null
    public $EventAction;                     // varchar(70)  unique_key not_null
    public $EventLabel;                      // varchar(70)  unique_key not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('EventAction','EventLabel');
    
    function keyDimensions(){
	   	return array("ga:EventCategory","ga:EventAction","ga:EventLabel");
    }    
}
?>