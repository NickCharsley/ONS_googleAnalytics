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
	$profileIds=array();
	$accountIds=googleHelper::getAllIDs($accounts);
	
	foreach($accountIds as $accountId){
		$webproperties = $service->management_webproperties->listManagementWebproperties($accountId);
		$webpropertyIds = googleHelper::getAllIDs($webproperties);
		foreach($webpropertyIds as $webpropertyId){
			$profiles = $service->management_profiles->listManagementProfiles($accountId,$webpropertyId);
			$profileIds = array_merge($profileIds,googleHelper::getAllIDs($profiles));
		}
	}

	//print_pre($profileIds);
	//die;
	
	//Update Historic Failures
	  
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
