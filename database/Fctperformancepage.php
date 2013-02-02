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
    public $dimHour;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimTraffic;                      // int(4)   not_null
    public $dimPagePath;                     // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $Goal1Completions;                // int(4)   not_null
    public $Goal1ConversionRate;             // float   not_null
    public $Goal6Completions;                // int(4)   not_null
    public $Goal6ConversionRate;             // float   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalConversionRate;              // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctperformancepage',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
