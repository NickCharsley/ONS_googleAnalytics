<?php
/*
 * Copyright 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

include_once("ons_common.php");

require_once 'Google_Client.php';
require_once 'storage.php';
require_once 'authHelper.php';

// Set your client id, service account name, and the path to your private key.
// For more information about obtaining these keys, visit:
// https://developers.google.com/console/help/#service_accounts
const CLIENT_ID = '940966921181.apps.googleusercontent.com';
const SERVICE_ACCOUNT_NAME = '940966921181@developer.gserviceaccount.com';

// Make sure you keep your key.p12 file in a secure location, and isn't
// readable by others.
define('KEY_FILE',buildpath(dirname(__FILE__),'Data','6368006f26fe7ffd9ed89d98ccfc7cd277417177-privatekey.p12'));

define('THIS_PAGE',basename(__FILE__));

const APP_NAME='Google Analytics Sample Application';
const ANALYTICS_SCOPE='https://www.googleapis.com/auth/analytics.readonly';

$client = new Google_Client();
$client->setApplicationName(APP_NAME);

// Set your cached access token. Remember to replace $_SESSION with a
// real database or memcached.
if (isset($_SESSION['token'])) {
 $client->setAccessToken($_SESSION['token']);
}

// Load the key in PKCS 12 format (you need to download this from the
// Google API Console when the service account was created.
$key = file_get_contents(KEY_FILE);
$client->setAssertionCredentials(new Google_AssertionCredentials(
    SERVICE_ACCOUNT_NAME,
    ANALYTICS_SCOPE,
    $key)
);
$client->setUseObjects(true);
$client->setClientId(CLIENT_ID);

$service = new Google_AnalyticsService($client);

/*Get all Profiles Visible to the Service Account* /
$accounts = $service->management_accounts->listManagementAccounts();
$profileIds=array();
$accountIds=googleHelper::getAllIDs($accounts);
 
$doProfile=safe_DataObject_factory("dimProfile");

foreach($accountIds as $accountId){
	$webproperties = $service->management_webproperties->listManagementWebproperties($accountId);
	$webpropertyIds = googleHelper::getAllIDs($webproperties);
	foreach($webpropertyIds as $webpropertyId){
		$profiles = $service->management_profiles->listManagementProfiles($accountId,$webpropertyId);
		$profileIds = array_merge($profileIds,googleHelper::getAllIDs($profiles));		
		$doProfile->saveGoogleResults($profiles);		
	}
}
/** /
print_pre($_COOKIE);

/** /
$vp=new Vanquis($client,$service,55368687);
$vp->testMCF();
/** /
$vl=new Vanquis($client,$service, 61943476);
$vl->testMCF();
/**/
$nick=new Vanquis($client,$service,42506344);//42209706);
$nick->testMCF();

/**/
if ($client->getAccessToken()) {
  $_SESSION['token'] = $client->getAccessToken();
}


pageTime();
?>