<?php
/**
 * Table Definition for dimmobile
 */
require_once 'dbRoot.php';

class doDimmobile extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimmobile';           // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $IsMobile;                        // varchar(45)   not_null
    protected $MobileDeviceBranding;            // varchar(45)   not_null
    protected $MobileDeviceModel;               // varchar(45)   not_null
    protected $MobileInputSelector;             // varchar(45)   not_null
    protected $MobileDeviceInfo;                // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimmobile',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function filldata(){
    	if ($this->IsMobile=='No'){
	    	//Special Handeling if IsMobile="No"!!!
			$this->MobileDeviceBranding="(not set)";
    		$this->MobileDeviceModel="(not set)";
    		$this->MobileInputSelector="(not set)";
    		$this->MobileDeviceInfo="(not set)";    		
    	}
	}
    
    function keyDimensions(){
    	return array("ga:IsMobile");
    }
}
?>