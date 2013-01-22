<?php
	include_once 'ons_common.php';
    
    class Vanquis {
    	private $service;
    	private $profile;
		private $client;

		function test(){
			global $date;
			$date='2013-01-10';
			$date="2012-10-22";
			//$this->ProfileDates();
			//$this->getGAFactOnly($date, "GoalTraffic");
			//$this->getGADimensionResults($date, "Traffic");
			//$this->getGADimensionResults($date, "Date");
			$this->ValidateFact("GoalTraffic",$date);
		}
    		    	
    	function __construct($client,$service,$profile){
    		$this->client=$client;
    		$this->service=$service;
    		$this->profile=$profile;
    	}    	    	

    	private function getGADimensionOnly($date,$dimName,$metrics='ga:visits'){
    		$dim=safe_DataObject_factory("dim$dimName");
			googleHelper::resetCount($dimName);
    		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$dim->optParams(),$metrics);  
			krumo($res);	
    		$dim->saveGoogleResults($res);
    	}    	 

    	private function getMCFDimensionOnly($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
			googleHelper::resetCount($dimName);
    		$res=googleHelper::getMCFResults($date,$this->client,$this->service,$this->profile,$dim->optParams());  	
    		$dim->saveGoogleResults($res);
    	}    	 
    					
    	private function getGADimensionResults($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
    		$fct=safe_DataObject_factory("fct$dimName");
			/** /
			krumo($fct->optParams());
			krumo($dim->optParams($fct->optParams()));
			krumo($fct->metrics());
    		flush_buffers();
			/**/
			googleHelper::resetCount($dimName);
     		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$dim->optParams($fct->optParams()),$fct->metrics());
			krumo($res);
    		$dim->saveGoogleResults($res);
    		$fct->saveGoogleResults($res);
    	}

    	private function getGAFactOnly($date,$dimName){
    		$fct=safe_DataObject_factory("fct$dimName");
			//$dim=safe_DataObject_factory("dimDate");
			/** /
			krumo($fct->optParams());
			krumo($fct->metrics());
    		flush_buffers();
			/**/
			googleHelper::resetCount($dimName);
     		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
			krumo($res);
    		$fct->saveGoogleResults($res);
    	}

    	
    	private function getGAFactResults($date,$fctName){
    		$fct=safe_DataObject_factory("fct$fctName");
    		//Krumo($fct->optParams());
    		//Krumo($fct->metrics());
			flush_buffers();
			googleHelper::resetCount($fctName);
    		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
    		//Krumo($res);
			$extras=array_keys($fct->links());
			foreach ($extras as $dim){
				$doDim=safe_DataObject_factory($dim);
				$doDim->saveGoogleResults($res);
			}
			flush_buffers();
    		$fct->saveGoogleResults($res);			
    	}    	
    	
		private function factLoaded($fctName,$date=null){
			if (!isset($date)) return false;
			$fct=safe_DataObject_factory("fct$fctName");
			$fct->dimDate=str_replace("-", "", $date);
			$fct->dimProfile=$this->profile;
			return $fct->find();
		}

		protected function ValidateFact($fctName,$date=null){
			global $db;			
			
			if ($date!=null){
				$do=new DateTime($date);
				$date=$do->format("Ymd");
			}
			
			$fct=safe_DataObject_factory("fct$fctName");
			$dte=safe_DataObject_factory("fctDate");
			$table=array_keys($fct->table());
			//Now Add specials
			$special=false;
			if (in_array("GoalStarts", $table)) {$table[]="GoalStartsAll";$special=true;}
			if (in_array("GoalCompletions", $table)) {$table[]="GoalCompletionsAll";$special=true;}
			if (in_array("GoalAbandons", $table)) {$table[]="GoalAbandonsAll";$special=true;}
			if (in_array("GoalValue", $table)) {$table[]="GoalValueAll";$special=true;}
			
			$fields=array_intersect($table, array_keys($dte->table()));
			krumo($fields);
			/**/
			//Now remove ID and any Dims
			$measures=array();
			$sql=  "select dimDate,count(*) rows";
			$sql1= "select dimDate";
			$sql2= "";
			$all="";
			
			foreach ($fields as $field){
				if (strtoupper($field)=='ID') continue;
				if (strtoupper(substr($field,0,3))=='DIM') continue;
					
				$measures[]=$field;
				if ($special)
					$sql.=", round(sum(".str_replace("All","",$field)."),2) $field";
				else
					$sql.=", round(sum($field),2) $field";
				$sql1.=", round($field,2) $field";
				
				$all.=" and (f.$field = d.$field)";
				
				$sql2.=", case when f.$field = d.$field then '$field is Valid' else '$field invalid' end $field";
				
			}
			$sql.=" from fct$fctName where dimProfile=".$this->profile;
			$sql1.=" from fctDate where dimProfile=".$this->profile;
			if ($date!=null) $sql.=" and dimDate=".$date;
			$sql.=" group by dimDate";
			
			$sql2= "select d.dimDate, rows, case when (1=1) $all then 'All Valid' else 'Some Invalid' end AllValid $sql2 from ($sql) f join ($sql1) d on f.dimDate=d.dimDate";
			
			krumo($sql2);
			$res=$db->query($sql2);
			
			print_line($fctName);			
			while (($row = $res->fetchRow())) {
				$i=0;
    			foreach($row as $field){
    				if ($i==0) print_line("Date: $field");
					else if ($i==1) print_line("Rows Tested: $field");
					else print_line($field);
					$i++;    				
    			}    				
			}	
		
			//die(__FILE__.":".__LINE__);	
		}

		function getPageTracking($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("PageTracking",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}			    		
    		$this->getGAFactResults($date,"PageTracking");				    		
    	}
		 

    	function getResults($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("Date",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}
			/*Profile Dimension*/
    			$this->getGADimensionOnly($date, "Profile");    		    	
    		/*Date Dimension*/
    			$this->getGADimensionResults($date, "Date");
    		/*Visitor Dimension*/
    			$this->getGADimensionResults($date, "Visitor");
    		/*Session Dimension*/
    			$this->getGADimensionResults($date,"Session");
    		/* Network Dimension */
    			$this->getGADimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getGADimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getGADimensionResults($date,"System");
    		/* Event Dimension */
    			$this->getGADimensionResults($date,"Event");
    		/*Page Dimensions */
				//$this->getGADimensionResults($date, "LandingPagePath");
    		/* Traffic Sources Dimension(s) */
    			//$this->getGADimensionResults($date,"Traffic");
    		/* AdWords Dimensions */
    			//$this->getGADimensionResults($date,"Adwords");
    		/* Transaction Dimensions */
    			$this->getGADimensionResults($date,"Transaction");
    		/* Custom Var(s) Fact */
    			$this->getGAFactResults($date,"CustomVar");				    		
    	}
    	
    	function waterfall($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("Form",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}
			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension*/
    		$this->getGADimensionOnly($date, "Date");
    		/*Visitor Dimension*/
    		$this->getGADimensionOnly($date, "Visitor");
    		/*Session Dimension*/
    		$this->getGADimensionOnly($date,"Session");
    		/*Host Dimensions*/
    		$this->getGADimensionOnly($date, "HostName");
    		/*Page Dimensions*/
			$this->getGADimensionOnly($date, "PagePath");    		 
//			$this->getGADimensionOnly($date, "LandingPagePath");
//			$this->getGADimensionOnly($date, "ExitPagePath");
			/*Fact Table*/
    		$this->getGAFactResults($date, "Form");
    	}
    	
		function ProfileDates($date=NULL){
			/*Profile Dimension*/
    		$this->getGADimensionResults($date, "Date");
		}
		
		function LoanHistory($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("LoanHistory",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}			
			
			print_line("LoanHistory($date)");
			flush_buffers();			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension */
	    		$this->getGADimensionResults($date, "Date");
    		/*Visitor Dimension */
    			$this->getGADimensionResults($date, "Visitor");
    		/*Session Dimension */
    			$this->getGADimensionResults($date,"Session");
    		/*Host Dimensions */
    			$this->getGADimensionResults($date, "HostName");
    		/*Page Dimensions */
				$this->getGADimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getGADimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getGADimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getGADimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getGADimensionResults($date,"Platform");
			/* Mobile Dimension */
    			$this->getGADimensionResults($date,"Mobile");
    			
			/*Fact Table*/
    			$this->getGAFactResults($date, "LoanHistory");
			/**/
    	}

		function Device($date=NULL){
			
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("Device",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}
			
    		//DB_DataObject::debugLevel(5);
    		/*Date Dimension*/
	    		$this->getGADimensionResults($date, "Date");
    		/*Visitor Dimension*/
    			$this->getGADimensionResults($date, "Visitor");
    		/*Session Dimension*/
    			$this->getGADimensionResults($date,"Session");
    		/*Host Dimensions*/
    			$this->getGADimensionResults($date, "HostName");
    		/*Page Dimensions*/
				$this->getGADimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getGADimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getGADimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getGADimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getGADimensionResults($date,"Platform");

			/*Fact Table*/
    			$this->getGAFactResults($date, "Device");
			/**/
    	}

		function adWords($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("Adwords_one",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}			
			
			print_line("adWords($date)");
			flush_buffers();	
			/*Date Dimension */
	    		$this->getGADimensionResults($date, "Date");
    		/*AdWords Dimension(s) */
	    		$this->getGADimensionResults($date, "Adwords_one");
				$this->getGADimensionResults($date, "Adwords_two");
    				
		}

    	
		function google($date=NULL){
			if (!isset($date)) 
			{
				$date=date("Y-m-d",time()-86400);
				if ($this->factLoaded("Date",$date)) {
					debug_print (__FUNCTION__."($date) already loaded");
					return true;
				}
			}			
			
			print_line("google($date)");
			flush_buffers();			
    		/*Date Dimension */
	    		$this->getGADimensionResults($date, "Date");
    		/*Visitor Dimension */
    			$this->getGADimensionResults($date, "Visitor");
    		/*Session Dimension */
    			$this->getGADimensionResults($date,"Session");
    		/*Host Dimensions */
    			$this->getGADimensionResults($date, "HostName");
    		/*Page Dimensions */
				$this->getGADimensionResults($date, "LandingPagePath");
    		/* Network Dimension */
    			$this->getGADimensionResults($date,"Network");
    		/* Geo Dimension */
    			$this->getGADimensionResults($date,"Geo");
    		/* System Dimension */
    			$this->getGADimensionResults($date,"System");
			/* Platform Dimension */
    			$this->getGADimensionResults($date,"Platform");
			/* Mobile Dimension */
    			$this->getGADimensionResults($date,"Mobile");			 
			/**/
		}
		
		
		function testMCF($date=null){
			googleHelper::resetCount("MCF");
			
			$optParams= array(
				'dimensions' => "mcf:basicChannelGroupingPath,mcf:sourceMediumPath,mcf:campaignPath,mcf:keywordPath,mcf:adwordsAdContentPath",
				//'dimensions' => "mcf:adwordsAdGroupPath,mcf:adwordsCampaignPath,mcf:adwordsDestinationUrlPath,mcf:adwordsDisplayUrlPath,mcf:adwordsKeywordPath,mcf:adwordsMatchedSearchQueryPath",
				//'dimensions' => "mcf:adwordsPlacementDomainPath,mcf:adwordsPlacementUrlPath,mcf:conversionDate,mcf:conversionGoalNumber,mcf:conversionType,mcf:pathLengthInInteractionsHistogram,mcf:timeLagInDaysHistogram",
				//'dimensions' => "mcf:basicChannelGrouping,mcf:source,mcf:medium,mcf:sourceMedium,mcf:campaignName,mcf:keyword,mcf:adwordsAdContent",
				//'dimensions' => "mcf:adwordsAdGroup,mcf:adwordsAdNetworkType,mcf:adwordsCampaign,mcf:adwordsDestinationUrl,mcf:adwordsDisplayUrl,mcf:adwordsKeyword,mcf:adwordsMatchedSearchQuery",
				//'dimensions' => "mcf:adwordsMatchType,mcf:adwordsPlacementDomainmcf:adwordsPlacementType,mcf:adwordsPlacementUrl,mcf:adwordsTargetingType",	
				'max-results' => '2000',		
				'start-index' => 1
				);			
    		$res=googleHelper::getMCFResults($date,$this->client,$this->service,$this->profile,$optParams);  	
    		krumo($res);			
			/*

			  
			 */
		}
}
?>