<?php
/**
 * Table Definition for fctvsdate
 */
require_once 'dbRoot.php';

class doFctvsdate extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvsdate';           // table name
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $Visits;                          // decimal(32,0)  
    public $Visitors;                        // decimal(32,0)  
    public $NewVisits;                       // decimal(32,0)  
    public $Bounces;                         // decimal(32,0)  
    public $TimeOnSite;                      // double  
    public $OrganicSearches;                 // decimal(32,0)  
    public $GoalStartsAll;                   // decimal(32,0)  
    public $GoalCompletionsAll;              // decimal(32,0)  
    public $GoalAbandonsAll;                 // decimal(32,0)  
    public $GoalValueAll;                    // double  
    public $Entrances;                       // decimal(32,0)  
    public $Pageviews;                       // decimal(32,0)  
    public $UniquePageviews;                 // decimal(32,0)  
    public $TimeOnPage;                      // double  
    public $Exits;                           // decimal(32,0)  
    public $PageLoadTime;                    // decimal(32,0)  
    public $PageLoadSample;                  // decimal(32,0)  
    public $DomainLookupTime;                // decimal(32,0)  
    public $PageDownloadTime;                // decimal(32,0)  
    public $RedirectionTime;                 // decimal(32,0)  
    public $ServerConnectionTime;            // decimal(32,0)  
    public $ServerResponseTime;              // decimal(32,0)  
    public $SpeedMetricsSample;              // decimal(32,0)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
