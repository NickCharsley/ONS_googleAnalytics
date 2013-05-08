<?php
/**
 * Table Definition for fctpagetracking
 */
require_once 'dbRoot.php';

class doFctpagetracking extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctpagetracking';     // table name
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
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // int(4)   not_null
    public $Exits;                           // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalStartsAll;                   // int(4)   not_null
    public $GoalAbandonsAll;                 // int(4)   not_null
    public $Goal1Completions;                // int(4)   not_null
    public $Goal2Completions;                // int(4)   not_null
    public $Goal3Completions;                // int(4)   not_null
    public $Goal4Completions;                // int(4)   not_null
    public $Goal5Completions;                // int(4)   not_null
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
    public $Goal16Completions;               // int(4)   not_null
    public $Goal17Completions;               // int(4)   not_null
    public $Goal18Completions;               // int(4)   not_null
    public $Goal19Completions;               // int(4)   not_null
    public $Goal20Completions;               // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
