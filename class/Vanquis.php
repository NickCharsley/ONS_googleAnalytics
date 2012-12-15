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
			/** /
			krumo($fct->optParams());
			krumo($dim->optParams($fct->optParams()));
			krumo($fct->metrics());
    		flush_buffers();
			/**/
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
    
    	private function getFactResults($date,$fctName){
    		$fct=safe_DataObject_factory("fct$fctName");
//    		Krumo($fct->optParams());
//    		Krumo($fct->metrics());
			flush_buffers();
    		$res=googleHelper::getResults($date,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
//    		Krumo($res);
			flush_buffers();
    		$fct->saveGoogleResults($res);
    	}    	
    	
    	private function getDimensionOnly($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
    		$res=googleHelper::getResults($date,$this->service,$this->profile,$dim->optParams());  	
    		$dim->saveGoogleResults($res);
    	}    	 
    	
    	function waterfall($date){
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
			if ($date==null){
				global $db;
				$sql="select fd.dimDate,fl.dimdate 
from fctDate fd 
left join fctLoanHistory fl
on fd.dimprofile=fl.dimProfile
and fd.dimDate=fl.dimDate
where fd.visits>0 
and fd.dimProfile=61943476
and fl.dimdate is null
order by fd.dimdate
limit 0,1;
";
				$res=$db->query($sql);
				$oDate=new DateTime($res->fetchOne());
				$date=$oDate->format("Y-m-d");								
			}			
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
			/* Mobile Dimension */
    			$this->getDimensionResults($date,"Mobile");
    			
			/*Fact Table*/
    			$this->getFactResults($date, "LoanHistory");
			/**/
    	}

		function Device($date){
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
				$this->getDimensionOnly($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getDimensionOnly($date,"Network");
    		/* Geo Dimension */
    			$this->getDimensionOnly($date,"Geo");
    		/* System Dimension */
    			$this->getDimensionOnly($date,"System");
			/* Platform Dimension */
    			$this->getDimensionOnly($date,"Platform");

			/*Fact Table*/
    			$this->getFactResults($date, "Device");
    	}
    	
				
    }
?>