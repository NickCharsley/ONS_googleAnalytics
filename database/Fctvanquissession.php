<?php
/**
 * Table Definition for fctvanquissession
 */
require_once 'dbRoot.php';

class doFctvanquissession extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvanquissession';    // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimVanquisSession;               // int(4)   not_null
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
    protected $PageLoadTime;                    // int(4)   not_null
    protected $PageLoadSample;                  // int(4)   not_null
    protected $DomainLookupTime;                // int(4)   not_null
    protected $PageDownloadTime;                // int(4)   not_null
    protected $RedirectionTime;                 // int(4)   not_null
    protected $ServerConnectionTime;            // int(4)   not_null
    protected $ServerResponseTime;              // int(4)   not_null
    protected $SpeedMetricsSample;              // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvanquissession',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
