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
define('DB_DATAOBJECT_ERROR_INSERT_KEY_EXISTS'  ,-8  );  // Called Insert with keys that already exist
define('DB_DATAOBJECT_ERROR_INSERT_NOT_DIRTY'   ,-9  );  // Called Insert with no 'new' data
define('DB_DATAOBJECT_ERROR_UPDATE_NOT_DIRTY'   ,-10 );  // Called Update with no 'new' data
define('DB_DATAOBJECT_ERROR_DUPLICATE_ROWUUID'  ,-11 );  // Called Insert with Duplicate RowUUID
define('DB_DATAOBJECT_ERROR'                    ,-100);  // Error in underlying Code
define('DB_DATAOBJECT_ERROR_OVERRIDE_METHOD'    ,-200);  // Called Update with no 'new' data

//To Flag Loaded State Of Links 
define('DB_DATAOBJECT_NOT_LOADED'  ,12345);  // Not Loaded Yet
define('DB_DATAOBJECT_LOADED'      ,12346);  // Loaded
define('DB_DATAOBJECT_ADDED'       ,12347);  // Added
define('DB_DATAOBJECT_DELETED'     ,12348);  // Needs to Be deleted

$audit['DataObject']=array();

global $dbRoot_dims;
global $dbRoot_mets;
global $dbRoot_mobile;
global $dbRoot_pageLevel;


$dbRoot_dims=array("ga:adcontent","ga:addestinationurl","ga:addisplayurl","ga:date","ga:addistributionnetwork","ga:adformat","ga:adgroup",
		"ga:admatchtype","ga:admatchedquery","ga:adplacementdomain","ga:adplacementurl","ga:adslot","ga:adslotposition",
		"ga:adtargetingoption","ga:adtargetingtype","ga:adwordsadgroupid","ga:adwordscampaignid","ga:adwordscreativeid",
		"ga:adwordscriteriaid","ga:adwordscustomerid","ga:browser","ga:browserversion","ga:campaign",
		"ga:city","ga:continent","ga:country","ga:date","ga:day","ga:dayofweek","ga:dayssincelastvisit",
		"ga:eventaction","ga:eventcategory","ga:eventlabel","ga:exitpagepath","ga:flashversion","ga:hassocialsourcereferral",
		"ga:hostname","ga:hour","ga:ismobile","ga:javaenabled","ga:keyword","ga:landingpagepath","ga:language","ga:latitude",
		"ga:longitude","ga:medium","ga:metro",
		"ga:month","ga:networkdomain","ga:networklocation","ga:nextpagepath","ga:nthday","ga:nthmonth","ga:nthweek","ga:operatingsystem",
		"ga:operatingsystemversion","ga:pagedepth","ga:pagepath","ga:pagetitle","ga:previouspagepath",
		"ga:referralpath","ga:region","ga:screencolors","ga:screenresolution","ga:searchcategory","ga:searchdestinationpage",
		"ga:searchkeyword","ga:searchkeywordrefinement","ga:searchresultviews","ga:searchstartpage","ga:searchuniques","ga:searchused",
		"ga:secondpagepath","ga:socialactivityaction","ga:socialactivitycontenturl","ga:socialactivitydisplayname","ga:socialactivityendorsingurl",
		"ga:socialactivitynetworkaction","ga:socialactivitypost","ga:socialactivitytagssummary","ga:socialactivitytimestamp",
		"ga:socialactivityuserhandle","ga:socialactivityuserphotourl","ga:socialactivityuserprofileurl","ga:socialinteractionaction",
		"ga:socialinteractionnetwork","ga:socialinteractionnetworkaction","ga:socialinteractiontarget","ga:socialinteractions",
		"ga:socialinteractionspervisit","ga:socialnetwork","ga:source","ga:subcontinent","ga:uniquesocialinteractions",
		"ga:userdefinedvalue","ga:usertimingcategory","ga:usertiminglabel","ga:usertimingvariable","ga:visitcount","ga:visitlength",
		"ga:visitortype","ga:week","ga:year",
		"ga:customvarname1","ga:customvarvalue1","ga:customvarname2","ga:customvarvalue2","ga:customvarname3","ga:customvarvalue3",
		"ga:customvarname4","ga:customvarvalue4","ga:customvarname5","ga:customvarvalue5"

		,"ga:productname"
		,"ga:productsku"
		,"ga:productcategory"
		,"ga:daystotransaction"
		,"ga:visitstotransaction"
		,"ga:affiliation"
		,"ga:transactionid"
		,"ga:mobiledevicebranding","ga:mobiledeviceinfo","ga:mobiledevicemodel","ga:mobileinputselector"
	);

$dbRoot_mets=array("ga:cpc","ga:cpm","ga:ctr","ga:roi","ga:rpc","ga:adclicks","ga:adcost","ga:appviews","ga:appviewspervisit",
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
		"ga:goal9abandons","ga:goal9abandonrate","ga:goal10starts","ga:goal10completions","ga:goal10value","ga:goal10conversionrate",
		"ga:goal10abandons","ga:goal10abandonrate","ga:goal11abandons","ga:goal11abandonrate","ga:goal12starts","ga:goal12completions",
		"ga:goal12value","ga:goal12conversionrate",
		"ga:goal12abandons","ga:goal12abandonrate","ga:goal13starts","ga:goal13completions","ga:goal13value","ga:goal13conversionrate",
		"ga:goal13abandons","ga:goal13abandonrate","ga:goal14starts","ga:goal14completions","ga:goal14value","ga:goal14conversionrate",
		"ga:goal14abandons","ga:goal14abandonrate","ga:goal15starts","ga:goal15completions","ga:goal15value","ga:goal15conversionrate",
		"ga:goal15abandons","ga:goal15abandonrate","ga:goal16starts","ga:goal16completions","ga:goal16value","ga:goal16conversionrate",
		"ga:goal16abandons","ga:goal16abandonrate","ga:goal17starts","ga:goal17completions","ga:goal17value","ga:goal17conversionrate",
		"ga:goal17abandons","ga:goal17abandonrate","ga:goal18starts","ga:goal18completions","ga:goal18value","ga:goal18conversionrate",
		"ga:goal18abandons","ga:goal18abandonrate","ga:goal19starts","ga:goal19completions","ga:goal19value","ga:goal19conversionrate",
		"ga:goal19abandons","ga:goal19abandonrate",
		"ga:goal20starts","ga:goal20completions","ga:goal20value","ga:goal20conversionrate",
		"ga:goal20abandons","ga:goal20abandonrate",
		"ga:goalstartsall","ga:goalcompletionsall","ga:goalvalueall","ga:goalvaluepervisit",
		"ga:goalconversionrateall","ga:goalabandonsall","ga:goalabandonrateall",
		"ga:goal"//This is Special!!!	
		);

$dbRoot_mobile=array("ga:ismobile","ga:mobiledevicebranding","ga:mobiledeviceinfo","ga:mobiledevicemodel","ga:mobileinputselector");
$dbRoot_pageLevel=array("ga:pagepathlevel1","ga:pagepathlevel2","ga:pagepathlevel3","ga:pagepathlevel4");

class DB_DataObject_Exception extends PEAR_Exception {};

class dbRoot extends DB_DataObject {
	
	static $f2t=array();
	static $degrees=array();

	protected function logAction($action){
/*	
		global $audit;
		if (!isset($audit['DataObject'][$this->__table]))
			$audit['DataObject'][$this->__table][$action][]=debug_backtrace();//=1;
		else if (!isset($audit['DataObject'][$this->__table][$action])) 
			$audit['DataObject'][$this->__table][$action][]=debug_backtrace();//=1;
		else
			$audit['DataObject'][$this->__table][$action][]=debug_backtrace();//++;
*/			
	}
	
	
	function insert(){
		$this->logAction(__FUNCTION__);
		//krumo($this);
    	$this->filldata();
    	try {
    		$ret=parent::insert();	
    		if (isset($_GET['krumo_full'])) krumo($this);
    		return $ret;
    	}
    	catch (Exception $e){
    		krumo($this);
    		krumo($e);
    		die(__FILE__.":".__LINE__);
    	}
    }
   	 	      
    function update($do=false){
    	$this->filldata();
    	$ret=parent::update($do);
    	if (!($ret===TRUE)) 
    	{
    		$this->logAction(__FUNCTION__);
    		if (isset($_GET['krumo_full'])){
	    		DB_DataObject::debugLevel(5);
				parent::update($do);
				DB_DataObject::debugLevel(0);
    			krumo($do);
				krumo($this);
			}
    	}
		if (isset($_GET['krumo_full'])) krumo($this);
    	return $ret;	
    }
	
	function find($fetch=false){
		$this->logAction(__FUNCTION__);
		return parent::find($fetch);
	}
			
	function fetch(){
		$this->logAction(__FUNCTION__);
		$ret=parent::fetch();
		if (isset($_GET['krumo_full'])) krumo($this);
		return $ret;
	}
	
	function findDimensionID($row){
		//krumo($row);
		foreach($row['Dimensions'] as $dimName=>$dimValue){
			$dimName=ucfirst(str_replace("ga:", "", $dimName));
			$this->$dimName=$dimValue;
		}
		$this->find(true);
		return $this->ID; 
	}
	
	function filldata(){}
	
	protected function getMetrics(){}
	
	function getGoogleKeys($row){
		$keyDims=$this->keyDimensions();
		if (count($keyDims)){
			//Should Only be a dimXXXX table so no Linked Dims to worry about 
			foreach($row['Dimensions'] as $dimName=>$dimValue){
				$dimName="ga:".ucfirst(str_replace("ga:", "", $dimName));
				if (in_array($dimName, $keyDims)){
					$dimName=str_replace("ga:", "", $dimName);
					$this->$dimName=$dimValue;
				}					
			}
			return ($this->find(true))?"update":"insert";
		}
		return "";
	}
	
	function getUnlinkedDimensions($row){
		foreach($row['Dimensions'] as $dimName=>$dimValue){
			$dimName=ucfirst(str_replace("ga:", "", $dimName));
			$this->$dimName=$dimValue;
		}
	}
	
	function getLinkedDimensions($row){
		$extra="";
		foreach (array_keys($this->links()) as $extra){
			if ($extra!="dimProfile" and substr($extra,0,3)=="dim"){
				$doExtra=safe_DataObject_factory($extra);
				$this->$extra=$doExtra->findDimensionID($row);	
			}				
		}		
	}
	
	function saveGoogleResults($results=null){
		print_line("Saving ".$this->__table);
		foreach ($results->matrix as $row){
						
			$fact=safe_DataObject_factory($this->__table);
			$fact->dimProfile=$results->dimProfile;
			//Check if we have something already with our keys			
			$action=$fact->getGoogleKeys($row);
			//Get Un-linked Dimensions
			$fact->getUnlinkedDimensions($row);				
			//Get Linked Dimensions This may be heavy load on DB!
			$extra=$fact->getLinkedDimensions($row);
			
			if ($action=="") $action=($fact->find(true))?"update":"insert";
			
			$old_fact=clone($fact);
			
			$fact->getMetrics($row);
			
			foreach($row['Metrics'] as $metName=>$metValue){
				if (!(strpos(strtolower($metName),"goal")===false)){
					$metName=ucfirst(str_replace("ga:", "", $metName));
					$fact->$metName=$metValue;
					$metName=str_replace(array(1,2,3,4,5,6,7,8,9,0), '', $metName);
				}
				else
					$metName=ucfirst(str_replace("ga:", "", $metName));
				$fact->$metName=$metValue;
			}
			$fact->$action($old_fact);
			/** /
			if($extra!="") {
				krumo($fact);
				krumo($results);
				die(__FILE__.":".__LINE__);
			}
			/**/
			//ob_flush();			flush();
		}
		//Krumo($fact);		
	}
	
	function optParams($mrgParams=array()){
		$Dims=$this->dimensions();
		$filter="";
		foreach ($Dims as $value=>$filterDim){
			if (!is_numeric($value)){
				if ($filter<>"") $filter.=";"; //Need to be ; to be an 'and' in Google Filters
				$filter.="$filterDim==$value";
				unset($Dims[$value]);
			}
		}
		
		if (isset($mrgParams['dimensions'])){
			$Dims=join(",",array_unique(array_merge($Dims,split(",",$mrgParams['dimensions']))));
		}
		else $Dims=join(",",array_unique($Dims));
		
		$ret= array(
			'dimensions' => $Dims,
			'max-results' => '2000',		
			'start-index' => 1,
			//'language'=>'pl'
			
		);
		if ($filter<>"") $ret['filters']=$filter;
		return $ret;
	}
	
	function keyDimensions(){
		return array();
	}
	
	protected function dimensions(){
		global $dbRoot_dims;
		$dims=array_keys($this->table());
		$res=array();
		$extras=array_keys($this->links());
		if (isset($_GET['krumo_full'])) {
			krumo($dims);
			krumo($extras);
			krumo($this->links());
		}
		
		for ($i=0;$i<count($dims);$i++){
			if (in_array(strtolower("ga:".$dims[$i]),$dbRoot_dims,true))				
				$res[]="ga:".$dims[$i];
			else if (substr($dims[$i],0,3)=='dim'){
				if (in_array($dims[$i],$extras)){
					$doExtra=safe_DataObject_factory($dims[$i]);
					$res=array_unique(array_merge($res,$doExtra->keyDimensions()));	
				}
			}
		}
		if (count($res)==0){
			$dims=array("ga:Date");
		}
		else {
			$dims=array_unique(array_merge(array("ga:Date"),$res));
		}
		/**/
		//krumo($dims);
		uasort($dims,'dimCmp');
		//krumo($dims);
		/**/		
		return $dims;
	}
	
	function metrics(){
		global $dbRoot_mets;
		$mets=split(",",join(",ga:",array_keys($this->table())));
		$res=array_intersect(array_map('strtolower',$mets), $dbRoot_mets);
		$mets=join(",",$res);
		return ($mets<>"")?$mets:"ga:visits";
	}

	static function degreesOfFreedom($field){
		if (!isset(dbRoot::$degrees[$field])){
			if ($field=="ga:Date"){
				dbRoot::$degrees[$field]=1;
			}
			else {
				global $db;
				$table=dbRoot::fieldInTable($field);
				//print_line("$field in $table");
				if ($field=='ga:Goal')
					$sql="select count(*) from $table";
				else
					$sql="select count(distinct ".str_replace("ga:","", $field).") from $table";
				$res=$db->query($sql);
				dbRoot::$degrees[$field]=$res->fetchOne();
			}
		}
		return dbRoot::$degrees[$field];							
	}	
	
	static function fieldInTable($find){
		if (count(dbRoot::$f2t)==0){
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$ini=buildpath($opts['schema_location'],safe_DataObject_factory("dimDate")->database().'.ini');
			$config = parse_ini_file($ini,true);
			//krumo($config);
			dbRoot::$f2t['ga:goal']='dimGoal';
			foreach($config as $table=>$fields){
				if (strpos($table,"__keys")==0)
					foreach(array_keys($fields) as $field){
						dbRoot::$f2t['ga:'.strtolower($field)]=$table;
					}
			}
			//krumo(dbRoot::$f2t);
		}
		return dbRoot::$f2t[strtolower($find)];
	}
}

/*
 * This function Grabs the number of Degrees of freedom (AKA Number of Distinct Occurnces) of
 * the fields listed in the Array and then orders them in assending order.
 * 
 * The upshot of this is that when there are more than 7 dimensions the first call will return
 * the smallest number of rows to be turned into filters and so the full results can be returned
 * in as few calls to google analytics as possible.
 */
function dimCmp($a, $b)
{
		
	$freedom_a=dbRoot::degreesOfFreedom($a);
	$freedom_b=dbRoot::degreesOfFreedom($b);
	
	//print_line("Comparing $a to $b ($freedom_a : $freedom_b)");
	
    if ($freedom_a == $freedom_b) {
        return 0;
    }
    return ($freedom_a < $freedom_b) ? -1 : 1;
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