<?php
/*
 * Created on 11 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 include_once 'ons_common.php';
 
 class googleHelper {
 	static $counter=0;
	static $version="";
 
	 static function getFirstId(&$collection) {
	    $items = $collection->getItems();
	    return $items[0]->getId();
	  }
 
	  static function getAllIDs(&$collection) {
	  	$ret=array();
	  	foreach ( $collection->getItems() as $item){
	  		$ret[]=$item->getId();
	  	}	  	
	  	return $ret;
	  }
	  
	  
	  /**
	   * Returns the rows of data as an HTML Table.
	   * @param GaData $results The results from the Core Reporting API.
	   * @return string The formatted results.
	   */
	  static function getRows($results) {	  	
	  	return $results->getRowsTable();
	  }
	   
	  static function resetCount($version=""){
	  	googleHelper::$counter=0;
		googleHelper::$version=$version;
	  } 
/*
	  static function getResults($date,$client,$service,$profile,$optParams,$metrics='ga:visits'){
	  	 krumo::backtrace();
	  	 return getGAResults($date,$client,$service,$profile,$optParams,$metrics);
	  }
*/	   




	  static function splitDims(&$oldDims,&$newDims){
  		$bump=array("ga:addestinationurl","ga:addisplayurl","ga:adplacementurl","ga:exitpagepath","ga:landingpagepath",
			"ga:nextpagepath","ga:pagepath","ga:previouspagepath","ga:referralpath","ga:searchdestinationpage",
			"ga:searchstartpage","ga:secondpagepath","ga:socialactivitycontenturl","ga:socialactivityendorsingurl",
			"ga:socialactivityuserphotourl","ga:socialactivityuserprofileurl","ga:socialinteractiontarget"
			);
		$max=count($oldDims);
  		for ($i=0;$i<$max and count($newDims)<7 and count($oldDims)>7;$i++){
  			if (!in_array(strtolower($oldDims[$i]), $bump)){
  				
	  			$newDims[]=$oldDims[$i];
	  			unset($oldDims[$i]);  				
  			}			
  		}
		if (count($newDims)==0){
			die("Too many Bumps ".__FILE__.":".__LINE__);
		}
	  	
	  }

	  static function splitMets(&$oldMets,&$newMets){
  		$bump=array();
		$max=count($oldMets);
		
  		for ($i=0;$i<$max and count($newMets)<10 and count($oldMets)>10;$i++){
  			if (!in_array(strtolower($oldMets[$i]), $bump)){
	  			$newMets[]=$oldMets[$i];
	  			unset($oldMets[$i]);  				
  			}			
  		}
		if (count($newMets)==0){
			die("Too many Bumps ".__FILE__.":".__LINE__);
		}
	  	
	  }


	  static function getGAResults($date,$client,$service,$profile,$optParams,$metrics='ga:visits'){
	  	//krumo($optParams);	  	
	  	$results=new googleGAResultsWrapper();
		$results->dimProfile=$profile;
	  	$aDims=split(",",$optParams['dimensions']);
	  	$aMets=split(",",$metrics);
		
	  	if (in_array("ga:Goal",$aDims)){
	  		$newDims=array_diff($aDims,array("ga:Goal"));
	  		
	  		$goals=array();
	  		
	  		$optParams['dimensions']=join(",",$newDims);
	  		$goal=Safe_DataObject_factory("dimGoal");
	  		$goal->dimProfile=$profile;
	  		$goal->find();
	  		
	  		while ($goal->fetch()){
	  			if ($goal->GoalNumber>0){
		  			$optParams['filters']="ga:Goal".$goal->GoalNumber."Starts!=0";
					$agMets=array_merge($aMets,array(
						"ga:Goal".$goal->GoalNumber."Starts",
						"ga:Goal".$goal->GoalNumber."Completions",
						"ga:Goal".$goal->GoalNumber."Value",
						"ga:Goal".$goal->GoalNumber."ConversionRate",
						"ga:Goal".$goal->GoalNumber."Abandons",
						"ga:Goal".$goal->GoalNumber."AbandonRate"
					));
					$goals[]=$goal->GoalNumber;
					
					//krumo($agMets);
					$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParams,join(",",$agMets)));
					//krumo($results);	
				}
	  		}
			//Need to be ; to be an 'and' in Google Filters
			$optParams['filters']="ga:Goal".join("Starts==0;ga:Goal",$goals)."Starts==0";
	  		
	  		$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParams,$metrics));			
			//krumo($results);				  	
	  	}
		else if (count($aDims)>7){
	  		//die("Too Many Dimensions! ".__FILE__.":".__LINE__);
	  		$newDims=array();
	  		//Get First 7 for filter
	  		googleHelper::splitDims($aDims, $newDims);
			if (isset($_GET['krumo_full'])) krumo($aDims);
			if (isset($_GET['krumo_full'])) krumo($newDims);
	  		$optParams['dimensions']=join(",",$newDims);
	  		$gaFilter=googleHelper::getGAResults($date,$client,$service,$profile, $optParams);
	  		//krumo($gaFilter);
	  		$optParams['dimensions']=join(",",$aDims);
	  		for($i=0;$i<$gaFilter->rowCount;$i++){
	  			$optParams['filters']=str_replace(",", ";", $gaFilter->getFilter($i));
	  			//Need to replace , with ; to be an 'and' in Google Filters
	  			$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParams,$metrics));
	  		}
	  //		krumo($results);
	  	//	die(__FILE__.":".__LINE__);	  		 
	  	}		
		else if (count($aMets)>10){
	  		$newMets=array();
			googleHelper::splitMets($aMets, $newMets);
	  		$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParams, join(",",$newMets)));
	  		$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParams, join(",",$aMets  )));
	  	}
		else if (strpos($optParams['dimensions'],"ga:IsMobile")) {
			/**
			 * IsMobile is odd so we filter it and then Merge
			 * But on the Yes side we gather all the other Dimensions
			 */
			//Remove IsMobile from Dimensions
			$newDims=array();
	  		foreach ($aDims as $dim){
	  			if ($dim!="ga:IsMobile") $newDims[]=$dim;	  			
	  		}
	  		$optParams['dimensions']=join(",",$newDims); 
			
			$optParamsNo=$optParams;
			$optParamsYes=$optParams;
			
			//Add IsMobile to Filters
			if (isset($optParams['filters'])){
				$optParamsNo['filters'].=";ga:IsMobile==No";;
				$optParamsYes['filters'].=";ga:IsMobile==Yes";				
			}
			else {
				$optParamsNo['filters'] ="ga:IsMobile==No";
				$optParamsYes['filters']="ga:IsMobile==Yes";				
			}
			//Add Extra Dimensions to Yes Branch
			$newDims=array_merge($newDims,array("ga:mobiledevicebranding","ga:mobiledeviceinfo","ga:mobiledevicemodel","ga:mobileinputselector"));
			//Should Sort it again :)
			usort($newDims,'dimCmp');			
						
			$optParamsYes['dimensions']=join(",",$newDims);

			$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParamsNo, $metrics));
	  		$results->mergeResults(googleHelper::getGAResults($date,$client,$service,$profile, $optParamsYes, $metrics));
			
		}
	  	else {
	  		if (isset($date)){
		  		$startdate=$date;			
				$enddate  =$date;				
	  		}	else {
	  			if (!isset($_GET['history'])){
		  			$sdt=new DateTime();
		  			$startdate=$sdt->Sub(new DateInterval('P14D'))->format('Y-m-d');								
	  			} else {
	  				$startdate=$_GET['history'];
	  			}
	  			$enddate  =date('Y-m-d');							
	  		}  		
	  		googleHelper::$counter++;
			debug_error_log("Google Analytics (GA) call ".googleHelper::$version.":".googleHelper::$counter." (ga:$profile,$startdate,$enddate,$metrics)");
			debug_error_log($optParams);			
	  		$gaResults=$service->data_ga->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  		$results=new googleGAResultsWrapper($gaResults);
  			if (isset($_GET['krumo_full'])) krumo($gaResults);
  			if (isset($_GET['krumo_full'])) krumo($results);
			//die(__FILE__.":".__FILE__);
			//flush_buffers();									
	  		if ($gaResults->nextLink<>""){
	  			$optParams['start-index']+=$optParams['max-results'];
	  			$gaResults=$service->data_ga->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  			$results->mergeResults($gaResults);
	  		}
	  	}	  	
	  	//krumo($results);
		if ($client->getAccessToken()) {
			$_SESSION['token'] = $client->getAccessToken();
		}
	  	
	  	
	  	return $results;
	  }

	  static function getMCFResults($date,$client,$service,$profile,$optParams){
	  	$metrics='mcf:totalConversions,mcf:totalConversionValue,mcf:assistedConversions,mcf:assistedValue,mcf:firstInteractionConversions,mcf:firstInteractionValue,mcf:lastInteractionConversions,mcf:lastInteractionValue';
	  	  	
	  	$results=new googleMCfResultsWrapper();
		$results->dimProfile=$profile;
	  	$aDims=split(",",$optParams['dimensions']);
	  	$aMets=split(",",$metrics);
	  	if (false){//count($aDims)>7){
	  		//die("Too Many Dimensions! ".__FILE__.":".__LINE__);
	  		$newDims=array();
	  		for ($i=0;$i<7;$i++){
	  			$newDims[]=$aDims[$i];
	  			unset($aDims[$i]);
	  		}
	  		//Get First 7 for filter
	  		$optParams['dimensions']=join(",",$newDims);
	  		$gaFilter=googleHelper::getResults($date,$client,$service,$profile, $optParams);
	  		//krumo($gaFilter);
	  		$optParams['dimensions']=join(",",$aDims);
	  		for($i=0;$i<$gaFilter->rowCount;$i++){
	  			$optParams['filters']=str_replace(",", ";", $gaFilter->getFilter($i));
	  			//Need to replace , with ; to be an 'and' in Google Filters
	  			$results->mergeResults(googleHelper::getResults($date,$client,$service,$profile, $optParams,$metrics));
	  		}
	  //		krumo($results);
	  	//	die(__FILE__.":".__LINE__);	  		 
	  	}
		else if (false){//count($aMets)>10){
	  		$newMets=array();
	  		for ($i=0;$i<10;$i++){
	  			$newMets[]=$aMets[$i];
	  			unset($aMets[$i]);
	  		}
	  		$results->mergeResults(googleHelper::getResults($date,$client,$service,$profile, $optParams, join(",",$newMets)));
	  		$results->mergeResults(googleHelper::getResults($date,$client,$service,$profile, $optParams, join(",",$aMets  )));
	  	}
		else if (false){//strpos($optParams['dimensions'],"ga:IsMobile")) {
			/**
			 * IsMobile is odd so we filter it and then Merge
			 * But on the Yes side we gather all the other Dimensions
			 */
			//Remove IsMobile from Dimensions
			$newDims=array();
	  		foreach (split(",",$optParams['dimensions']) as $dim){
	  			if ($dim!="ga:IsMobile") $newDims[]=$dim;	  			
	  		}
	  		$optParams['dimensions']=join(",",$newDims); 
			
			$optParamsNo=$optParams;
			$optParamsYes=$optParams;
			
			//Add IsMobile to Filters
			if (isset($optParams['filters'])){
				$optParamsNo['filters'].=";ga:IsMobile==No";;
				$optParamsYes['filters'].=";ga:IsMobile==Yes";				
			}
			else {
				$optParamsNo['filters'] ="ga:IsMobile==No";
				$optParamsYes['filters']="ga:IsMobile==Yes";				
			}
			
			//Add Extra Dimensions to Yes Branch
			
			
			$newDims=array_merge($newDims,array("ga:mobiledevicebranding","ga:mobiledeviceinfo","ga:mobiledevicemodel","ga:mobileinputselector"));
			//Should Sort it again :)
			usort($newDims,'dimCmp');			
						
			$optParamsYes['dimensions']=join(",",$newDims);

			$results->mergeResults(googleHelper::getResults($date,$client,$service,$profile, $optParamsNo, $metrics));
	  		$results->mergeResults(googleHelper::getResults($date,$client,$service,$profile, $optParamsYes, $metrics));
			
		}
	  	else {
	  		
	  		$startdate=isset($date)?$date:'2005-01-01';			
			$enddate  =isset($date)?$date:date('Y-m-d');
			googleHelper::$counter++;
			debug_error_log("Google Analytics (MCF) call ".googleHelper::$version.":".googleHelper::$counter." (ga:$profile,$startdate,$enddate,$metrics)");
			debug_error_log($optParams);			
	  		$gaResults=$service->data_mcf->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  		$results=new googleMCFResultsWrapper($gaResults);
  			krumo($results);
			//die(__FILE__.":".__LINE__);
			//flush_buffers();									
	  		if ($gaResults->nextLink<>""){
	  			$optParams['start-index']+=$optParams['max-results'];
	  			$gaResults=$service->data_ga->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  			$results->mergeResults($gaResults);
	  		}
	  	}	  	
	  	//krumo($results);
		if ($client->getAccessToken()) {
			$_SESSION['token'] = $client->getAccessToken();
		}
	  		  	
	  	return $results;
	  }
	  
	  static function getFilter($columnHeaders,$rows,$index){
 			$filters="";
 			for($i=0;$i<count($columnHeaders);$i++){
 				if ($columnHeaders[$i]->columnType=="DIMENSION"){
	 				if ($i>0) $filters.=",";
 					$filters.=$columnHeaders[$i]->name."==";
 					$value=(is_a($rows[$index], "Google_McfDataRows"))?$rows[$index]->$i:$rows[$index][$i]; 					
 					switch ($columnHeaders[$i]->dataType) {
						case 'STRING':
							$filters.=$value;		 
							break;		
						case 'MCF_SEQUENCE':
							$filters.='{';
							for($j=0;$j<count($value['conversionPathValue']);$j++){
								//Can we filter on this if so How?								
								$filters.="conversionPathValue:$j:{";
								$filters.=$value['conversionPathValue'][$j]['interactionType'];								
								$filters.=":";
								$filters.=$value['conversionPathValue'][$j]['nodeValue'];
								$filters.="}";	
							}
							$filters.='}';
							break;											 
						default:
							krumo($columnHeaders[$i]->dataType);
							krumo($value);
							die(__FILE__.':'.__LINE__);
							break;
					 }
 				}
 			}
 			return $filters;
 		}
 		
 		static function getMetrics($columnHeaders,$rows,$index){
 			$metrics=array();
 			for($i=0;$i<count($columnHeaders);$i++){
 				if ($columnHeaders[$i]->columnType=="METRIC"){
 					$metrics[$columnHeaders[$i]->name]=$rows[$index][$i];
 				}
 			}
 			return $metrics;
 		}
 		
 		static function getDimensions($columnHeaders,$rows,$index,$filters=""){ 			
 			$dimensions=array();
 			if ($filters!=""){
	 			foreach(split(",",$filters) as $filter){
	 				if (strpos($filter,"==")>0)
	 					list($name,$value)=split("==",$filter);
					else
						list($name,$value)=split("!=",$filter);
	 				$dimensions[$name]=$value;
	 			}
 			}
 			for($i=0;$i<count($columnHeaders);$i++){
 				if ($columnHeaders[$i]->columnType=="DIMENSION"){
 					$dimensions[$columnHeaders[$i]->name]=$rows[$index][$i];
 				}
 			}
 			return $dimensions;
 		}
 		
 }
?>
