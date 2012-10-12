<?php

	include_once("ons_common.php");
	
	
  /* Set your Google Analytics credentials */

define('ga_account'     ,'vblapi@gmail.com');
define('ga_password'    ,'webmonkey');
define('ga_profile_id'  ,'55368687');//Poland

$dimensions=array(
					'Date',
					'dayOfWeek',
					'visitorType',
					'visitCount',
					'daysSinceLastVisit',
					'userDefinedValue',
					'visitLength',
					'referralPath',
					'campaign',
					'source',
					'medium'/*,
					'keyword',
					'adContent',
					'socialNetwork',
					'hasSocialSourceReferral',
					'adGroup',
					'adSlot',
					'adSlotPosition',
					'adDistributionNetwork',
					'adMatchType',
					'adMatchedQuery',
					'adPlacementDomain',
					'adPlacementUrl',
					'adFormat',
					'adTargetingType',
					'adTargetingOption',
					'adDisplayUrl',
					'adDestinationUrl',
					'adwordsCustomerID',
					'adwordsCampaignID',
					'adwordsAdGroupID',
					'adwordsCreativeID',
					'adwordsCriteriaID',
					'browser',
					'browserVersion',
					'operatingSystem',
					'operatingSystemVersion',
					'isMobile',
					'mobileDeviceBranding',
					'mobileDeviceModel',
					'mobileInputSelector',
					'mobileDeviceInfo',
					'continent',
					'subContinent',
					'country',
					'region',
					'metro',
					'city',
					'latitude',
					'longitude',
					'networkDomain',
					'networkLocation',
					'flashVersion',
					'javaEnabled',
					'language',
					'screenColors',
					'screenResolution',
					'socialActivityEndorsingUrl',
					'socialActivityDisplayName',
					'socialActivityPost',
					'socialActivityTimestamp',
					'socialActivityUserHandle',
					'socialActivityUserPhotoUrl',
					'socialActivityUserProfileUrl',
					'socialActivityContentUrl',
					'socialActivityTagsSummary',
					'socialActivityAction',
					'socialActivityNetworkAction',
					'hostname',
					'pagePath',
					'pagePathLevel1',
					'pagePathLevel2',
					'pagePathLevel3',
					'pagePathLevel4',
					'pageTitle',
					'landingPagePath',
					'secondPagePath',
					'exitPagePath',
					'previousPagePath',
					'nextPagePath',
					'pageDepth',
					'searchUsed',
					'searchKeyword',
					'searchKeywordRefinement',
					'searchCategory',
					'searchStartPage',
					'searchDestinationPage',
					'eventCategory',
					'eventAction',
					'eventLabel',
					'transactionId',
					'affiliation',
					'visitsToTransaction',
					'daysToTransaction',
					'productSku',
					'productName',
					'productCategory',
					'socialInteractionNetwork',
					'socialInteractionAction',
					'socialInteractionNetworkAction',
					'socialInteractionTarget',
					'userTimingCategory',
					'userTimingLabel',
					'userTimingVariable'
*/					);
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
		
		$date='20121007';
		
		print_pre("Filter=[".$filter."]");
		
		

		$met=array();
		$dim="";
		$nest=array();
		$pop=array_reverse($pop);
		foreach ($ga->getResults() as $result){
			if ($result->getVisits()>0 && count($dimensions)>0){
				foreach ($pop as $item){
					$dim="get$item";
					if ($filter != "") $filter.=" && ";						
					$filter.=$item." == '".$result->$dim()."'";
					$nest[]=$result->$dim();
				}				
				$met=getValueArray(getMetrics($ga,$filter,$dimensions),$nest);
			}
			else {								
				//$pop=array_reverse($pop);
				foreach ($pop as $item){
					$dim="get$item";
					$nest[]=$result->$dim();
				}
				$met=getValueArray(array('Visits'=>$result->getVisits()),$nest);
			}
		//	break;
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
	
	
	$date=pg_value('date',date('Y-m-d'));
  	 
	$ga = new gapi(ga_account,ga_password);
	
	$dimensions=array('Date');//,'AdWordsCampaignID','AdWordsAdGroupID','AdWordsCreativeID','AdWordsCriteriaID');
	$metrics_adWords=array('Impressions','adClicks','AdCost','costPerGoalConversion','goalCompletionsAll');

	$metrics_visit=array('Visits','Bounces','AvgTimeOnSite','newVisits','Visitors','PageviewsPerVisit');
		
	$ga->requestReportData(ga_profile_id
			,$dimensions
			,$metrics_adWords
			,'-Date'
			,""
			,$date
			,$date
		);	
	

	$met=pivotGAData($ga->getResults(), array_merge($dimensions,$metrics_adWords));

	//print_pre($met_adWords);
	
	$ga->requestReportData(ga_profile_id
			,$dimensions
			,$metrics_visit
			,'-Date'
			,""
			,$date
			,$date
		);
			
	foreach (pivotGAData($ga->getResults(), array_merge($dimensions,$metrics_visit)) as $date=>$data){
		foreach($data as $key=>$value){
			$met[$date][$key]=$value;
		}
	}
	header("Content-type: text/xml;");
	print('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'."\n");
	print('<GA>');
	foreach ($met as $date=>$data){
		print "<gaResult date='$date'>\n";
		foreach($data as $key=>$value){
			print "\t<$key>$value</$key>\n";
		}
		print "</gaResult>\n";
	}
	print('</GA>');		
} catch (Exception $e) { 
    print('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'."\n");
	echo '<Error>Caught exception: ' . $e->getMessage().'</Error>'."\n";
}

$dimensions_adWords=array(
						'Date',
						'AdGroup',
						'AdSlot',//Not with Others?
						'AdSlotPosition',//Not with Others?
						'AdMatchType',
						'AdDistributionNetwork'
					);

$metrics_adWords=array(
						'Impressions',
						'adClicks',
						'AdCost',
						'CPM',
						'CPC',
						'CTR',
						'CostPerTransaction',
						'CostPerGoalConversion',
						'CostPerConversion',
						'RPC',
						'ROI',
						'Margin'
					);
?>