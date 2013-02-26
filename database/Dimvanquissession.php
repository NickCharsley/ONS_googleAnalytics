<?php
/**
 * Table Definition for dimvanquissession
 */
require_once 'dbRoot.php';

class doDimvanquissession extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimvanquissession';    // table name
    public $ID;                              // int(4)   not_null
    public $CustomVarName1;                  // varchar(70)   not_null
    public $CustomVarValue1;                 // varchar(70)   not_null
    public $SessionID;                       // varchar(70)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimvanquissession',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function keys(){
    	return array("ID");
    }
    
    function keyDimensions(){
    	return array("ga:CustomVarValue1","SessionId"=>"ga:CustomVarName1");
    }
		
	
    function insert(){
    	if (strtolower($this->CustomVarName1)<>'sessionid'){
    		$proxy=safe_dataobject_factory('dimCustomVar');
			$proxy->CustomVarName=$this->CustomVarName1;
			$proxy->CustomVarValue=$this->CustomVarValue1;
			if ($proxy->find(true)){
				//Has been inserted but isn't a SessionID
				$this->ID=$proxy->ID;
				return true;
			} 
			else return $proxy->insert();
    	}
		else {
	    	$proxy=safe_dataobject_factory('dimCustomVar');
			$proxy->ID=$this->ID;
			$proxy->CustomVarName=$this->CustomVarName1;
			$proxy->CustomVarValue=$this->CustomVarValue1;
			return $proxy->insert();			
		}
    }
}
