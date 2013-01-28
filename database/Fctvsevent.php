<?php
/**
 * Table Definition for fctvsevent
 */
require_once 'dbRoot.php';

class doFctvsevent extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvsevent';          // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimEvent;                        // int(4)   not_null
    protected $dimVanquisSession;               // int(4)   not_null
    protected $Visits;                          // int(4)   not_null
    protected $Visitors;                        // int(4)   not_null
    protected $NewVisits;                       // int(4)   not_null
    protected $Bounces;                         // int(4)   not_null
    protected $TimeOnSite;                      // float   not_null
    protected $GoalCompletionsAll;              // int(4)   not_null
    protected $Entrances;                       // int(4)   not_null
    protected $Pageviews;                       // int(4)   not_null
    protected $TimeOnPage;                      // float   not_null
    protected $Exits;                           // int(4)   not_null
    protected $totalEvents;                     // int(4)   not_null
    protected $uniqueEvents;                    // int(4)   not_null
    protected $eventValue;                      // int(4)   not_null
    protected $visitsWithEvent;                 // int(4)   not_null
    protected $eventsPerVisitWithEvent;         // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvsevent',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
