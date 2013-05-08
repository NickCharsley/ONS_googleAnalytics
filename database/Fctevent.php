<?php
/**
 * Table Definition for fctevent
 */
require_once 'dbRoot.php';

class doFctevent extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctevent';            // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)  unique_key not_null
    public $dimProfile;                      // int(4)  unique_key not_null
    public $dimEvent;                        // int(4)  unique_key not_null
    public $Visits;                          // int(4)   not_null
    public $Visitors;                        // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $TimeOnSite;                      // float   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $TimeOnPage;                      // float   not_null
    public $Exits;                           // int(4)   not_null
    public $totalEvents;                     // int(4)   not_null
    public $uniqueEvents;                    // int(4)   not_null
    public $eventValue;                      // int(4)   not_null
    public $visitsWithEvent;                 // int(4)   not_null
    public $eventsPerVisitWithEvent;         // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
