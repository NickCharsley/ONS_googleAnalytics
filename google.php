<?php
/*
 * Created on 10 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 include_once 'ons_common.php';

require_once 'Google_Client.php';
require_once 'storage.php';
require_once 'authHelper.php';

define('REDIRECT_URL', 'http://localhost/analytics/google.php');
define('CLIENT_ID', '940966921181-7scofodua6gtd54taobjikelhifdr074.apps.googleusercontent.com');
define('CLIENT_SECRET', 'i7yq7EyIwCB7S-OAVuYFLISV');

// The file name of this page. Used to create various query parameters to
// control script execution.
define('THIS_PAGE',basename(__FILE__));

define('APP_NAME', 'Google Analytics Sample Application');
define('ANALYTICS_SCOPE','https://www.googleapis.com/auth/analytics.readonly');

$authUrl = THIS_PAGE . '?action=auth';
$revokeUrl = THIS_PAGE . '?action=revoke';
 
 // Build a new client object to work with authorization.
$client = new Google_Client();
$client->setClientId(CLIENT_ID);
$client->setClientSecret(CLIENT_SECRET);
$client->setRedirectUri(REDIRECT_URL);
$client->setApplicationName(APP_NAME);
$client->setScopes(
    array(ANALYTICS_SCOPE));

// Magic. Returns objects from the Analytics Service
// instead of associative arrays.
$client->setUseObjects(true);


// Build a new storage object to handle and store tokens in sessions.
// Create a new storage object to persist the tokens across sessions.
$storage = new apiSessionStorage();

$authHelper = new AuthHelper($client, $storage, THIS_PAGE);

function printArray($array){
	$ret="";
	foreach($array as $item){
		if ($ret!="") $ret.=", ";
		$ret.=$item;
	}
	return $ret;
}

function getData($service,$profile,$dimensions){
		$dims=join(',ga:',$dimensions);
	
	  $optParams = array(
      'dimensions' => "ga:$dims",
      'max-results' => '1');
	try {
		$results=$service->data_ga->get("ga:$profile",'2012-01-01','2012-10-10','ga:visits',$optParams);
		return $results->totalResults;
	} catch (Exception $e) { 
		$error=$e->getMessage();
		if (!(strpos($error,"Invalid request: selected dimensions and metrics cannot be queried together.")===false)) return -1000;
		print_line("Caught exception: $error" );
		die;		
 	}	
}

$fn_todo=buildPath(dirname(__FILE__),'Data',"todo.json");
$fn_done=buildPath(dirname(__FILE__),'Data',"done.json");
$fn_fail=buildPath(dirname(__FILE__),'Data',"fail.json");

$todo=json_decode(file_get_contents($fn_todo),true);
$done=json_decode(file_get_contents($fn_done),true);
$fail=json_decode(file_get_contents($fn_fail),true);

if (/**/true/** /false/**/){
	$tomerge=array();
	foreach($done as $rows)
		foreach($rows as $values)
		{
			asort($values);
			if (!in_array($tomerge,$values))
				$tomerge[]=$values;
		}
		
	for ($i=1;$i<count($tomerge);$i++){
		for ($j=0;$j<$i;$j++)
		{
			$new=array_unique(array_merge($tomerge[$i],$tomerge[$j]));
			sort($new);
			if (!in_array($fail,$new)){
				$size=count($new);
				if (!in_array($todo[$size],$new))
					$todo[$size][]=$new;
			}
			$bytes=file_put_contents($fn_todo,json_encode($todo));
		}
		print_line("Saved File $fn_todo ($bytes)");
	}		
	krumo($todo);			
	die;

	
}



// Main controller logic.

if (pg_value('action') == 'revoke') {
  $authHelper->revokeToken();

} else if (pg_value('action') == 'auth' || pg_value('code')) {
  $authHelper->authenticate();

} else {
  $authHelper->setTokenFromStorage();

  if ($authHelper->isAuthorized()) {
    $service = new Google_AnalyticsService($client);
 
	$accounts = $service->management_accounts->listManagementAccounts();
	//Just take 1st Account :)
	$firstAccountId=googleHelper::getFirstID($accounts);
	$webproperties = $service->management_webproperties->listManagementWebproperties($firstAccountId);
	$firstWebpropertyId = googleHelper::getFirstId($webproperties);
	$profiles = $service->management_profiles->listManagementProfiles($firstAccountId,$firstWebpropertyId);
	$firstProfileId = googleHelper::getFirstId($profiles);

	
		
		
	$time=0;	
	foreach ($todo as $level=>$test){
		foreach ($test as $key=>$value){
			//if (time()<$time) sleep(1);
			$time++;	
			$rows=getData($service,$firstProfileId,$value);
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
			if ($time>100) die;						
		}
	}	  
	  
  }
  
  // The PHP library will try to update the access token
  // (via the refresh token) when an API request is made.
  // So the actual token in apiClient can be different after
  // a require through Google_AnalyticsService is made. Here we
  // make sure whatever the valid token in $service is also
  // persisted into storage.
  $storage->set($client->getAccessToken());
  
}

  // Print out authorization URL.
  if ($authHelper->isAuthorized()) {
    print "<p><a href='$revokeUrl'>Revoke access</a></p>";
  } else {
    print "<p><a href='$authUrl'>Grant access to Google Analytics data</a></p>";
  }

?>
