<?php
/**
 * Table Definition for fctvanquissession
 */
require_once 'dbRoot.php';

class doFctvanquissession extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvanquissession';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
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
    public $PageLoadTime;                    // int(4)   not_null
    public $PageLoadSample;                  // int(4)   not_null
    public $DomainLookupTime;                // int(4)   not_null
    public $PageDownloadTime;                // int(4)   not_null
    public $RedirectionTime;                 // int(4)   not_null
    public $ServerConnectionTime;            // int(4)   not_null
    public $ServerResponseTime;              // int(4)   not_null
    public $SpeedMetricsSample;              // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    	function insert(){
		$this->logAction(__FUNCTION__);
		//krumo($this);
    	$this->filldata();
		if (!isset($this->dimVanquisSession)) return false;
    	try {
    		return parent::insert();	
    	}
    	catch (Exception $e){
    		krumo($this);
    		krumo($e);
    		die(__FILE__.":".__LINE__);
    	}
    }
   	 	      
    function update($do=false){
    	$this->filldata();
		if (!isset($this->dimVanquisSession)) return false;
    	$ret=parent::update($do);
    	if (!($ret===TRUE)) 
    	{
    		$this->logAction(__FUNCTION__);
    		if (isset($_GET['krumo_full'])){
	    		DB_DataObject::debugLevel(5);
				parent::update($do);
				DB_DataObject::debugLevel(0);
    			krumo($do);
				krumo($this);
			}
    	}
    	return $ret;	
    }

}
