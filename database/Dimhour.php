<?php
/**
 * Table Definition for dimhour
 */
require_once 'dbRoot.php';

class doDimhour extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimhour';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Hour;                            // varchar(2)   not_null
    public $Description;                     // varchar(45)   not_null
    public $StartTime;                       // datetime   not_null
    public $EndTime;                         // datetime   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('Description');
    
    function keyDimensions(){
    	return array("ga:Hour");
    }
	
	    
}
?>