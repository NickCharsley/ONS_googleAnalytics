<?php
/*
 * Created on 9 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 *
 */

	include_once("ons_common.php");

define('ga_account'     ,'vblapi@gmail.com');
define('ga_password'    ,'webmonkey');
define('ga_profile_id'  ,'55368687');//Poland

/** / 
 $list=array(
			'visitorTypevisitCountdaysSinceLastVisit',
			'visitLength',
			'referralPath',
			'campaign',
			'source',
			'medium',
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
			'userTimingVariable',
			'customVarName1',
			'customVarValue1',
			'customVarName2',
			'customVarValue2',
			'customVarName3',
			'customVarValue3',
			'customVarName4',
			'customVarValue4',
			'customVarName5',
			'customVarValue5',
			'date',
			'year',
			'month',
			'week',
			'day',
			'hour',
			'nthMonth',
			'nthWeek',
			'nthDay',
			'dayOfWeek'
		);

 $dims[2]=array();
 for ($i=0;$i<(count($list)-1);$i++)
 	for ($j=$i+1;$j<count($list);$j++)
 		$dims[2][]=array($list[$i],$list[$j]);
 		
$data=json_encode($dims); 		
print_pre($data);
 		
$filename=buildPath(dirname(__FILE__),'Data',"todo.json");

print_line("Saved File $filename (".file_put_contents($filename,$data).")");

krumo($dims);
/**/

function getMetrics($ga,$filter,$dimensions){
		for ($i=0;$i<7 && count($dimensions)>0;$i++)
			$pop[]=array_pop($dimensions);
		
		$date='2012-10-07';
		$met=0;

		try {		
				$ga->requestReportData(ga_profile_id
					,$pop
					,"visits"
					,$pop[0]
					,$filter
					,$date
					,$date
					,1
					,1
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
			$error=$e->getMessage();
			print_line("Caught exception: $error" );
			//if (!(strpos($error,"GDatainvalidInvalid Value"     )===false)) return 0;
			if (!(strpos($error,"GDatabadRequestInvalid request")===false)) return -1000;
			die;
		}		
		return $met;
		
}

function printArray($array){
	$ret="";
	foreach($array as $item){
		if ($ret!="") $ret.=", ";
		$ret.=$item;
	}
	return $ret;
}


$fn_todo=buildPath(dirname(__FILE__),'Data',"todo.json");
$fn_done=buildPath(dirname(__FILE__),'Data',"done.json");
$fn_fail=buildPath(dirname(__FILE__),'Data',"fail.json");

$todo=json_decode(file_get_contents($fn_todo),true);
$done=json_decode(file_get_contents($fn_done),true);
$fail=json_decode(file_get_contents($fn_fail),true);

try {
	$ga = new gapi(ga_account,ga_password);	
	$time=0;	
	foreach ($todo as $level=>$test){
		foreach ($test as $key=>$value){
			if (time()<$time) sleep(1);
			$time=time()+1;	
			$rows=getMetrics($ga,"",$value);
			print_line("Test $level:$key for [".printArray($value)."] returned $rows row(s).");
			if ($rows>=0){
				$done[count($test)][$key]=$value;
				$bytes=file_put_contents($fn_done,json_encode($done));
			//	print_line("Saved File $fn_done ($bytes)");
			}
			if ($rows>=0){
				asort($value);
				$fail[]=$value;
				$bytes=file_put_contents($fn_fail,json_encode($fail));
			//	print_line("Saved File $fn_done ($bytes)");
			}
			{
				unset($todo[$level][$key]);
				$bytes=file_put_contents($fn_todo,json_encode($todo));
				//print_line("Saved File $fn_todo ($bytes)");
			}						
		}
	}
} catch (Exception $e) { 
	print_line('Caught exception: ' . $e->getMessage());
}
 
print_line("Done All");
 
?>
