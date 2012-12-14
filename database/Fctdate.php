<?php
/**
 * Table Definition for fctdate
 */
require_once 'dbRoot.php';

class doFctdate extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctdate';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)  unique_key not_null
    public $dimProfile;                      // int(4)   not_null
    public $Visits;                          // int(4)  
    public $Visitors;                        // int(4)  
    public $NewVisits;                       // int(4)  
    public $Bounces;                         // int(4)  
    public $TimeOnSite;                      // float  
    public $OrganicSearches;                 // int(4)  
    public $GoalStartsAll;                   // int(4)  
    public $GoalCompletionsAll;              // int(4)  
    public $GoalAbandonsAll;                 // int(4)  
    public $GoalValueAll;                    // float  
    public $Entrances;                       // int(4)  
    public $Pageviews;                       // int(4)  
    public $UniquePageviews;                 // int(4)  
    public $TimeOnPage;                      // float  
    public $Exits;                           // int(4)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctdate',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
