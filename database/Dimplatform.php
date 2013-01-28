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
    protected $ID;                              // int(4)  primary_key not_null
    protected $Browser;                         // varchar(45)   not_null
    protected $BrowserVersion;                  // varchar(45)   not_null
    protected $OperatingSystem;                 // varchar(45)   not_null
    protected $OperatingSystemVersion;          // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimplatform',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('Browser',"OperatingSystem","OperatingSystemVersion");
    
    function keyDimensions(){
    	return array("ga:Browser","ga:BrowserVersion","ga:OperatingSystem","ga:OperatingSystemVersion");
    }
    
}
?>