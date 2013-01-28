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
    protected $ID;                              // int(4)  primary_key not_null
    protected $Latitude;                        // decimal(9,6)  unique_key not_null
    protected $Longitude;                       // decimal(9,6)  unique_key not_null
    protected $City;                            // varchar(45)  unique_key not_null
    protected $Country;                         // varchar(45)  unique_key not_null
    protected $Continent;                       // varchar(45)   not_null
    protected $SubContinent;                    // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimgeo',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('City','Country');
    
    function keyDimensions(){
    	return array("ga:Latitude","ga:Longitude","ga:City","ga:Country");
    }    
    
}
?>