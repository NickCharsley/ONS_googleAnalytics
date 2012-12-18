<?php
	include_once 'ons_common.php';
    
    class Vanquis {
    	private $service;
    	private $profile;
		private $client;
    		    	
    	function __construct($client,$service,$profile){
    		$this->client=$client;
    		$this->service=$service;
    		$this->profile=$profile;
    	}    	    	
    	
    	private function getDimensionResults($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
    		$fct=safe_DataObject_factory("fct$dimName");
			/** /
			krumo($fct->optParams());
			krumo($dim->optParams($fct->optParams()));
			krumo($fct->metrics());
    		flush_buffers();
			/**/
			googleHelper::resetCount($dimName);
     		$res=googleHelper::getResults($date,$this->client,$this->service,$this->profile,$dim->optParams($fct->optParams()),$fct->metrics());
    		
    		$dim->saveGoogleResults($res);
    		$fct->saveGoogleResults($res);

    	}
    	
    	function getResults($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);
			    		
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
    
    	private function getFactResults($date,$fctName){
    		$fct=safe_DataObject_factory("fct$fctName");
//    		Krumo($fct->optParams());
//    		Krumo($fct->metrics());
			flush_buffers();
			googleHelper::resetCount($fctName);
    		$res=googleHelper::getResults($date,$this->client,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
//    		Krumo($res);
			flush_buffers();
    		$fct->saveGoogleResults($res);			
    	}    	
    	
    	private function getDimensionOnly($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
			googleHelper::resetCount($dimName);
    		$res=googleHelper::getResults($date,$this->client,$this->service,$this->profile,$dim->optParams());  	
    		$dim->saveGoogleResults($res);
    	}    	 
    	
    	function waterfall($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);
			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension*/
    		$this->getDimensionOnly($date, "Date");
    		/*Visitor Dimension*/
    		$this->getDimensionOnly($date, "Visitor");
    		/*Session Dimension*/
    		$this->getDimensionOnly($date,"Session");
    		/*Host Dimensions*/
    		$this->getDimensionOnly($date, "HostName");
    		/*Page Dimensions*/
			$this->getDimensionOnly($date, "PagePath");    		 
//			$this->getDimensionOnly($date, "LandingPagePath");
//			$this->getDimensionOnly($date, "ExitPagePath");
			/*Fact Table*/
    		$this->getFactResults($date, "Form");
    	}
    	
		function ProfileDates(){
			$this->getDimensionResults(NULL, "Date");
		}
		
		function LoanHistory($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);			
			
			print_line("LoanHistory($date)");
			flush_buffers();			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension */
	    		$this->getDimensionResults($date, "Date");
    		/*Visitor Dimension */
    			$this->getDimensionResults($date, "Visitor");
    		/*Session Dimension */
    			$this->getDimensionResults($date,"Session");
    		/*Host Dimensions */
    			$this->getDimensionResults($date, "HostName");
    		/*Page Dimensions */
				$this->getDimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getDimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getDimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getDimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getDimensionResults($date,"Platform");
			/* Mobile Dimension */
    			$this->getDimensionResults($date,"Mobile");
    			
			/*Fact Table*/
    			$this->getFactResults($date, "LoanHistory");
			/**/
    	}

		function Device($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);
			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension*/
	    		$this->getDimensionResults($date, "Date");
    		/*Visitor Dimension*/
    			$this->getDimensionResults($date, "Visitor");
    		/*Session Dimension*/
    			$this->getDimensionResults($date,"Session");
    		/*Host Dimensions*/
    			$this->getDimensionResults($date, "HostName");
    		/*Page Dimensions*/
				$this->getDimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getDimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getDimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getDimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getDimensionResults($date,"Platform");

			/*Fact Table*/
    			$this->getFactResults($date, "Device");
			/**/
    	}

		function adWords($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);			
			
			print_line("adWords($date)");
			flush_buffers();	
			/*Date Dimension */
	    		$this->getDimensionResults($date, "Date");
    		/*AdWords Dimension(s) */
	    		$this->getDimensionResults($date, "Adwords_one");
				$this->getDimensionResults($date, "Adwords_two");
    				
		}

    	
		function google($date=NULL){
			if (!isset($date)) $date=date("Y-m-d",time()-86400);			
			
			print_line("google($date)");
			flush_buffers();			
    		/*Date Dimension */
	    		$this->getDimensionResults($date, "Date");
    		/*Visitor Dimension */
    			$this->getDimensionResults($date, "Visitor");
    		/*Session Dimension */
    			$this->getDimensionResults($date,"Session");
    		/*Host Dimensions */
    			$this->getDimensionResults($date, "HostName");
    		/*Page Dimensions */
				$this->getDimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getDimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getDimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getDimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getDimensionResults($date,"Platform");
			/* Mobile Dimension */
    			$this->getDimensionResults($date,"Mobile");			 
			/**/
		}
}
?>