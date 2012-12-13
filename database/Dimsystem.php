<?php
/**
 * Table Definition for dimsystem
 */
require_once 'dbRoot.php';

class doDimsystem extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimsystem';           // table name
    public $ID;                              // int(4)  primary_key not_null
    public $FlashVersion;                    // varchar(45)  unique_key not_null
    public $JavaEnabled;                     // varchar(45)  unique_key not_null
    public $Language;                        // varchar(45)  unique_key not_null
    public $ScreenColors;                    // varchar(45)  unique_key not_null
    public $ScreenResolution;                // varchar(45)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimsystem',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keyDimensions(){
    	return array("ga:FlashVersion","ga:JavaEnabled","ga:Language","ga:ScreenColors","ga:ScreenResolution");
    }
}
?>