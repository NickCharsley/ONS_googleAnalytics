<?php
/**
 * Table Definition for fctgoaltraffic
 */
require_once 'dbRoot.php';

class doFctgoaltraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctgoaltraffic';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimTraffic;                      // int(4)   not_null
    public $dimGoal;                         // int(4)   not_null
    public $GoalCompletions;                 // int(4)   not_null
    public $GoalStarts;                      // int(4)   not_null
    public $GoalAbandons;                    // int(4)   not_null
    public $GoalValue;                       // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctgoaltraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
