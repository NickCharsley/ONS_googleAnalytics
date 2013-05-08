<?php
/**
 * Table Definition for fctvspagetracking
 */
require_once 'dbRoot.php';

class doFctvspagetracking extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvspagetracking';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimHostname;                     // int(4)   not_null
    public $dimVisitor;                      // int(4)   not_null
    public $dimPageDepth;                    // int(4)   not_null
    public $dimLandingPagePath;              // int(4)   not_null
    public $dimSecondPagePath;               // int(4)   not_null
    public $dimPagePath;                     // int(4)   not_null
    public $dimNextPagePath;                 // int(4)   not_null
    public $dimPreviousPagePath;             // int(4)   not_null
    public $dimExitPagePath;                 // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // int(4)   not_null
    public $Exits;                           // int(4)   not_null
    public $PageLoadTime;                    // int(4)   not_null
    public $PageLoadSample;                  // int(4)   not_null
    public $DomainLookupTime;                // int(4)   not_null
    public $PageDownloadTime;                // int(4)   not_null
    public $RedirectionTime;                 // int(4)   not_null
    public $ServerConnectionTime;            // int(4)   not_null
    public $ServerResponseTime;              // int(4)   not_null
    public $SpeedMetricsSample;              // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
