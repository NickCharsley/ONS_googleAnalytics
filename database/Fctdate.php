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
    public $ID;                              // int(4)  primary_key not_null
    public $Date;                            // int(4)  unique_key not_null
    public $Visits;                          // int(4)  
    public $Visitors;                        // int(4)  
    public $NewVisits;                       // int(4)  
    public $Bounces;                         // int(4)  
    public $EntranceBounceRate;              // float  
    public $VisitBounceRate;                 // float  
    public $TimeOnSite;                      // float  
    public $OrganicSearches;                 // int(4)  
    public $GoalValuePerVisit;               // float  
    public $GoalStartsAll;                   // int(4)  
    public $GoalCompletionsAll;              // int(4)  
    public $GoalAbandonsAll;                 // int(4)  
    public $GoalValueAll;                    // float  
    public $GoalConversionRateAll;           // float  
    public $GoalAbandonRateAll;              // float  
    public $Goal1Starts;                     // int(4)  
    public $Goal1Completions;                // int(4)  
    public $Goal1Abandons;                   // int(4)  
    public $Goal1Value;                      // float  
    public $Goal1ConversionRate;             // float  
    public $Goal1AbandonRate;                // float  
    public $Goal2Starts;                     // int(4)  
    public $Goal2Completions;                // int(4)  
    public $Goal2Abandons;                   // int(4)  
    public $Goal2Value;                      // float  
    public $Goal2ConversionRate;             // float  
    public $Goal2AbandonRate;                // float  
    public $Goal3Starts;                     // int(4)  
    public $Goal3Completions;                // int(4)  
    public $Goal3Abandons;                   // int(4)  
    public $Goal3Value;                      // float  
    public $Goal3ConversionRate;             // float  
    public $Goal3AbandonRate;                // float  
    public $Entrances;                       // int(4)  
    public $Pageviews;                       // int(4)  
    public $PageviewsPerVisit;               // float  
    public $UniquePageviews;                 // int(4)  
    public $TimeOnPage;                      // float  
    public $AvgTimeOnPage;                   // float  
    public $Exits;                           // int(4)  
    public $ExitRate;                        // float  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctdate',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
