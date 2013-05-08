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
    public $ID;                              // int(4)  primary_key not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimDate;                         // int(4)   not_null
    public $dimHostName;                     // int(4)   not_null
    public $dimNetwork;                      // int(4)   not_null
    public $dimVisitor;                      // int(4)   not_null
    public $dimSession;                      // int(4)   not_null
    public $dimGeo;                          // int(4)   not_null
    public $dimSystem;                       // int(4)   not_null
    public $dimPlatform;                     // int(4)   not_null
    public $dimLandingPagePath;              // int(4)   not_null
    public $dimMobile;                       // int(4)   not_null
    public $Visitors;                        // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $OrganicSearches;                 // int(4)   not_null
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // float   not_null
    public $Exits;                           // int(4)   not_null
    public $TimeOnSite;                      // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $GoalStartsAll;                   // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalAbandonsAll;                 // int(4)   not_null
    public $GoalValueAll;                    // float   not_null
    public $Goal1Starts;                     // int(4)   not_null
    public $Goal1Completions;                // int(4)   not_null
    public $Goal1Abandons;                   // int(4)   not_null
    public $Goal1Value;                      // float   not_null
    public $Goal2Starts;                     // int(4)   not_null
    public $Goal2Completions;                // int(4)   not_null
    public $Goal2Abandons;                   // int(4)   not_null
    public $Goal2Value;                      // float   not_null
    public $Goal3Starts;                     // int(4)   not_null
    public $Goal3Completions;                // int(4)   not_null
    public $Goal3Abandons;                   // int(4)   not_null
    public $Goal3Value;                      // float   not_null
    public $Goal4Starts;                     // int(4)   not_null
    public $Goal4Completions;                // int(4)   not_null
    public $Goal4Abandons;                   // int(4)   not_null
    public $Goal4Value;                      // float   not_null
    public $Goal5Starts;                     // int(4)   not_null
    public $Goal5Completions;                // int(4)   not_null
    public $Goal5Abandons;                   // int(4)   not_null
    public $Goal5Value;                      // float   not_null
    public $Goal6Starts;                     // int(4)   not_null
    public $Goal6Completions;                // int(4)   not_null
    public $Goal6Abandons;                   // int(4)   not_null
    public $Goal6Value;                      // float   not_null
    public $Goal7Starts;                     // int(4)   not_null
    public $Goal7Completions;                // int(4)   not_null
    public $Goal7Abandons;                   // int(4)   not_null
    public $Goal7Value;                      // float   not_null
    public $Goal8Starts;                     // int(4)   not_null
    public $Goal8Completions;                // int(4)   not_null
    public $Goal8Abandons;                   // int(4)   not_null
    public $Goal8Value;                      // float   not_null
    public $Goal9Starts;                     // int(4)   not_null
    public $Goal9Completions;                // int(4)   not_null
    public $Goal9Abandons;                   // int(4)   not_null
    public $Goal9Value;                      // float   not_null
    public $Goal10Starts;                    // int(4)   not_null
    public $Goal10Completions;               // int(4)   not_null
    public $Goal10Abandons;                  // int(4)   not_null
    public $Goal10Value;                     // float   not_null
    public $Goal11Starts;                    // int(4)   not_null
    public $Goal11Completions;               // int(4)   not_null
    public $Goal11Abandons;                  // int(4)   not_null
    public $Goal11Value;                     // float   not_null
    public $Goal12Starts;                    // int(4)   not_null
    public $Goal12Completions;               // int(4)   not_null
    public $Goal12Abandons;                  // int(4)   not_null
    public $Goal12Value;                     // float   not_null
    public $Goal13Starts;                    // int(4)   not_null
    public $Goal13Completions;               // int(4)   not_null
    public $Goal13Abandons;                  // int(4)   not_null
    public $Goal13Value;                     // float   not_null
    public $Goal14Starts;                    // int(4)   not_null
    public $Goal14Completions;               // int(4)   not_null
    public $Goal14Abandons;                  // int(4)   not_null
    public $Goal14Value;                     // float   not_null
    public $Goal15Starts;                    // int(4)   not_null
    public $Goal15Completions;               // int(4)   not_null
    public $Goal15Abandons;                  // int(4)   not_null
    public $Goal15Value;                     // float   not_null
    public $Goal16Starts;                    // int(4)   not_null
    public $Goal16Completions;               // int(4)   not_null
    public $Goal16Abandons;                  // int(4)   not_null
    public $Goal16Value;                     // float   not_null
    public $Goal17Starts;                    // int(4)   not_null
    public $Goal17Completions;               // int(4)   not_null
    public $Goal17Abandons;                  // int(4)   not_null
    public $Goal17Value;                     // float   not_null
    public $Goal18Starts;                    // int(4)   not_null
    public $Goal18Completions;               // int(4)   not_null
    public $Goal18Abandons;                  // int(4)   not_null
    public $Goal18Value;                     // float   not_null
    public $Goal19Starts;                    // int(4)   not_null
    public $Goal19Completions;               // int(4)   not_null
    public $Goal19Abandons;                  // int(4)   not_null
    public $Goal19Value;                     // float   not_null
    public $Goal20Starts;                    // int(4)   not_null
    public $Goal20Completions;               // int(4)   not_null
    public $Goal20Abandons;                  // int(4)   not_null
    public $Goal20Value;                     // float   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
