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
define('KEY_FILE',buildpath('C:','Users','nick','workspace','googleAnalytics','Data','6368006f26fe7ffd9ed89d98ccfc7cd277417177-privatekey.p12'));

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



/*
$accounts = $service->management_accounts->listManagementAccounts();
//Just take 1st Account :)
$firstAccountId=googleHelper::getFirstID($accounts);
$webproperties = $service->management_webproperties->listManagementWebproperties($firstAccountId);
$firstWebpropertyId = googleHelper::getFirstId($webproperties);
$profiles = $service->management_profiles->listManagementProfiles($firstAccountId,$firstWebpropertyId);
$firstProfileId = googleHelper::getFirstId($profiles);

$test=safe_DataObject_factory('t_Tests');
$test->valid=0;
$test->find();
while ($test->fetch()){
	$test->doTest($service,$firstProfileId);
}*/

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

$test=safe_DataObject_factory('t_Testdimension');
$test->valid=0;
$test->whereAdd('id in (select id from t_all where level=4 and valid=0 and (    (d1id= 71 or d2id= 71 or d3id= 71 or d4id= 71) and (d1id= 72 or d2id= 72 or d3id= 72 or d4id= 72) and ((d1id=110 or d2id=110 or d3id=110 or d4id=110) or (d1id=115 or d2id=115 or d3id=110 or d4id=115)) ))');
print_line("Vaild tests ".$test->find());
/**/
$i=0;
while ($test->fetch()){
	$test->doTest($service,$profileIds[$i++]);
	if ($i>=count($profileIds)) $i=0;
}
/**/



if ($client->getAccessToken()) {
  $_SESSION['token'] = $client->getAccessToken();
}