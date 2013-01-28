<?php
/**
 * Table Definition for fctdate
 */
require_once 'dbRoot.php';

class doFctdate extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctdate';             // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)  unique_key not_null
    protected $dimProfile;                      // int(4)  unique_key not_null
    protected $Visits;                          // int(4)   not_null
    protected $Visitors;                        // int(4)   not_null
    protected $NewVisits;                       // int(4)   not_null
    protected $Bounces;                         // int(4)   not_null
    protected $TimeOnSite;                      // float   not_null
    protected $OrganicSearches;                 // int(4)   not_null
    protected $GoalStartsAll;                   // int(4)   not_null
    protected $GoalCompletionsAll;              // int(4)   not_null
    protected $GoalAbandonsAll;                 // int(4)   not_null
    protected $GoalValueAll;                    // float   not_null
    protected $Entrances;                       // int(4)   not_null
    protected $Pageviews;                       // int(4)   not_null
    protected $UniquePageviews;                 // int(4)   not_null
    protected $TimeOnPage;                      // float   not_null
    protected $Exits;                           // int(4)   not_null
    protected $Impressions;                     // int(4)   not_null
    protected $AdClicks;                        // int(4)   not_null
    protected $AdCost;                          // float   not_null
    protected $Goal1Completions;                // int(4)   not_null
    protected $Goal2Completions;                // int(4)   not_null
    protected $Goal3Completions;                // int(4)   not_null
    protected $Goal4Completions;                // int(4)   not_null
    protected $Goal5Completions;                // int(4)   not_null
    protected $Goal6Completions;                // int(4)   not_null
    protected $Goal7Completions;                // int(4)   not_null
    protected $Goal8Completions;                // int(4)   not_null
    protected $Goal9Completions;                // int(4)   not_null
    protected $Goal10Completions;               // int(4)   not_null
    protected $Goal11Completions;               // int(4)   not_null
    protected $Goal12Completions;               // int(4)   not_null
    protected $Goal13Completions;               // int(4)   not_null
    protected $Goal14Completions;               // int(4)   not_null
    protected $Goal15Completions;               // int(4)   not_null
    protected $Goal16Completions;               // int(4)   not_null
    protected $Goal17Completions;               // int(4)   not_null
    protected $Goal18Completions;               // int(4)   not_null
    protected $Goal19Completions;               // int(4)   not_null
    protected $Goal20Completions;               // int(4)   not_null
    protected $Goal1Starts;                     // int(4)   not_null
    protected $Goal2Starts;                     // int(4)   not_null
    protected $Goal3Starts;                     // int(4)   not_null
    protected $Goal4Starts;                     // int(4)   not_null
    protected $Goal5Starts;                     // int(4)   not_null
    protected $Goal6Starts;                     // int(4)   not_null
    protected $Goal7Starts;                     // int(4)   not_null
    protected $Goal8Starts;                     // int(4)   not_null
    protected $Goal9Starts;                     // int(4)   not_null
    protected $Goal10Starts;                    // int(4)   not_null
    protected $Goal11Starts;                    // int(4)   not_null
    protected $Goal12Starts;                    // int(4)   not_null
    protected $Goal13Starts;                    // int(4)   not_null
    protected $Goal14Starts;                    // int(4)   not_null
    protected $Goal15Starts;                    // int(4)   not_null
    protected $Goal16Starts;                    // int(4)   not_null
    protected $Goal17Starts;                    // int(4)   not_null
    protected $Goal18Starts;                    // int(4)   not_null
    protected $Goal19Starts;                    // int(4)   not_null
    protected $Goal20Starts;                    // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctdate',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
