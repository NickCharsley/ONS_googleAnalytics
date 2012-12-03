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

$accounts = $service->management_accounts->listManagementAccounts();
$profileIds=array();
$accountIds=googleHelper::getAllIDs($accounts);

foreach($accountIds as $accountId){
	$webproperties = $service->management_webproperties->listManagementWebproperties($accountId);
	$webpropertyIds = googleHelper::getAllIDs($webproperties);
	foreach($webpropertyIds as $webpropertyId){
		$profiles = $service->management_profiles->listManagementProfiles($accountId,$webpropertyId);
		if ($profiles->items[0]->name=='Poland')			
			$profileIds = array_merge($profileIds,googleHelper::getAllIDs($profiles));
	}
}

$optParams = array(
		'dimensions' => "ga:hour,ga:visitCount,ga:visitorType,ga:keyword,ga:landingPagePath,ga:latitude,ga:longitude",
		'max-results' => '1000',
		'start-index' => 1,
		);

//$metrics[]="ga:impressions,ga:adClicks,ga:adCost,ga:CPM,ga:CPC";
//$metrics[]="ga:CTR";
//$metrics[]="ga:costPerTransaction";
//$metrics[]="ga:costPerGoalConversion";
//$metrics[]="ga:costPerConversion";
//$metrics[]="ga:socialActivities";
//$metrics[]="ga:exceptions";
//$metrics[]="ga:fatalExceptions";


$metrics[]="ga:visits,ga:bounces,ga:userTimingValue,ga:userTimingSample,ga:avgUserTimingValue,ga:visitors,ga:newVisits,ga:percentNewVisits,ga:entranceBounceRate,ga:visitBounceRate,ga:timeOnSite,ga:avgTimeOnSite,ga:organicSearches";
$metrics[]="ga:RPC,ga:ROI,ga:margin,ga:entrances,ga:entranceRate,ga:pageviews,ga:pageviewsPerVisit,ga:uniquePageviews,ga:timeOnPage,ga:avgTimeOnPage";
$metrics[]="ga:exits,ga:exitRate,ga:searchResultViews,ga:searchUniques,ga:avgSearchResultViews,ga:searchVisits,ga:percentVisitsWithSearch,ga:searchDepth,ga:avgSearchDepth";
$metrics[]="ga:searchRefinements,ga:searchDuration,ga:avgSearchDuration,ga:searchExits,ga:searchExitRate";
$metrics[]="ga:pageLoadTime,ga:pageLoadSample,ga:avgPageLoadTime,ga:domainLookupTime,ga:avgDomainLookupTime,ga:pageDownloadTime,ga:avgPageDownloadTime,ga:redirectionTime,ga:avgRedirectionTime,ga:serverConnectionTime";
$metrics[]="ga:avgServerConnectionTime,ga:serverResponseTime,ga:avgServerResponseTime,ga:speedMetricsSample,ga:appviews,ga:uniqueAppviews,ga:appviewsPerVisit";
$metrics[]="ga:avgEventValue,ga:visitsWithEvent,ga:eventsPerVisitWithEvent,ga:transactions,ga:transactionsPerVisit,ga:transactionRevenue,ga:revenuePerTransaction,ga:transactionRevenuePerVisit,ga:transactionShipping,ga:transactionTax";
$metrics[]="ga:totalValue,ga:itemQuantity,ga:uniquePurchases,ga:revenuePerItem,ga:itemRevenue,ga:itemsPerPurchase,ga:socialInteractions,ga:uniqueSocialInteractions,ga:socialInteractionsPerVisit";

for ($goal=1;$goal<=2;$goal++){
	$metrics[]="ga:goal{$goal}Starts,ga:goal{$goal}Completions,ga:goal{$goal}Value,ga:goal{$goal}ConversionRate,ga:goal{$goal}Abandons,ga:goal{$goal}AbandonRate,ga:searchGoal{$goal}ConversionRate";	
}
$metrics[]="ga:goalStartsAll,ga:goalCompletionsAll,ga:goalValueAll,ga:goalValuePerVisit,ga:goalConversionRateAll,ga:goalAbandonsAll,ga:goalAbandonRateAll,ga:searchGoalConversionRateAll,ga:goalValueAllPerSearch";
$metrics[]="ga:totalEvents,ga:uniqueEvents,ga:eventValue";

$date="2012-11-01";
$results=new googleResultsWrapper();

foreach($metrics as $metric){
	try {
	//$results->mergeResults(googleHelper::getResults($date,$service,$profileIds[0],$optParams,$metric));
	$results=googleHelper::getResults($date,$service,$profileIds[0],$optParams,$metric);
	krumo($results);
	} catch (Exception $e) {
    	$error=$e->getMessage();
    	print_line("$metric: $error");
	}
}

krumo($results);
//print $results->getRowsTable();

/*
$test=safe_DataObject_factory('t_Testmetric');
print_line("Vaild tests ".$test->find());
$test->whereAdd("id in (268,269)");
while ($test->fetch()){
	$results->mergeResults($test->doTest($date,$service,$profileIds[0],"ga:hour"));
}

print "<hr/>";

print $results->getRowsTable();
*/
if ($client->getAccessToken()) {
  $_SESSION['token'] = $client->getAccessToken();
}