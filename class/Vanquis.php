<?php
	include_once 'ons_common.php';
    
    class Vanquis {
    	private $service;
    	private $profile;
		private $client;

		function test($date=null){
			$date='2012-11-29';
			
			//$this->CashMax($date);
						
			$this->performance($date);			
		}
    		    	
    	function __construct($client,$service,$profile){
    		$this->client=$client;
    		$this->service=$service;
    		$this->profile=$profile;
    	}    	    	

    	private function getGADimensionOnly($date,$dimName,$metrics='ga:visits'){
    		$dim=safe_DataObject_factory("dim$dimName");
			googleHelper::resetCount($dimName);
			
			print_line(__FUNCTION__." $dimName");
			
			startTimer("Get Google Data");
    		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$dim->optParams(),$metrics);
			stopTimer("Get Google Data");  
			krumo($res);
			startTimer("Save Google Data");	
    		$dim->saveGoogleResults($res);
			stopTimer("Save Google Data");
			print("<hr/>");
    	}    	 

    	private function getMCFDimensionOnly($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
			print_line(__FUNCTION__." $dimName");
			
			googleHelper::resetCount($dimName);
    		$res=googleHelper::getMCFResults($date,$this->client,$this->service,$this->profile,$dim->optParams());  	
    		$dim->saveGoogleResults($res);
    	}    	 
    					
    	private function getGADimensionResults($date,$dimName){
    		$dim=safe_DataObject_factory("dim$dimName");
    		$fct=safe_DataObject_factory("fct$dimName");
			
			print_line(__FUNCTION__." $dimName");
			
			googleHelper::resetCount($dimName);
			startTimer("Get Google Data");
     		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$dim->optParams($fct->optParams()),$fct->metrics());
			stopTimer("Get Google Data");
			krumo($res);
			startTimer("Save Google Data");
    		$dim->saveGoogleResults($res);
    		$fct->saveGoogleResults($res);
			stopTimer("Save Google Data");
			print("<hr/>");
    	}

    	private function getGAFactOnly($date,$dimName){
    		$fct=safe_DataObject_factory("fct$dimName");
			
			print_line(__FUNCTION__." $dimName");
			
			googleHelper::resetCount($dimName);
			startTimer("Get Google Data");
     		$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
			stopTimer("Get Google Data");
			krumo($res);
			startTimer("Save Google Data");
    		$fct->saveGoogleResults($res);
			stopTimer("Save Google Data");
			print("<hr/>");
    	}

    	
    	private function getGAFactResults($date,$fctName){
    		$fct=safe_DataObject_factory("fct$fctName");
    		print_line(__FUNCTION__." $fctName");
			
			googleHelper::resetCount($fctName);
			startTimer("Get Google Data");
			if (isset($_GET['krumo_full'])){
				krumo($fct->optParams());
				krumo($fct->metrics());	
			}
			$res=googleHelper::getGAResults($date,$this->client,$this->service,$this->profile,$fct->optParams(),$fct->metrics());
			stopTimer("Get Google Data");
    		//Krumo($res);
    		startTimer("Save Google Data");
			$extras=array_keys($fct->links());
			foreach ($extras as $dim){
				$doDim=safe_DataObject_factory($dim);
				$doDim->saveGoogleResults($res);
			}			
			flush_buffers();
    		$fct->saveGoogleResults($res);
			stopTimer("Save Google Data");
			print("<hr/>");						
    	}    	
    	
		private function factLoaded($fctName,$date=null){
			if (!isset($date)) return false;
			$fct=safe_DataObject_factory("fct$fctName");
			$fct->dimDate=str_replace("-", "", $date);
			$fct->dimProfile=$this->profile;
			return $fct->find();
		}

		protected function ValidateFact($fctName,$date=null,$compareTo="fctDate"){
			global $db;			
			
			if ($date!=null){
				$do=new DateTime($date);
				$date=$do->format("Ymd");
			}
			
			$fct=safe_DataObject_factory("fct$fctName");
			$dte=safe_DataObject_factory("$compareTo");
			
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
			$sql1.=" from $compareTo where dimProfile=".$this->profile;
			if ($date!=null) $sql.=" and dimDate=".$date;
			$sql.=" group by dimDate";
			
			$sql2= "select d.dimDate, rows, case when (1=1) $all then 'All Valid' else 'Some Invalid' end AllValid $sql2 from ($sql) f join ($sql1) d on f.dimDate=d.dimDate";
			
			krumo($sql2);
			$res=$db->query($sql2);
			print "<br/>";
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
  			if ($date==null){
  				$this->getGAFactResults($date, "Date");
				//Now find Oldest Unprocessed Day
				//This will be a date in fctCustomVar1 that has no row in ftcVanquisSession 
				$do_date=safe_dataobject_factory("fctCustomVar1");
				$do_date->query("select distinct f.* 
from fctCustomVar1 f 
left join fctVanquisSession v
on v.dimProfile=f.dimProfile and v.dimDate=f.dimDate and dimCustomVar1=dimVanquisSession
where v.dimdate is null
and f.dimprofile={$this->profile}
order by f.dimDate");
				if (!$do_date->fetch())
				{
					print_line("No Data to Process");
					return;
				}
				print("<H3>Date to process=".$do_date->dimDate."</H3>");
				if (isset($_GET['krumo_full'])) krumo($do_date);
  				$dt_date=new DateTime($do_date->dimDate);
				$date=$dt_date->format("Y-m-d");	
  			}
			else 
			{//These are implied by getting CustomVar1
				$this->getGADimensionOnly($date, "Date");	
			}			
    		$this->getGAFactResults($date,"PageTracking");				    		
			$this->getGAFactOnly($date,"LandingPagePath");
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

  		function CashMax($date){
  			//Load Date Based Dimension/Measures
			//$this->getGAFactResults($date, "VanquisSession");			
			$this->getGAFactResults($date, "Load_CashMax_Base");
			$this->getGAFactResults($date, "Load_CashMax_BaseII");
			$this->getGAFactResults($date, "Load_CashMax_Visitor");
						
			//$this->getGAFactResults($date, "CashMaxHour");
			
			$date=str_replace("-","",$date);
			
			$this->ValidateFact("CashMax",$date,"fctvsDate");
			//$this->ValidateFact("CashMaxHour",$date,"fctvsDate");
			
			showTable("fctCashMax","dimDate",str_replace("-","",$date));
			//showTable("fctCashMaxHour","dimDate",str_replace("-","",$date));
			showTable("fctvsDate","dimDate",str_replace("-","",$date));
			
  		}
  
  
  		function sessionData($date=null){
  						
  			if ($date==null){
  				$this->getGAFactResults($date, "CustomVar1");
				//Now find Oldest Unprocessed Day
				//This will be a date in fctCustomVar1 that has no row in ftcVanquisSession 
				$do_date=safe_dataobject_factory("fctCustomVar1");
				$do_date->query("select distinct f.* 
from fctCustomVar1 f 
left join fctVanquisSession v
on v.dimProfile=f.dimProfile and v.dimDate=f.dimDate and dimCustomVar1=dimVanquisSession
where v.dimdate is null
and f.dimprofile={$this->profile}
order by f.dimDate");
				if (!$do_date->fetch())
				{
					print_line("No Data to Process");
					return;
				}
				print("<H3>Date to process=".$do_date->dimDate."</H3>");
				if (isset($_GET['krumo_full'])) krumo($do_date);
  				$dt_date=new DateTime($do_date->dimDate);
				$date=$dt_date->format("Y-m-d");	
  			}
			else 
			{//These are implied by getting CustomVar1
			print("<H3>Date to process=$date</H3>");
				$this->getGADimensionOnly($date, "Date");	
			}			
/**/			
			//Get 'New' Dimensions
			startTimer("Dimensions");
			$this->getGADimensionOnly($date, "CustomVar2");
			$this->getGADimensionOnly($date, "CustomVar3");
			$this->getGADimensionOnly($date, "CustomVar4");
			$this->getGADimensionOnly($date, "CustomVar5");
			$this->getGADimensionOnly($date, "Ecommerce");
			$this->getGADimensionOnly($date, "Event");
			$this->getGADimensionOnly($date, "Geo");
			$this->getGADimensionOnly($date, "Network");
			$this->getGADimensionOnly($date, "Mobile");
			$this->getGADimensionOnly($date, "Platform");
			$this->getGADimensionOnly($date, "System");			
			$this->getGADimensionOnly($date, "Traffic");
			$this->getGADimensionOnly($date, "AllTraffic");
			$this->getGADimensionOnly($date, "Visitor");
			$this->getGADimensionOnly($date, "DaysSinceLastVisit");
			stopTimer("Dimensions");
/**/							
			//Get Dates 'Facts'
			startTimer("Facts");			
/**/
			$this->getGAFactOnly($date, "vsCustomVar2");
			$this->getGAFactOnly($date, "vsCustomVar3");
			$this->getGAFactOnly($date, "vsCustomVar4");
			$this->getGAFactOnly($date, "vsCustomVar5");
			$this->getGAFactOnly($date, "vsAllTraffic");
			$this->getGAFactOnly($date, "vsPlatform");
			$this->getGAFactOnly($date, "vsDevice");
			$this->getGAFactOnly($date, "vsEcommerce");
			$this->getGAFactOnly($date, "vsEvent");
			$this->getGAFactOnly($date, "vsGeo");
			$this->getGAFactOnly($date, "vsNetwork");
			$this->getGAFactOnly($date, "vsSystem");
			$this->getGAFactOnly($date, "vsTraffic");
			$this->getGAFactOnly($date, "vsVisitor");
			//PageTracking is Problamatic so we get as FactResults to save all the data
			$this->getGAFactResults($date, "vsPageTracking");
/**/			
			$this->getGADimensionResults($date, "VanquisSession");			
			stopTimer("Facts");
/**/			
			totalTimes();
  		}
    	
    	
		function performance($date=null){
			$this->getGAFactResults($date, "Date");				
  			if ($date==null){
  				
				//Now find Oldest Unprocessed Day
				//This will be a date in fctPerformance that has no row in ftcVanquisSession 
				$do_date=safe_dataobject_factory("fctDate");
				$do_date->query(
"select distinct f.* 
from fctDate f 
left join (
	select dimProfile,dimdate,sum(visits) visits 
	from fctPerformancePage 
	group by dimProfile,dimDate
) v
on v.dimProfile=f.dimProfile and v.dimDate=f.dimDate
where (v.dimdate is null or f.visits>v.visits)
and f.dimprofile={$this->profile}
and f.visits>0
and f.dimdate between 20121101 and 20121131 
order by f.dimDate;"
				);
				if (!$do_date->fetch())
				{
					print_line("No Data to Process");
					return;
				}
				print("<H3>Date to process=".$do_date->dimDate."</H3>");
				if (isset($_GET['krumo_full'])) krumo($do_date);
  				$dt_date=new DateTime($do_date->dimDate);
				$date=$dt_date->format("Y-m-d");	
  			}
			else 
			{//These are implied by getting CustomVar1
				print("<H3>Date to process=$date</H3>");
			}			

			$this->getGADimensionResults($date, "Traffic");
			$this->getGADimensionOnly($date, "PagePath");			

			$this->getGAFactOnly($date, "Performance");
			$this->getGAFactOnly($date, "PerformanceGoal");
			$this->getGAFactOnly($date, "PerformancePage");

			//PageTracking is Problamatic so we get as FactResults to save all the data
			$this->getGAFactResults($date, "PageTracking");
					
			$this->ValidateFact("Performance",$date);
			$this->ValidateFact("PerformanceGoal",$date);
			$this->ValidateFact("PerformancePage",$date);
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