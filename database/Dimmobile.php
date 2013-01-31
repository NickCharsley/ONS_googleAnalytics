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
    public $ID;                              // int(4)  primary_key not_null
    public $IsMobile;                        // varchar(45)   not_null
    public $MobileDeviceBranding;            // varchar(45)   not_null
    public $MobileDeviceModel;               // varchar(45)   not_null
    public $MobileInputSelector;             // varchar(45)   not_null
    public $MobileDeviceInfo;                // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimmobile',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('MobileDeviceInfo');
  
    
    function filldata(){
    	if ($this->IsMobile=='No'){
	    	//Special Handeling if IsMobile="No"!!!
			$this->MobileDeviceBranding="(not set)";
    		$this->MobileDeviceModel="(not set)";
    		$this->MobileInputSelector="(not set)";
    		$this->MobileDeviceInfo="Non Mobile Device";    		
    	}
		else if ($this->MobileDeviceInfo="(not set)"){
			$this->MobileDeviceInfo="Unidentified Mobile Device";
		}
		
	}
    
    function keyDimensions(){
    	return array("ga:IsMobile","ga:MobileDeviceBranding","ga:MobileDeviceModel","ga:MobileInputSelector","ga:MobileDeviceInfo");
    }
}
?>