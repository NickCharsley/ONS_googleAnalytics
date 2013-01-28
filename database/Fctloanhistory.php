<?php
/**
 * Table Definition for fctloanhistory
 */
require_once 'dbRoot.php';

class doFctloanhistory extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctloanhistory';      // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimHostName;                     // int(4)   not_null
    protected $dimNetwork;                      // int(4)   not_null
    protected $dimVisitor;                      // int(4)   not_null
    protected $dimSession;                      // int(4)   not_null
    protected $dimGeo;                          // int(4)   not_null
    protected $dimSystem;                       // int(4)   not_null
    protected $dimPlatform;                     // int(4)   not_null
    protected $dimLandingPagePath;              // int(4)   not_null
    protected $dimMobile;                       // int(4)   not_null
    protected $Visitors;                        // int(4)   not_null
    protected $NewVisits;                       // int(4)   not_null
    protected $Bounces;                         // int(4)   not_null
    protected $OrganicSearches;                 // int(4)   not_null
    protected $Entrances;                       // int(4)   not_null
    protected $Pageviews;                       // int(4)   not_null
    protected $UniquePageviews;                 // int(4)   not_null
    protected $TimeOnPage;                      // float   not_null
    protected $Exits;                           // int(4)   not_null
    protected $TimeOnSite;                      // int(4)   not_null
    protected $Visits;                          // int(4)   not_null
    protected $GoalStartsAll;                   // int(4)   not_null
    protected $GoalCompletionsAll;              // int(4)   not_null
    protected $GoalAbandonsAll;                 // int(4)   not_null
    protected $GoalValueAll;                    // float   not_null
    protected $Goal1Starts;                     // int(4)   not_null
    protected $Goal1Completions;                // int(4)   not_null
    protected $Goal1Abandons;                   // int(4)   not_null
    protected $Goal1Value;                      // float   not_null
    protected $Goal2Starts;                     // int(4)   not_null
    protected $Goal2Completions;                // int(4)   not_null
    protected $Goal2Abandons;                   // int(4)   not_null
    protected $Goal2Value;                      // float   not_null
    protected $Goal3Starts;                     // int(4)   not_null
    protected $Goal3Completions;                // int(4)   not_null
    protected $Goal3Abandons;                   // int(4)   not_null
    protected $Goal3Value;                      // float   not_null
    protected $Goal4Starts;                     // int(4)   not_null
    protected $Goal4Completions;                // int(4)   not_null
    protected $Goal4Abandons;                   // int(4)   not_null
    protected $Goal4Value;                      // float   not_null
    protected $Goal5Starts;                     // int(4)   not_null
    protected $Goal5Completions;                // int(4)   not_null
    protected $Goal5Abandons;                   // int(4)   not_null
    protected $Goal5Value;                      // float   not_null
    protected $Goal6Starts;                     // int(4)   not_null
    protected $Goal6Completions;                // int(4)   not_null
    protected $Goal6Abandons;                   // int(4)   not_null
    protected $Goal6Value;                      // float   not_null
    protected $Goal7Starts;                     // int(4)   not_null
    protected $Goal7Completions;                // int(4)   not_null
    protected $Goal7Abandons;                   // int(4)   not_null
    protected $Goal7Value;                      // float   not_null
    protected $Goal8Starts;                     // int(4)   not_null
    protected $Goal8Completions;                // int(4)   not_null
    protected $Goal8Abandons;                   // int(4)   not_null
    protected $Goal8Value;                      // float   not_null
    protected $Goal9Starts;                     // int(4)   not_null
    protected $Goal9Completions;                // int(4)   not_null
    protected $Goal9Abandons;                   // int(4)   not_null
    protected $Goal9Value;                      // float   not_null
    protected $Goal10Starts;                    // int(4)   not_null
    protected $Goal10Completions;               // int(4)   not_null
    protected $Goal10Abandons;                  // int(4)   not_null
    protected $Goal10Value;                     // float   not_null
    protected $Goal11Starts;                    // int(4)   not_null
    protected $Goal11Completions;               // int(4)   not_null
    protected $Goal11Abandons;                  // int(4)   not_null
    protected $Goal11Value;                     // float   not_null
    protected $Goal12Starts;                    // int(4)   not_null
    protected $Goal12Completions;               // int(4)   not_null
    protected $Goal12Abandons;                  // int(4)   not_null
    protected $Goal12Value;                     // float   not_null
    protected $Goal13Starts;                    // int(4)   not_null
    protected $Goal13Completions;               // int(4)   not_null
    protected $Goal13Abandons;                  // int(4)   not_null
    protected $Goal13Value;                     // float   not_null
    protected $Goal14Starts;                    // int(4)   not_null
    protected $Goal14Completions;               // int(4)   not_null
    protected $Goal14Abandons;                  // int(4)   not_null
    protected $Goal14Value;                     // float   not_null
    protected $Goal15Starts;                    // int(4)   not_null
    protected $Goal15Completions;               // int(4)   not_null
    protected $Goal15Abandons;                  // int(4)   not_null
    protected $Goal15Value;                     // float   not_null
    protected $Goal16Starts;                    // int(4)   not_null
    protected $Goal16Completions;               // int(4)   not_null
    protected $Goal16Abandons;                  // int(4)   not_null
    protected $Goal16Value;                     // float   not_null
    protected $Goal17Starts;                    // int(4)   not_null
    protected $Goal17Completions;               // int(4)   not_null
    protected $Goal17Abandons;                  // int(4)   not_null
    protected $Goal17Value;                     // float   not_null
    protected $Goal18Starts;                    // int(4)   not_null
    protected $Goal18Completions;               // int(4)   not_null
    protected $Goal18Abandons;                  // int(4)   not_null
    protected $Goal18Value;                     // float   not_null
    protected $Goal19Starts;                    // int(4)   not_null
    protected $Goal19Completions;               // int(4)   not_null
    protected $Goal19Abandons;                  // int(4)   not_null
    protected $Goal19Value;                     // float   not_null
    protected $Goal20Starts;                    // int(4)   not_null
    protected $Goal20Completions;               // int(4)   not_null
    protected $Goal20Abandons;                  // int(4)   not_null
    protected $Goal20Value;                     // float   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctloanhistory',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
