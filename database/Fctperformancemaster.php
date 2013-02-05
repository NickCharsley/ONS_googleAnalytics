<?php
/**
 * Table Definition for fctperformancemaster
 */
require_once 'dbRoot.php';

class doFctperformancemaster extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctperformancemaster';    // table name
    public $dimProfile;                      // int(4)   not_null
    public $dimdate;                         // int(4)   not_null
    public $dimTraffic;                      // int(4)   not_null
    public $FormType;                        // varchar(45)  
    public $impressions;                     // int(4)  
    public $adclicks;                        // int(4)  
    public $adcost;                          // float  
    public $StartPageViews;                  // decimal(32,0)  
    public $StartPageUniqueViews;            // decimal(32,0)  
    public $SuccessPageViews;                // decimal(32,0)  
    public $SuccessPageUniqueViews;          // decimal(32,0)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctperformancemaster',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
