<?php
/*
 * File dbRoot.php
 * Created on 17 Oct 2011 by Nick
 * email php@oldnicksoftware.co.uk
 *
 *
 * Copyright 2011 ONS
 *
 */
 if (!defined("__ONS_COMMON__"))
 	include_once('ons_common.php');
 debug_error_log("Enter ".__FILE__);
//************************************************
//TODO:any generic code for dbRoot.php goes here
class dbRoot extends DB_DataObject {

	protected $dims=array("ga:adcontent","ga:addestinationurl","ga:addisplayurl","ga:date","ga:addistributionnetwork","ga:adformat","ga:adgroup",
			"ga:admatchtype","ga:admatchedquery","ga:adplacementdomain","ga:adplacementurl","ga:adslot","ga:adslotposition",
			"ga:adtargetingoption","ga:adtargetingtype","ga:adwordsadgroupid","ga:adwordscampaignid","ga:adwordscreativeid",
			"ga:adwordscriteriaid","ga:adwordscustomerid","ga:affiliation","ga:browser","ga:browserversion","ga:campaign",
			"ga:city","ga:continent","ga:country","ga:date","ga:day","ga:dayofweek","ga:dayssincelastvisit","ga:daystotransaction",
			"ga:eventaction","ga:eventcategory","ga:eventlabel","ga:exitpagepath","ga:flashversion","ga:hassocialsourcereferral",
			"ga:hostname","ga:hour","ga:ismobile","ga:javaenabled","ga:keyword","ga:landingpagepath","ga:language","ga:latitude",
			"ga:longitude","ga:medium","ga:metro","ga:mobiledevicebranding","ga:mobiledeviceinfo","ga:mobiledevicemodel","ga:mobileinputselector",
			"ga:month","ga:networkdomain","ga:networklocation","ga:nextpagepath","ga:nthday","ga:nthmonth","ga:nthweek","ga:operatingsystem",
			"ga:operatingsystemversion","ga:pagedepth","ga:pagepath","ga:pagepathlevel1","ga:pagepathlevel2","ga:pagepathlevel3",
			"ga:pagepathlevel4","ga:pagetitle","ga:previouspagepath","ga:productcategory","ga:productname","ga:productsku",
			"ga:referralpath","ga:region","ga:screencolors","ga:screenresolution","ga:searchcategory","ga:searchdestinationpage",
			"ga:searchkeyword","ga:searchkeywordrefinement","ga:searchresultviews","ga:searchstartpage","ga:searchuniques","ga:searchused",
			"ga:secondpagepath","ga:socialactivityaction","ga:socialactivitycontenturl","ga:socialactivitydisplayname","ga:socialactivityendorsingurl",
			"ga:socialactivitynetworkaction","ga:socialactivitypost","ga:socialactivitytagssummary","ga:socialactivitytimestamp",
			"ga:socialactivityuserhandle","ga:socialactivityuserphotourl","ga:socialactivityuserprofileurl","ga:socialinteractionaction",
			"ga:socialinteractionnetwork","ga:socialinteractionnetworkaction","ga:socialinteractiontarget","ga:socialinteractions",
			"ga:socialinteractionspervisit","ga:socialnetwork","ga:source","ga:subcontinent","ga:transactionid","ga:uniquesocialinteractions",
			"ga:userdefinedvalue","ga:usertimingcategory","ga:usertiminglabel","ga:usertimingvariable","ga:visitcount","ga:visitlength",
			"ga:visitortype","ga:visitstotransaction","ga:week","ga:year");
	
	protected $mets=array("ga:cpc","ga:cpm","ga:ctr","ga:roi","ga:rpc","ga:adclicks","ga:adcost","ga:appviews","ga:appviewspervisit",
			"ga:avgdomainlookuptime","ga:avgeventvalue","ga:avgpagedownloadtime","ga:avgpageloadtime","ga:avgredirectiontime",
			"ga:avgsearchdepth","ga:avgsearchduration","ga:avgsearchresultviews","ga:avgserverconnectiontime","ga:avgserverresponsetime",
			"ga:avgtimeonpage","ga:avgtimeonsite","ga:avgusertimingvalue","ga:bounces","ga:costperconversion","ga:costpergoalconversion",
			"ga:costpertransaction","ga:domainlookuptime","ga:entrancebouncerate","ga:entrancerate","ga:entrances","ga:eventvalue",
			"ga:eventspervisitwithevent","ga:exceptions","ga:exitrate","ga:exits","ga:fatalexceptions","ga:goalvalueallpersearch",
			"ga:impressions","ga:itemquantity","ga:itemrevenue","ga:itemsperpurchase","ga:margin","ga:newvisits","ga:organicsearches",
			"ga:pagedownloadtime","ga:pageloadsample","ga:pageloadtime","ga:pageviews","ga:pageviewspervisit","ga:percentnewvisits",
			"ga:percentvisitswithsearch","ga:redirectiontime","ga:revenueperitem","ga:revenuepertransaction","ga:searchdepth",
			"ga:searchduration","ga:searchexitrate","ga:searchexits","ga:searchgoalconversionrateall","ga:searchrefinements",
			"ga:searchvisits","ga:serverconnectiontime","ga:serverresponsetime","ga:socialactivities","ga:speedmetricssample",
			"ga:timeonpage","ga:timeonsite","ga:totalevents","ga:totalvalue","ga:transactionrevenue","ga:transactionrevenuepervisit",
			"ga:transactionshipping","ga:transactiontax","ga:transactions","ga:transactionspervisit","ga:uniqueappviews",
			"ga:uniqueevents","ga:uniquepageviews","ga:uniquepurchases","ga:usertimingsample","ga:usertimingvalue","ga:visitbouncerate",
			"ga:visitors","ga:visits","ga:visitswithevent","ga:goal1starts","ga:goal1completions","ga:goal1value","ga:goal1conversionrate",
			"ga:goal1abandons","ga:goal1abandonrate","ga:goal2starts","ga:goal2completions","ga:goal2value","ga:goal2conversionrate",
			"ga:goal2abandons","ga:goal2abandonrate","ga:goal3starts","ga:goal3completions","ga:goal3value","ga:goal3conversionrate",
			"ga:goal3abandons","ga:goal3abandonrate","ga:goal4starts","ga:goal4completions","ga:goal4value","ga:goal4conversionrate",
			"ga:goal4abandons","ga:goal4abandonrate","ga:goal5starts","ga:goal5completions","ga:goal5value","ga:goal5conversionrate",
			"ga:goal5abandons","ga:goal5abandonrate","ga:goal6starts","ga:goal6completions","ga:goal6value","ga:goal6conversionrate",
			"ga:goal6abandons","ga:goal6abandonrate","ga:goal7starts","ga:goal7completions","ga:goal7value","ga:goal7conversionrate",
			"ga:goal7abandons","ga:goal7abandonrate","ga:goal8starts","ga:goal8completions","ga:goal8value","ga:goal8conversionrate",
			"ga:goal8abandons","ga:goal8abandonrate","ga:goal9starts","ga:goal9completions","ga:goal9value","ga:goal9conversionrate",
			"ga:goal9abandons","ga:goal9abandonrate","ga:goalstartsall","ga:goalcompletionsall","ga:goalvalueall","ga:goalvaluepervisit",
			"ga:goalconversionrateall","ga:goalabandonsall","ga:goalabandonrateall"	
			);
	
	function saveGoogleResults($results=null){
		krumo($results);
		DB_DataObject::debugLevel(0);
		foreach ($results->matrix as $row){
			$fact=safe_DataObject_factory($this->__table);
			foreach($row['Dimensions'] as $dimName=>$dimValue){
				$dimName=ucfirst(str_replace("ga:", "", $dimName));
				$fact->$dimName=$dimValue;
			}			$action=($fact->find(true))?"update":"insert";
				
			foreach($row['Metrics'] as $metName=>$metValue){
				$metName=ucfirst(str_replace("ga:", "", $metName));
				$fact->$metName=$metValue;
			}
			$fact->$action();
		}
		//Krumo($fact);		
	}
	
	function optParams($mrgParams=array()){
		$Dims=$this->dimensions();
		if (isset($mrgParams['dimensions'])){
			$Dims=join(",",array_unique(array_merge(split(",",$Dims),split(",",$mrgParams['dimensions']))));
		}
		
		$ret= array(
			'dimensions' => $Dims,
			'max-results' => '1000',		
			'start-index' => 1
		);
		return $ret;
	}
	
	function dimensions(){
		$dims=split(",",join(",ga:",array_keys($this->table())));
		$res=array();
		for ($i=0;$i<count($dims);$i++){
			if (in_array(strtolower($dims[$i]), $this->dims,true))				
				$res[]=$dims[$i];
		}
		if (count($res)==0){
			$dims="ga:date";
		}
		else {
			$dims=join(",",$res);		
			if (strpos(':date',$dims)==0) $dims="ga:date,$dims";
		}
		return $dims;
	}
	
	function metrics(){
		$mets=split(",",join(",ga:",array_keys($this->table())));
		$res=array();
		for ($i=0;$i<count($mets);$i++){
			if (in_array(strtolower($mets[$i]), $this->mets,true))
				$res[]=$mets[$i];
		}
		$mets=join(",",$res);
		return ($mets<>"")?$mets:"ga:visits";
	}
	
}

if (class_exists('gtk',false)) {
	//TODO:any gtk specific code for dbRoot.php goes here
} else {
	//TODO:any web specific code for dbRoot.php goes here
}



//** Eclipse Debug Code **************************
if (strtolower(str_replace("/","\\",__FILE__))==strtolower(str_replace("/","\\",$_SERVER["SCRIPT_FILENAME"]))){
	if (class_exists('gtk',false)) {
		//TODO:any gtk specific code for dbRoot.php goes here
	} else {
		//TODO:any web specific code for dbRoot.php goes here
	}

}
//************************************************
debug_error_log("Exit ".__FILE__);
?>