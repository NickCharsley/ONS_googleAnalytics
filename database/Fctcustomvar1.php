<?php
/**
 * Table Definition for fctcustomvar1
 */
require_once 'dbRoot.php';

class doFctcustomvar1 extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctcustomvar1';       // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimCustomVar1;                   // int(4)   not_null
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

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctcustomvar1',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
