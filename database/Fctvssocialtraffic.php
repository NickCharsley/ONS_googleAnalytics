<?php
/**
 * Table Definition for fctvssocialtraffic
 */
require_once 'dbRoot.php';

class doFctvssocialtraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvssocialtraffic';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimSocialTraffic;                // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $TimeOnPage;                      // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $TimeOnSite;                      // int(4)   not_null
    public $Goal1Completions;                // int(4)   not_null
    public $Goal2Completions;                // int(4)   not_null
    public $Goal3Completions;                // int(4)   not_null
    public $Goal4Completions;                // int(4)   not_null
    public $Goal6Completions;                // int(4)   not_null
    public $Goal7Completions;                // int(4)   not_null
    public $Goal8Completions;                // int(4)   not_null
    public $Goal9Completions;                // int(4)   not_null
    public $Goal10Completions;               // int(4)   not_null
    public $Goal11Completions;               // int(4)   not_null
    public $Goal12Completions;               // int(4)   not_null
    public $Goal13Completions;               // int(4)   not_null
    public $Goal14Completions;               // int(4)   not_null
    public $Goal15Completions;               // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvssocialtraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
