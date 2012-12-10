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
    public $City;                            // varchar(45)  unique_key not_null
    public $Country;                         // varchar(45)  unique_key not_null
    public $Continent;                       // varchar(45)   not_null
    public $SubContinent;                    // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimgeo',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
