<?php
/**
 * Table Definition for dimgeo
 */
require_once 'dbRoot.php';

class doDimgeo extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimgeo';              // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Latitude;                        // decimal(9,6)  unique_key not_null
    public $Longitude;                       // decimal(9,6)  unique_key not_null
    public $City;                            // varchar(45)  unique_key not_null default_Unknown
    public $Country;                         // varchar(45)  unique_key not_null default_Unknown
    public $Continent;                       // varchar(45)   not_null default_Unknown
    public $SubContinent;                    // varchar(45)   not_null default_Unknown

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('City','Country');
    
    function keyDimensions(){
    	return array("ga:Latitude","ga:Longitude","ga:City","ga:Country");
    }    
    
}
?>