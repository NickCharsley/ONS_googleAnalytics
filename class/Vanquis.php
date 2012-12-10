<?php
	include_once 'ons_common.php';
    
    class Vanquis {
    	private $service;
    	private $profile;
    		
    	
    	function __construct($service,$profile){
    		$this->service=$service;
    		$this->profile=$profile;
    	}    	
    	
    	
    	private function getDimensionResults($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
    		$fct=safe_DataObject_factory("fct$dimName");
    		
     		$res=googleHelper::getResults($date,$this->service,$this->profile,$dim->optParams($fct->optParams()),$fct->metrics());
    		
    		$dim->saveGoogleResults($res);
    		$fct->saveGoogleResults($res);
    	}
    	
    	function getResults($date){    		
    		/*Date Dimension*/
    			$this->getDimensionResults($date, "Date");
    		/*Visitor Dimension*/
    			$this->getDimensionResults($date, "Visitor");
    		/*Session Dimension*/
    			$this->getDimensionResults($date,"Session");
    		/* Network Dimension */
    			$this->getDimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getDimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getDimensionResults($date,"System");
    		/* Page Tracking Dimension */
    			//$this->getDimensionResults($date,"PageTracking");
    		/* Event Dimension */
    			//$this->getDimensionResults($date,"Event");
    		/* Traffic Sources Dimension(s) */
    			//$this->getDimensionResults($date,"Traffic");
    		/* AdWords Dimensions */
    			//$this->getDimensionResults($date,"Adwords");
    	}
    
    }
?>