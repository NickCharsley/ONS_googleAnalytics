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
    protected $ID;                              // int(4)   not_null
    protected $CustomVarName1;                  // varchar(70)   not_null
    protected $CustomVarValue1;                 // varchar(70)   not_null
    protected $SessionID;                       // varchar(70)   not_null

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
    	$proxy=safe_dataobject_factory('dimCustomVar');
		$proxy->ID=$this->ID;
		$proxy->CustomVarName=$this->CustomVarName1;
		$proxy->CustomVarValue=$this->CustomVarValue1;
		return $proxy->insert();
    }
}
