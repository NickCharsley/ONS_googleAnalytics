<?php
/**
 * Table Definition for fctperformance
 */
require_once 'dbRoot.php';

class doFctperformance extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctperformance';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimTraffic;                      // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $Goal1Starts;                     // int(4)   not_null
    public $Goal1Completions;                // int(4)   not_null
    public $Goal1Abandons;                   // int(4)   not_null
    public $Goal6Starts;                     // int(4)   not_null
    public $Goal6Completions;                // int(4)   not_null
    public $Goal6AbandonsAll;                // int(4)   not_null
    public $GoalStartsAll;                   // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalAbandonsAll;                 // int(4)   not_null
    public $Impressions;                     // varchar(45)  
    public $AdClicks;                        // varchar(45)  
    public $AdCost;                          // varchar(45)  
    public $CPM;                             // varchar(45)  
    public $CPC;                             // varchar(45)  
    public $CTR;                             // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctperformance',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}