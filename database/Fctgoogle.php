<?php
/**
 * Table Definition for fctgoogle
 */
require_once 'dbRoot.php';

class doFctgoogle extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctgoogle';           // table name
    public $ID;                              // int(4)  primary_key not_null
    public $visits;                          // int(4)  
    public $hour;                            // varchar(45)  
    public $visitCount;                      // varchar(45)  
    public $keyword;                         // varchar(2048)  
    public $landingPagePath;                 // varchar(2048)  
    public $latitude;                        // varchar(45)  
    public $longitude;                       // varchar(45)  
    public $date;                            // varchar(45)  
    public $city;                            // varchar(45)  
    public $country;                         // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctgoogle',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
        
}
