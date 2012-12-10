<?php
/**
 * Table Definition for fctsystem
 */
require_once 'dbRoot.php';

class doFctsystem extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctsystem';           // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Date;                            // int(4)  unique_key not_null
    public $FlashVersion;                    // varchar(45)  unique_key not_null
    public $JavaEnabled;                     // varchar(45)  unique_key not_null
    public $Language;                        // varchar(45)  unique_key not_null
    public $ScreenColors;                    // varchar(45)  unique_key not_null
    public $ScreenResolution;                // varchar(45)  unique_key not_null
    public $EventsPerVisitWithEvent;         // float  
    public $VisitsWithEvent;                 // int(4)  
    public $AvgEventValue;                   // float  
    public $EventValue;                      // float  
    public $UniqueEvents;                    // int(4)  
    public $TotalEvents;                     // int(4)  
    public $Visits;                          // int(4)  
    public $Visitors;                        // int(4)  
    public $NewVisits;                       // int(4)  
    public $PercentNewVisits;                // float  
    public $Bounces;                         // int(4)  
    public $EntranceBounceRate;              // float  
    public $VisitBounceRate;                 // float  
    public $TimeOnSite;                      // float  
    public $AvgTimeOnSite;                   // float  
    public $OrganicSearches;                 // int(4)  
    public $RPC;                             // float  
    public $ROI;                             // float  
    public $Margin;                          // float  
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
    public $EntranceRate;                    // float  
    public $Pageviews;                       // int(4)  
    public $PageviewsPerVisit;               // float  
    public $UniquePageviews;                 // int(4)  
    public $TimeOnPage;                      // float  
    public $AvgTimeOnPage;                   // float  
    public $Exits;                           // int(4)  
    public $ExitRate;                        // float  
    public $PageLoadTime;                    // float  
    public $PageLoadSample;                  // float  
    public $AvgPageLoadTime;                 // float  
    public $DomainLookupTime;                // float  
    public $AvgDomainLookupTime;             // float  
    public $PageDownloadTime;                // float  
    public $AvgPageDownloadTime;             // float  
    public $RedirectionTime;                 // float  
    public $AvgRedirectionTime;              // float  
    public $ServerConnectionTime;            // float  
    public $AvgServerConnectionTime;         // float  
    public $ServerResponseTime;              // float  
    public $AvgServerResponseTime;           // float  
    public $SpeedMetricsSample;              // float  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctsystem',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
