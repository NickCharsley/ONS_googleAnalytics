<?php
/**
 * Table Definition for fctperformancepage
 */
require_once 'dbRoot.php';

class doFctperformancepage extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctperformancepage';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimTraffic;                      // int(4)   not_null
    public $dimPagePath;                     // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $Entrances;                       // int(4)   not_null
    public $Exits;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctperformancepage',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
