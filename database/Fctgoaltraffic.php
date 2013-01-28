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
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimTraffic;                      // int(4)   not_null
    protected $dimGoal;                         // int(4)   not_null
    protected $GoalCompletions;                 // int(4)   not_null
    protected $GoalStarts;                      // int(4)   not_null
    protected $GoalAbandons;                    // int(4)   not_null
    protected $GoalValue;                       // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctgoaltraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
