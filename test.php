<?php

	include_once("ons_common.php");
	
	
  /* Set your Google Analytics credentials */

define('ga_account'     ,'vblapi@gmail.com');
define('ga_password'    ,'webmonkey');
define('ga_profile_id'  ,'55368687');//Poland

/*
	for($i=1;$i<=5;$i++){
		$dimensions[]="customVarName($i)";
		$dimensions[]="customVarValue($i)";
	}
 */

$metrics=array('Visits');

function getValueArray($value,$nest){
	if (count($nest)==1){
		return array($nest[0]=>$value);	
	} else {
		$pop=array_pop($nest);
		return array($pop=>getValueArray($value,$nest));	
	}
	
}

function getRow($metrics,$row=""){
	foreach($metrics as $metric=>$submetrics){
		$row.="<td>$metric</td>";
		if (is_array($submetrics)){
			$row.=getRow($submetrics);
		}
		else $row.="<td>$submetrics</td>";
	}
	return $row;
}

function getMetrics($ga,$filter,$dimensions){
		for ($i=0;$i<7 && count($dimensions)>0;$i++)
			$pop[]=array_pop($dimensions);
		
		$date='2012-10-07';
		$met=0;

		try {		
				$ga->requestReportData(ga_profile_id
					,$pop
					,"visits"
					,'-Date'
					,$filter
					,$date
					,$date
				);	
		
				$dim="";
				
				$nest=array();
				$pop=array_reverse($pop);
				$results=$ga->getResults();
				$met=count($results);
				foreach ($results as $result){
					if ($result->getVisits()>0 && count($dimensions)>0){
						foreach ($pop as $item){
							$dim="get$item";
							if ($filter != "") $filter.=" && ";						
							$filter.=$item." == '".$result->$dim()."'";
							$nest[]=$result->$dim();
						}				
						$met+=getValueArray(getMetrics($ga,$filter,$dimensions),$nest)-1;								
					}			
				}
		} catch (Exception $e) { 
			print_line('Caught exception: ' . $e->getMessage());
		}		
		return $met;
		
}

function pivotGAData($rows,$fields){
	
	foreach ($rows as $row){
		$date=$row->getDate();
		foreach($fields as $field){
			$dim="get$field";
			$met[$date][$field]=$row->$dim();
		}			
	}
	return $met;
}


try {	
	$ga = new gapi(ga_account,ga_password);

	$test='referralPath';

	$dimensions[]=array(
					'Date','DayOfWeek','visitorType','visitCount','daysSinceLastVisit'
					,'userDefinedValue','visitLength'/*,'campaign'/*,'source'/*,'medium'/*,'keyword'/*,'adContent'/*,
					'socialNetwork'/*,'hasSocialSourceReferral'/*,'adMatchedQuery'/*,'adPlacementDomain'/*,
					'adPlacementUrl'/*,'adFormat'/*,'adTargetingType'/*,'adTargetingOption'/*,
					'adDisplayUrl'/*,'adDestinationUrl'/*,'adwordsCustomerID'/*,'adwordsCampaignID'/*,
					'adwordsAdGroupID'/*,
					'adwordsCreativeID'/*,
					'adwordsCriteriaID'/*,
					'browser'/*,
					'browserVersion'/*,
					'operatingSystem'/*,
					'operatingSystemVersion'/*,
					'isMobile'/*,
					'mobileDeviceBranding'/*,
					'mobileDeviceModel'/*,
					'mobileInputSelector'/*,
					'mobileDeviceInfo'/*,
					'continent'/*,
					'subContinent'/*,
					'country'/*,
					'region'/*,
					'metro'/*,
					'city'/*,
					'latitude'/*,
					'longitude'/*,
					'networkDomain'/*,
					'networkLocation'/*,
					'flashVersion'/*,
					'javaEnabled'/*,
					'language'/*,
					'screenColors'/*,
					'screenResolution'/*,
					'socialActivityEndorsingUrl'/*,
					'socialActivityDisplayName'/*,
					'socialActivityPost'/*,
					'socialActivityTimestamp'/*,
					'socialActivityUserHandle'/*,
					'socialActivityUserPhotoUrl'/*,
					'socialActivityUserProfileUrl'/*,
					'socialActivityContentUrl'/*,
					'socialActivityTagsSummary'/*,
					'socialActivityAction'/*,
					'socialActivityNetworkAction'/*,
					'hostname'/*,
					'pagePath'/*,
					'pagePathLevel1'/*,
					'pagePathLevel2'/*,
					'pagePathLevel3'/*,
					'pagePathLevel4'/*,
					'pageTitle'/*,
					'landingPagePath'/*,
					'secondPagePath'/*,
					'exitPagePath'/*,
					'previousPagePath'/*,
					'nextPagePath'/*,
					'pageDepth'/*,
					'searchUsed'/*,
					'searchKeyword'/*,
					'searchKeywordRefinement'/*,
					'searchCategory'/*,
					'searchStartPage'/*,
					'searchDestinationPage'/*,
					'eventCategory'/*,
					'eventAction'/*,
					'eventLabel'/*,
					'transactionId'/*,
					'affiliation'/*,
					'visitsToTransaction'/*,
					'daysToTransaction'/*,
					'productSku'/*,
					'productName'/*,
					'productCategory'/*,
					'socialInteractionNetwork'/*,
					'socialInteractionAction'/*,
					'socialInteractionNetworkAction'/*,
					'socialInteractionTarget'/*,
					'userTimingCategory'/*,
					'userTimingLabel'/*,
					'userTimingVariable'
*/					);

$dimensions[]=array(
					'Date','AdGroup','AdSlot','AdSlotPosition','adMatchedQuery','DayOfWeek','visitorType'
					);
$dimensions[]=array(
					'Date','AdGroup','AdMatchType','AdDistributionNetwork','adMatchedQuery','DayOfWeek','visitorType'
					);
$dimensions[]=array(
					'Date'
					);
	
	$i=0;
	foreach ($dimensions as $dims){
		if (!in_array($dims,$test)) $dims[]=$test;
		$rows=getMetrics($ga,"",$dims);
		print_line("Test $i for $test returned $rows row(s).");
	}
		
} catch (Exception $e) { 
	print_line('Caught exception: ' . $e->getMessage());
}

?>