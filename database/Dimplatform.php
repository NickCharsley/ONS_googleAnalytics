<?php
/**
 * Table Definition for dimplatform
 */
require_once 'dbRoot.php';

class doDimplatform extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimplatform';         // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Browser;                         // varchar(45)   not_null
    public $BrowserVersion;                  // varchar(45)   not_null
    public $OperatingSystem;                 // varchar(45)   not_null
    public $OperatingSystemVersion;          // varchar(45)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('Browser',"OperatingSystem","OperatingSystemVersion");
    
    function keyDimensions(){
    	return array("ga:Browser","ga:BrowserVersion","ga:OperatingSystem","ga:OperatingSystemVersion");
    }
    
}
?>