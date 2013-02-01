<?php
/**
 * Table Definition for fctload_cashmax_base
 */
require_once 'dbRoot.php';

class doFctload_cashmax_base extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctload_cashmax_base';    // table name
    public $ID;                              // int(4)   not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $Visits;                          // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $TimeOnSite;                      // float   not_null
    public $OrganicSearches;                 // int(4)   not_null
    public $GoalValueAll;                    // float   not_null
    public $Entrances;                       // int(4)   not_null
    public $GoalStartsAll;                   // int(4)   not_null
    public $GoalCompletionsAll;              // int(4)   not_null
    public $GoalAbandonsAll;                 // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctload_cashmax_base',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    //As this is a View we need to do the work here!
    function keys(){
    	return array("ID");
    }
 
 	function links(){
 		return array("dimDate"=>"dimDate:ID","dimProfile"=>"dimProfile:ID","dimVanquisSession"=>"dimCustomVar:ID");
 	}   

	function getGoogleKeys($row){
		$this->getUnlinkedDimensions($row);
		
		$ret=($this->find(true))?"update":"insert";
		krumo($this);
		dieHere();		
	}
		
}
?>