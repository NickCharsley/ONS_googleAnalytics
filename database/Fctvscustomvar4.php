<?php
/**
 * Table Definition for fctvscustomvar4
 */
require_once 'dbRoot.php';

class doFctvscustomvar4 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvscustomvar4';     // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimCustomVar4;                   // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $Visitors;                        // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $TimeOnSite;                      // float   not_null
    public $OrganicSearches;                 // int(4)   not_null
    public $GoalStartsAll;                   // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalAbandonsAll;                 // int(4)   not_null
    public $GoalValueAll;                    // float   not_null
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // float   not_null
    public $Exits;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvscustomvar4',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
