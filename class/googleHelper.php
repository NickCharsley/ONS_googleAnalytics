<?php
/*
 * Created on 11 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 include_once 'ons_common.php';
 
 class googleHelper {
 
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
	   
	  static function getResults($date,$service,$profile,$optParams,$metrics='ga:visits'){	  	
	  	$results=new googleResultsWrapper();
		$results->dimProfile=$profile;
	  	$aDims=split(",",$optParams['dimensions']);
	  	$aMets=split(",",$metrics);
	  	if (count($aDims)>7){
	  		//die("Too Many Dimensions! ".__FILE__.":".__LINE__);
	  		$newDims=array();
	  		for ($i=0;$i<7;$i++){
	  			$newDims[]=$aDims[$i];
	  			unset($aDims[$i]);
	  		}
	  		//Get First 7 for filter
	  		$optParams['dimensions']=join(",",$newDims);
	  		$gaFilter=googleHelper::getResults($date, $service, $profile, $optParams);
	  		//krumo($gaFilter);
	  		$optParams['dimensions']=join(",",$aDims);
	  		for($i=0;$i<$gaFilter->rowCount;$i++){
	  			$optParams['filters']=str_replace(",", ";", $gaFilter->getFilter($i));
	  			//Need to replace , with ; to be an 'and' in Google Filters
	  			$results->mergeResults(googleHelper::getResults($date, $service, $profile, $optParams,$metrics));
	  		}
	  //		krumo($results);
	  	//	die(__FILE__.":".__LINE__);	  		 
	  	}
		else if (count($aMets)>10){
	  		$newMets=array();
	  		for ($i=0;$i<10;$i++){
	  			$newMets[]=$aMets[$i];
	  			unset($aMets[$i]);
	  		}
	  		$results->mergeResults(googleHelper::getResults($date, $service, $profile, $optParams, join(",",$newMets)));
	  		$results->mergeResults(googleHelper::getResults($date, $service, $profile, $optParams, join(",",$aMets  )));
	  	}
		else if (strpos($optParams['dimensions'],"ga:IsMobile")) {
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
			$optParamsYes['dimensions']=join(",",$newDims);

			$results->mergeResults(googleHelper::getResults($date, $service, $profile, $optParamsNo, $metrics));
	  		$results->mergeResults(googleHelper::getResults($date, $service, $profile, $optParamsYes, $metrics));
			
		}
	  	else {
	  		
	  		$startdate=isset($date)?$date:'2010-01-01';			
			$enddate  =isset($date)?$date:date('Y-m-d');
			
	  		$gaResults=$service->data_ga->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  		$results=new googleResultsWrapper($gaResults);
  			//krumo($gaResults);
  			//krumo($results);
			//flush_buffers();									
	  		if ($gaResults->nextLink<>""){
	  			$optParams['start-index']+=$optParams['max-results'];
	  			$gaResults=$service->data_ga->get("ga:".$profile,$startdate,$enddate,$metrics,$optParams);
	  			$results->mergeResults($gaResults);
	  		}
	  	}	  	
	  	//krumo($results);
	  	return $results;
	  }
	  
	  static function getFilter($columnHeaders,$rows,$index){
 			$filters="";
 			for($i=0;$i<count($columnHeaders);$i++){
 				if ($columnHeaders[$i]->columnType=="DIMENSION"){
	 				if ($i>0) $filters.=",";
 					$filters.=$columnHeaders[$i]->name."==";
	 				$filters.=$rows[$index][$i];
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
	 				list($name,$value)=split("==",$filter);
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
