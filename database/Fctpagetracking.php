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
    public $dimDate;                         // int(4)  unique_key not_null
    public $dimHour;                         // int(4)  unique_key not_null
    public $dimProfile;                      // int(4)  unique_key not_null
    public $dimHostname;                     // int(4)  unique_key not_null
    public $dimVisitor;                      // int(4)  unique_key not_null
    public $dimPageDepth;                    // int(4)  unique_key not_null
    public $dimLandingPagePath;              // int(4)  unique_key not_null
    public $dimPagePath;                     // int(4)  unique_key not_null
    public $dimExitPagePath;                 // int(4)  unique_key not_null
    public $dimSecondPagePath;               // int(4)  unique_key not_null
    public $dimNextPagePath;                 // int(4)  unique_key not_null
    public $dimPreviousPagePath;             // int(4)  unique_key not_null
    public $dimPagePathLevel1;               // int(4)  unique_key
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // int(4)   not_null
    public $Exits;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctpagetracking',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
