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
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimHostname;                     // int(4)   not_null
    protected $dimVisitor;                      // int(4)   not_null
    protected $dimPageDepth;                    // int(4)   not_null
    protected $dimLandingPagePath;              // int(4)   not_null
    protected $dimSecondPagePath;               // int(4)   not_null
    protected $dimPagePath;                     // int(4)   not_null
    protected $dimNextPagePath;                 // int(4)   not_null
    protected $dimPreviousPagePath;             // int(4)   not_null
    protected $dimExitPagePath;                 // int(4)   not_null
    protected $dimVanquisSession;               // int(4)   not_null
    protected $Entrances;                       // int(4)   not_null
    protected $Pageviews;                       // int(4)   not_null
    protected $UniquePageviews;                 // int(4)   not_null
    protected $TimeOnPage;                      // int(4)   not_null
    protected $Exits;                           // int(4)   not_null
    protected $GoalCompletionsAll;              // int(4)   not_null
    protected $GoalStartsAll;                   // int(4)   not_null
    protected $GoalAbandonsAll;                 // int(4)   not_null
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

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvspagetracking',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
