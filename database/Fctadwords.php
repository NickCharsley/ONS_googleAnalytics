<?php
/**
 * Table Definition for fctadwords
 */
require_once 'dbRoot.php';

class doFctadwords extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctadwords';          // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Date;                            // int(4)  
    public $Hour;                            // varchar(45)  
    public $AdGroup;                         // varchar(45)  
    public $AdDistributionNetwork;           // varchar(45)  
    public $AdMatchType;                     // varchar(45)  
    public $AdDestinationUrl;                // varchar(2048)  
    public $AdwordsCustomerID;               // varchar(45)  
    public $AdwordsCampaignID;               // varchar(45)  
    public $AdwordsAdGroupID;                // varchar(45)  
    public $AdwordsCreativeID;               // varchar(45)  
    public $AdwordsCriteriaID;               // varchar(45)  
    public $Impressions;                     // varchar(45)  
    public $AdClicks;                        // varchar(45)  
    public $AdCost;                          // varchar(45)  
    public $CPM;                             // varchar(45)  
    public $CPC;                             // varchar(45)  
    public $CTR;                             // varchar(45)  
    public $CostPerTransaction;              // varchar(45)  
    public $CostPerGoalConversion;           // varchar(45)  
    public $CostPerConversion;               // varchar(45)  
    public $RPC;                             // varchar(45)  
    public $ROI;                             // varchar(45)  
    public $Margin;                          // varchar(45)  
    public $Goal1Starts;                     // varchar(45)  
    public $Goal1Completions;                // varchar(45)  
    public $Goal1Value;                      // varchar(45)  
    public $Goal1ConversionRate;             // varchar(45)  
    public $Goal1Abandons;                   // varchar(45)  
    public $Goal1AbandonRate;                // varchar(45)  
    public $Goal2Starts;                     // varchar(45)  
    public $Goal2Completions;                // varchar(45)  
    public $Goal2Value;                      // varchar(45)  
    public $Goal2ConversionRate;             // varchar(45)  
    public $Goal2Abandons;                   // varchar(45)  
    public $Goal2AbandonRate;                // varchar(45)  
    public $Goal3Starts;                     // varchar(45)  
    public $Goal3Completions;                // varchar(45)  
    public $Goal3Value;                      // varchar(45)  
    public $Goal3ConversionRate;             // varchar(45)  
    public $Goal3Abandons;                   // varchar(45)  
    public $Goal3AbandonRate;                // varchar(45)  
    public $GoalStartsAll;                   // varchar(45)  
    public $GoalCompletionsAll;              // varchar(45)  
    public $GoalValueAll;                    // varchar(45)  
    public $GoalValuePerVisit;               // varchar(45)  
    public $GoalConversionRateAll;           // varchar(45)  
    public $GoalAbandonsAll;                 // varchar(45)  
    public $GoalAbandonRateAll;              // varchar(45)  
    public $NewVisits;                       // varchar(45)  
    public $PercentNewVisits;                // varchar(45)  
    public $Visits;                          // varchar(45)  
    public $Bounces;                         // varchar(45)  
    public $EntranceBounceRate;              // varchar(45)  
    public $VisitBounceRate;                 // varchar(45)  
    public $TimeOnSite;                      // varchar(45)  
    public $AvgTimeOnSite;                   // varchar(45)  
    public $OrganicSearches;                 // varchar(45)  
    public $Entrances;                       // varchar(45)  
    public $EntranceRate;                    // varchar(45)  
    public $Pageviews;                       // varchar(45)  
    public $PageviewsPerVisit;               // varchar(45)  
    public $UniquePageviews;                 // varchar(45)  
    public $TimeOnPage;                      // varchar(45)  
    public $AvgTimeOnPage;                   // varchar(45)  
    public $Exits;                           // varchar(45)  
    public $ExitRate;                        // varchar(45)  
    public $PageLoadTime;                    // varchar(45)  
    public $PageLoadSample;                  // varchar(45)  
    public $AvgPageLoadTime;                 // varchar(45)  
    public $DomainLookupTime;                // varchar(45)  
    public $AvgDomainLookupTime;             // varchar(45)  
    public $PageDownloadTime;                // varchar(45)  
    public $AvgPageDownloadTime;             // varchar(45)  
    public $RedirectionTime;                 // varchar(45)  
    public $AvgRedirectionTime;              // varchar(45)  
    public $ServerConnectionTime;            // varchar(45)  
    public $AvgServerConnectionTime;         // varchar(45)  
    public $ServerResponseTime;              // varchar(45)  
    public $AvgServerResponseTime;           // varchar(45)  
    public $SpeedMetricsSample;              // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctadwords',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE

    function dimensions(){
    	return "ga:date,ga:adwordsCustomerID,ga:adDistributionNetwork,ga:adMatchType,ga:adwordsCampaignID,ga:adGroup,ga:adwordsAdGroupID"
    		/*	.",ga:adwordsCriteriaID,ga:adwordsCreativeID,ga:adDestinationUrl"
    	/**/;
    }
   /** / 
    function metrics(){
    	return = "ga:impressions,ga:adClicks,ga:adCost,ga:CPM,ga:CPC,ga:CTR,ga:costPerTransaction,ga:costPerGoalConversion,ga:costPerConversion,ga:RPC,"
				."ga:ROI,ga:margin,ga:goal1Starts,ga:goal1Completions,ga:goal1Value,ga:goal1ConversionRate,ga:goal1Abandons,ga:goal1AbandonRate,ga:goal2Starts,ga:goal2Completions,"
				."ga:goal2Value,ga:goal2ConversionRate,ga:goal2Abandons,ga:goal2AbandonRate,ga:goal3Starts,ga:goal3Completions,ga:goal3Value,ga:goal3ConversionRate,ga:goal3Abandons,ga:goal3AbandonRate,"
				."ga:goalStartsAll,ga:goalCompletionsAll,ga:goalValueAll,ga:goalValuePerVisit,ga:goalConversionRateAll,ga:goalAbandonsAll,ga:goalAbandonRateAll,ga:newVisits,ga:percentNewVisits,ga:visits,"
				."ga:bounces,ga:entranceBounceRate,ga:visitBounceRate,ga:timeOnSite,ga:avgTimeOnSite,ga:organicSearches,ga:entrances,ga:entranceRate,ga:pageviews,ga:pageviewsPerVisit,"
				."ga:uniquePageviews,ga:timeOnPage,ga:avgTimeOnPage,ga:exits,ga:exitRate,ga:pageLoadTime,ga:pageLoadSample,ga:avgPageLoadTime,ga:domainLookupTime,ga:avgDomainLookupTime,"
				."ga:pageDownloadTime,ga:avgPageDownloadTime,ga:redirectionTime,ga:avgRedirectionTime,ga:serverConnectionTime,ga:avgServerConnectionTime,ga:serverResponseTime,ga:avgServerResponseTime,ga:speedMetricsSample";
    }/**/
}
?>