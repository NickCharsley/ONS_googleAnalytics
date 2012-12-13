-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2012 at 11:03 AM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.7

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `workcommer`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimadwords`
--

DROP TABLE IF EXISTS `dimadwords`;
CREATE TABLE IF NOT EXISTS "dimadwords" (
  "ID" int(11) NOT NULL,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdSlot" varchar(45) DEFAULT NULL,
  "AdSlotPosition" varchar(45) DEFAULT NULL,
  "AdDistributionNetwork" varchar(45) DEFAULT NULL,
  "AdMatchType" varchar(45) DEFAULT NULL,
  "AdMatchedQuery" varchar(45) DEFAULT NULL,
  "AdPlacementDomain" varchar(45) DEFAULT NULL,
  "AdPlacementUrl" varchar(2048) DEFAULT NULL,
  "AdFormat" varchar(45) DEFAULT NULL,
  "AdTargetingType" varchar(45) DEFAULT NULL,
  "AdTargetingOption" varchar(45) DEFAULT NULL,
  "AdDisplayUrl" varchar(2048) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  "AdwordsCustomerID" varchar(45) DEFAULT NULL,
  "AdwordsCampaignID" varchar(45) DEFAULT NULL,
  "AdwordsAdGroupID" varchar(45) DEFAULT NULL,
  "AdwordsCreativeID" varchar(45) DEFAULT NULL,
  "AdwordsCriteriaID" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=298 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimdate`
--

DROP TABLE IF EXISTS `dimdate`;
CREATE TABLE IF NOT EXISTS "dimdate" (
  "ID" int(11) NOT NULL,
  "Date" date DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  "Year" char(4) DEFAULT NULL,
  "Month" char(2) DEFAULT NULL,
  "Week" char(2) DEFAULT NULL,
  "Day" char(2) DEFAULT NULL,
  "DayOfWeek" char(2) DEFAULT NULL,
  "MonthName" varchar(15) DEFAULT NULL,
  "DayOfWeekName" varchar(15) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "Date_UNIQUE" ("Date")
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimexitpagepath`
--
DROP VIEW IF EXISTS `dimexitpagepath`;
CREATE TABLE IF NOT EXISTS `dimexitpagepath` (
`ID` int(11)
,`ExitPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimgeo`
--

DROP TABLE IF EXISTS `dimgeo`;
CREATE TABLE IF NOT EXISTS "dimgeo" (
  "ID" int(11) NOT NULL,
  "Latitude" decimal(9,6) NOT NULL,
  "Longitude" decimal(9,6) NOT NULL,
  "City" varchar(45) NOT NULL,
  "Country" varchar(45) NOT NULL,
  "Continent" varchar(45) NOT NULL,
  "SubContinent" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "dimGeo_indx" ("Latitude","Longitude","City","Country")
) AUTO_INCREMENT=237 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimhostname`
--

DROP TABLE IF EXISTS `dimhostname`;
CREATE TABLE IF NOT EXISTS "dimhostname" (
  "ID" int(11) NOT NULL,
  "Hostname" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimHostName" ("Hostname")
) AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimlandingpagepath`
--
DROP VIEW IF EXISTS `dimlandingpagepath`;
CREATE TABLE IF NOT EXISTS `dimlandingpagepath` (
`ID` int(11)
,`LandingPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimnetwork`
--

DROP TABLE IF EXISTS `dimnetwork`;
CREATE TABLE IF NOT EXISTS "dimnetwork" (
  "ID" int(11) NOT NULL,
  "NetworkDomain" varchar(45) NOT NULL,
  "NetworkLocation" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimNetwork" ("NetworkDomain","NetworkLocation")
) AUTO_INCREMENT=258 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimpagepath`
--

DROP TABLE IF EXISTS `dimpagepath`;
CREATE TABLE IF NOT EXISTS "dimpagepath" (
  "ID" int(11) NOT NULL,
  "PagePath" varchar(4096) NOT NULL,
  "PageType" varchar(45) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=657 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimpagetracking`
--

DROP TABLE IF EXISTS `dimpagetracking`;
CREATE TABLE IF NOT EXISTS "dimpagetracking" (
  "ID" int(11) NOT NULL,
  "Hostname" varchar(45) NOT NULL,
  "PagePath" varchar(45) NOT NULL,
  "LandingPagePath" varchar(45) NOT NULL,
  "SecondPagePath" varchar(45) NOT NULL,
  "ExitPagePath" varchar(45) NOT NULL,
  "PreviousPagePath" varchar(45) NOT NULL,
  "NextPagePath" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimPageTracking" ("Hostname","PagePath","LandingPagePath","SecondPagePath","ExitPagePath","PreviousPagePath","NextPagePath")
) AUTO_INCREMENT=62 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimplatform`
--

DROP TABLE IF EXISTS `dimplatform`;
CREATE TABLE IF NOT EXISTS "dimplatform" (
  "ID" int(11) NOT NULL,
  "Browser" varchar(45) NOT NULL,
  "BrowserVersion" varchar(45) NOT NULL,
  "OperatingSystem" varchar(45) NOT NULL,
  "OperatingSystemVersion" varchar(45) NOT NULL,
  "IsMobile" varchar(45) NOT NULL,
  "MobileDeviceBranding" varchar(45) NOT NULL,
  "MobileDeviceModel" varchar(45) NOT NULL,
  "MobileInputSelector" varchar(45) NOT NULL,
  "MobileDeviceInfo" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimprofile`
--

DROP TABLE IF EXISTS `dimprofile`;
CREATE TABLE IF NOT EXISTS "dimprofile" (
  "ID" int(11) NOT NULL,
  "ProfileName" varchar(45) NOT NULL DEFAULT 'Unknown',
  "WebPropertyID" varchar(45) NOT NULL,
  "Currency" varchar(45) NOT NULL,
  "WebsiteURL" varchar(45) NOT NULL,
  "Type" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
);

-- --------------------------------------------------------

--
-- Table structure for table `dimsession`
--

DROP TABLE IF EXISTS `dimsession`;
CREATE TABLE IF NOT EXISTS "dimsession" (
  "ID" int(11) NOT NULL,
  "VisitLength" int(11) NOT NULL,
  PRIMARY KEY ("ID")
);

-- --------------------------------------------------------

--
-- Table structure for table `dimsocialtraffic`
--

DROP TABLE IF EXISTS `dimsocialtraffic`;
CREATE TABLE IF NOT EXISTS "dimsocialtraffic" (
  "ID" int(11) NOT NULL,
  "SocialNetwork" varchar(45) DEFAULT NULL,
  "HasSocialSourceReferral" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimsystem`
--

DROP TABLE IF EXISTS `dimsystem`;
CREATE TABLE IF NOT EXISTS "dimsystem" (
  "ID" int(11) NOT NULL,
  "FlashVersion" varchar(45) NOT NULL,
  "JavaEnabled" varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  "ScreenColors" varchar(45) NOT NULL,
  "ScreenResolution" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimSystem" ("FlashVersion","JavaEnabled","Language","ScreenColors","ScreenResolution")
) AUTO_INCREMENT=107 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimtraffic`
--

DROP TABLE IF EXISTS `dimtraffic`;
CREATE TABLE IF NOT EXISTS "dimtraffic" (
  "ID" int(11) NOT NULL,
  "ReferralPath" varchar(45) DEFAULT NULL,
  "Campaign" varchar(45) DEFAULT NULL,
  "Source" varchar(45) DEFAULT NULL,
  "Medium" varchar(45) DEFAULT NULL,
  "Keyword" varchar(45) DEFAULT NULL,
  "AdContent" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimTraffic" ("ReferralPath","Campaign","Source","Medium","Keyword","AdContent")
) AUTO_INCREMENT=226 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimvisitor`
--

DROP TABLE IF EXISTS `dimvisitor`;
CREATE TABLE IF NOT EXISTS "dimvisitor" (
  "ID" int(11) NOT NULL,
  "VisitCount" int(11) DEFAULT NULL,
  "VisitorType" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_VisitCount" ("VisitCount")
);

-- --------------------------------------------------------

--
-- Table structure for table `fctadwords`
--

DROP TABLE IF EXISTS `fctadwords`;
CREATE TABLE IF NOT EXISTS "fctadwords" (
  "ID" int(11) NOT NULL,
  "Date" int(11) DEFAULT NULL,
  "Hour" varchar(45) DEFAULT NULL,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdDistributionNetwork" varchar(45) DEFAULT NULL,
  "AdMatchType" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  "AdwordsCustomerID" varchar(45) DEFAULT NULL,
  "AdwordsCampaignID" varchar(45) DEFAULT NULL,
  "AdwordsAdGroupID" varchar(45) DEFAULT NULL,
  "AdwordsCreativeID" varchar(45) DEFAULT NULL,
  "AdwordsCriteriaID" varchar(45) DEFAULT NULL,
  "Impressions" varchar(45) DEFAULT NULL,
  "AdClicks" varchar(45) DEFAULT NULL,
  "AdCost" varchar(45) DEFAULT NULL,
  "CPM" varchar(45) DEFAULT NULL,
  "CPC" varchar(45) DEFAULT NULL,
  "CTR" varchar(45) DEFAULT NULL,
  "CostPerTransaction" varchar(45) DEFAULT NULL,
  "CostPerGoalConversion" varchar(45) DEFAULT NULL,
  "CostPerConversion" varchar(45) DEFAULT NULL,
  "RPC" varchar(45) DEFAULT NULL,
  "ROI" varchar(45) DEFAULT NULL,
  "Margin" varchar(45) DEFAULT NULL,
  "Goal1Starts" varchar(45) DEFAULT NULL,
  "Goal1Completions" varchar(45) DEFAULT NULL,
  "Goal1Value" varchar(45) DEFAULT NULL,
  "Goal1ConversionRate" varchar(45) DEFAULT NULL,
  "Goal1Abandons" varchar(45) DEFAULT NULL,
  "Goal1AbandonRate" varchar(45) DEFAULT NULL,
  "Goal2Starts" varchar(45) DEFAULT NULL,
  "Goal2Completions" varchar(45) DEFAULT NULL,
  "Goal2Value" varchar(45) DEFAULT NULL,
  "Goal2ConversionRate" varchar(45) DEFAULT NULL,
  "Goal2Abandons" varchar(45) DEFAULT NULL,
  "Goal2AbandonRate" varchar(45) DEFAULT NULL,
  "Goal3Starts" varchar(45) DEFAULT NULL,
  "Goal3Completions" varchar(45) DEFAULT NULL,
  "Goal3Value" varchar(45) DEFAULT NULL,
  "Goal3ConversionRate" varchar(45) DEFAULT NULL,
  "Goal3Abandons" varchar(45) DEFAULT NULL,
  "Goal3AbandonRate" varchar(45) DEFAULT NULL,
  "GoalStartsAll" varchar(45) DEFAULT NULL,
  "GoalCompletionsAll" varchar(45) DEFAULT NULL,
  "GoalValueAll" varchar(45) DEFAULT NULL,
  "GoalValuePerVisit" varchar(45) DEFAULT NULL,
  "GoalConversionRateAll" varchar(45) DEFAULT NULL,
  "GoalAbandonsAll" varchar(45) DEFAULT NULL,
  "GoalAbandonRateAll" varchar(45) DEFAULT NULL,
  "NewVisits" varchar(45) DEFAULT NULL,
  "PercentNewVisits" varchar(45) DEFAULT NULL,
  "Visits" varchar(45) DEFAULT NULL,
  "Bounces" varchar(45) DEFAULT NULL,
  "EntranceBounceRate" varchar(45) DEFAULT NULL,
  "VisitBounceRate" varchar(45) DEFAULT NULL,
  "TimeOnSite" varchar(45) DEFAULT NULL,
  "AvgTimeOnSite" varchar(45) DEFAULT NULL,
  "OrganicSearches" varchar(45) DEFAULT NULL,
  "Entrances" varchar(45) DEFAULT NULL,
  "EntranceRate" varchar(45) DEFAULT NULL,
  "Pageviews" varchar(45) DEFAULT NULL,
  "PageviewsPerVisit" varchar(45) DEFAULT NULL,
  "UniquePageviews" varchar(45) DEFAULT NULL,
  "TimeOnPage" varchar(45) DEFAULT NULL,
  "AvgTimeOnPage" varchar(45) DEFAULT NULL,
  "Exits" varchar(45) DEFAULT NULL,
  "ExitRate" varchar(45) DEFAULT NULL,
  "PageLoadTime" varchar(45) DEFAULT NULL,
  "PageLoadSample" varchar(45) DEFAULT NULL,
  "AvgPageLoadTime" varchar(45) DEFAULT NULL,
  "DomainLookupTime" varchar(45) DEFAULT NULL,
  "AvgDomainLookupTime" varchar(45) DEFAULT NULL,
  "PageDownloadTime" varchar(45) DEFAULT NULL,
  "AvgPageDownloadTime" varchar(45) DEFAULT NULL,
  "RedirectionTime" varchar(45) DEFAULT NULL,
  "AvgRedirectionTime" varchar(45) DEFAULT NULL,
  "ServerConnectionTime" varchar(45) DEFAULT NULL,
  "AvgServerConnectionTime" varchar(45) DEFAULT NULL,
  "ServerResponseTime" varchar(45) DEFAULT NULL,
  "AvgServerResponseTime" varchar(45) DEFAULT NULL,
  "SpeedMetricsSample" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctdate`
--

DROP TABLE IF EXISTS `fctdate`;
CREATE TABLE IF NOT EXISTS "fctdate" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimDate" ("Date"),
  KEY "fk_fctDate_dimDate_idx" ("Date")
) AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctform`
--

DROP TABLE IF EXISTS `fctform`;
CREATE TABLE IF NOT EXISTS "fctform" (
  "ID" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "dimSession" int(11) NOT NULL,
  "dimPagePath" int(11) NOT NULL,
  "dimHostName" int(11) NOT NULL,
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" int(11) NOT NULL DEFAULT '0',
  "Visits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctForm" ("dimProfile","dimDate","dimVisitor","dimSession","dimPagePath","dimHostName"),
  KEY "fk_fctForm_dimDate_idx" ("dimDate"),
  KEY "fk_fctForm_dimVisitor_idx" ("dimVisitor"),
  KEY "fk_fctForm_dimSession_idx" ("dimSession"),
  KEY "fk_fctForm_dimHostName_idx" ("dimHostName"),
  KEY "fk_fctForm_dimPagePath_idx" ("dimPagePath"),
  KEY "fk_fctForm_dimProfile_idx" ("dimProfile")
) AUTO_INCREMENT=1716 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctgeo`
--

DROP TABLE IF EXISTS `fctgeo`;
CREATE TABLE IF NOT EXISTS "fctgeo" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "Latitude" decimal(9,6) NOT NULL,
  "Longitude" decimal(9,6) NOT NULL,
  "City" varchar(45) NOT NULL,
  "Country" varchar(45) NOT NULL,
  "EventsPerVisitWithEvent" float DEFAULT NULL,
  "VisitsWithEvent" int(11) DEFAULT NULL,
  "AvgEventValue" float DEFAULT NULL,
  "EventValue" float DEFAULT NULL,
  "UniqueEvents" int(11) DEFAULT NULL,
  "TotalEvents" int(11) DEFAULT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "PercentNewVisits" float DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "AvgTimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "RPC" float DEFAULT NULL,
  "ROI" float DEFAULT NULL,
  "Margin" float DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "EntranceRate" float DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  "PageLoadTime" float DEFAULT NULL,
  "PageLoadSample" float DEFAULT NULL,
  "AvgPageLoadTime" float DEFAULT NULL,
  "DomainLookupTime" float DEFAULT NULL,
  "AvgDomainLookupTime" float DEFAULT NULL,
  "PageDownloadTime" float DEFAULT NULL,
  "AvgPageDownloadTime" float DEFAULT NULL,
  "RedirectionTime" float DEFAULT NULL,
  "AvgRedirectionTime" float DEFAULT NULL,
  "ServerConnectionTime" float DEFAULT NULL,
  "AvgServerConnectionTime" float DEFAULT NULL,
  "ServerResponseTime" float DEFAULT NULL,
  "AvgServerResponseTime" float DEFAULT NULL,
  "SpeedMetricsSample" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctGeo" ("Date","Latitude","Longitude","City","Country"),
  KEY "fk_fctGeo_dimDate_idx" ("Date"),
  KEY "fk_fctGeo_dimGeo_idx" ("Latitude","Longitude","City","Country")
) AUTO_INCREMENT=174 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctloanhistory`
--

DROP TABLE IF EXISTS `fctloanhistory`;
CREATE TABLE IF NOT EXISTS "fctloanhistory" (
  "ID" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimLandingPagePath" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "dimSession" int(11) NOT NULL,
  "dimNetwork" int(11) NOT NULL,
  "dimHostName" int(11) NOT NULL,
  "dimSystem" int(11) NOT NULL,
  "dimGeo" int(11) NOT NULL,
  "dimPlatform" int(11) NOT NULL,
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" int(11) NOT NULL DEFAULT '0',
  "Visits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fkt_idx" ("dimDate"),
  KEY "fctloanhistory_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctloanhistory_idx" ("dimLandingPagePath"),
  KEY "fk_fctloanhistory_dimVisitors_idx" ("dimVisitor"),
  KEY "fk_fctloanhistory__idx" ("dimSession"),
  KEY "fk_fctloanhistory_dimNetwork_idx" ("dimNetwork"),
  KEY "fk_fctloanhistory_dimHostname_idx" ("dimHostName"),
  KEY "fk_fctloanhistory_dimSystem_idx" ("dimSystem"),
  KEY "fk_fctloanhistory_dimPlatform_idx" ("dimPlatform"),
  KEY "fk_fctloanhistory_dimGeo_idx" ("dimGeo")
) AUTO_INCREMENT=138 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctnetwork`
--

DROP TABLE IF EXISTS `fctnetwork`;
CREATE TABLE IF NOT EXISTS "fctnetwork" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "NetworkDomain" varchar(45) NOT NULL,
  "NetworkLocation" varchar(45) NOT NULL,
  "EventsPerVisitWithEvent" float DEFAULT NULL,
  "VisitsWithEvent" int(11) DEFAULT NULL,
  "AvgEventValue" float DEFAULT NULL,
  "EventValue" float DEFAULT NULL,
  "UniqueEvents" int(11) DEFAULT NULL,
  "TotalEvents" int(11) DEFAULT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "PercentNewVisits" float DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "AvgTimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "RPC" float DEFAULT NULL,
  "ROI" float DEFAULT NULL,
  "Margin" float DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "EntranceRate" float DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  "PageLoadTime" float DEFAULT NULL,
  "PageLoadSample" float DEFAULT NULL,
  "AvgPageLoadTime" float DEFAULT NULL,
  "DomainLookupTime" float DEFAULT NULL,
  "AvgDomainLookupTime" float DEFAULT NULL,
  "PageDownloadTime" float DEFAULT NULL,
  "AvgPageDownloadTime" float DEFAULT NULL,
  "RedirectionTime" float DEFAULT NULL,
  "AvgRedirectionTime" float DEFAULT NULL,
  "ServerConnectionTime" float DEFAULT NULL,
  "AvgServerConnectionTime" float DEFAULT NULL,
  "ServerResponseTime" float DEFAULT NULL,
  "AvgServerResponseTime" float DEFAULT NULL,
  "SpeedMetricsSample" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctNetwork" ("Date","NetworkDomain","NetworkLocation"),
  KEY "fk_fctNetwork_dimDate_idx" ("Date"),
  KEY "fk_fctNetwork_dimNetwork_idx" ("NetworkDomain","NetworkLocation")
) AUTO_INCREMENT=202 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctsession`
--

DROP TABLE IF EXISTS `fctsession`;
CREATE TABLE IF NOT EXISTS "fctsession" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "VisitLength" int(11) NOT NULL,
  "EventsPerVisitWithEvent" float DEFAULT NULL,
  "VisitsWithEvent" int(11) DEFAULT NULL,
  "AvgEventValue" float DEFAULT NULL,
  "EventValue" float DEFAULT NULL,
  "UniqueEvents" int(11) DEFAULT NULL,
  "TotalEvents" int(11) DEFAULT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "PercentNewVisits" float DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "AvgTimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "RPC" float DEFAULT NULL,
  "ROI" float DEFAULT NULL,
  "Margin" float DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "EntranceRate" float DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  "PageLoadTime" float DEFAULT NULL,
  "PageLoadSample" float DEFAULT NULL,
  "AvgPageLoadTime" float DEFAULT NULL,
  "DomainLookupTime" float DEFAULT NULL,
  "AvgDomainLookupTime" float DEFAULT NULL,
  "PageDownloadTime" float DEFAULT NULL,
  "AvgPageDownloadTime" float DEFAULT NULL,
  "RedirectionTime" float DEFAULT NULL,
  "AvgRedirectionTime" float DEFAULT NULL,
  "ServerConnectionTime" float DEFAULT NULL,
  "AvgServerConnectionTime" float DEFAULT NULL,
  "ServerResponseTime" float DEFAULT NULL,
  "AvgServerResponseTime" float DEFAULT NULL,
  "SpeedMetricsSample" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctSession" ("Date","VisitLength"),
  KEY "fk_fctSession_dimDate_idx" ("Date"),
  KEY "fk_fctSession_dimSession_idx" ("VisitLength")
) AUTO_INCREMENT=425 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctsystem`
--

DROP TABLE IF EXISTS `fctsystem`;
CREATE TABLE IF NOT EXISTS "fctsystem" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "FlashVersion" varchar(45) NOT NULL,
  "JavaEnabled" varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  "ScreenColors" varchar(45) NOT NULL,
  "ScreenResolution" varchar(45) NOT NULL,
  "EventsPerVisitWithEvent" float DEFAULT NULL,
  "VisitsWithEvent" int(11) DEFAULT NULL,
  "AvgEventValue" float DEFAULT NULL,
  "EventValue" float DEFAULT NULL,
  "UniqueEvents" int(11) DEFAULT NULL,
  "TotalEvents" int(11) DEFAULT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "PercentNewVisits" float DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "AvgTimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "RPC" float DEFAULT NULL,
  "ROI" float DEFAULT NULL,
  "Margin" float DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "EntranceRate" float DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  "PageLoadTime" float DEFAULT NULL,
  "PageLoadSample" float DEFAULT NULL,
  "AvgPageLoadTime" float DEFAULT NULL,
  "DomainLookupTime" float DEFAULT NULL,
  "AvgDomainLookupTime" float DEFAULT NULL,
  "PageDownloadTime" float DEFAULT NULL,
  "AvgPageDownloadTime" float DEFAULT NULL,
  "RedirectionTime" float DEFAULT NULL,
  "AvgRedirectionTime" float DEFAULT NULL,
  "ServerConnectionTime" float DEFAULT NULL,
  "AvgServerConnectionTime" float DEFAULT NULL,
  "ServerResponseTime" float DEFAULT NULL,
  "AvgServerResponseTime" float DEFAULT NULL,
  "SpeedMetricsSample" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimSystem" ("Date","FlashVersion","JavaEnabled","Language","ScreenColors","ScreenResolution"),
  KEY "fk_fctSystem_dimDate_idx" ("Date")
) AUTO_INCREMENT=204 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctvisitor`
--

DROP TABLE IF EXISTS `fctvisitor`;
CREATE TABLE IF NOT EXISTS "fctvisitor" (
  "ID" int(11) NOT NULL,
  "Date" int(11) NOT NULL,
  "VisitCount" int(11) NOT NULL,
  "DaysSinceLastVisit" int(11) NOT NULL,
  "EventsPerVisitWithEvent" float DEFAULT NULL,
  "VisitsWithEvent" int(11) DEFAULT NULL,
  "AvgEventValue" float DEFAULT NULL,
  "EventValue" float DEFAULT NULL,
  "UniqueEvents" int(11) DEFAULT NULL,
  "TotalEvents" int(11) DEFAULT NULL,
  "Visits" int(11) DEFAULT NULL,
  "Visitors" int(11) DEFAULT NULL,
  "NewVisits" int(11) DEFAULT NULL,
  "PercentNewVisits" float DEFAULT NULL,
  "Bounces" int(11) DEFAULT NULL,
  "EntranceBounceRate" float DEFAULT NULL,
  "VisitBounceRate" float DEFAULT NULL,
  "TimeOnSite" float DEFAULT NULL,
  "AvgTimeOnSite" float DEFAULT NULL,
  "OrganicSearches" int(11) DEFAULT NULL,
  "RPC" float DEFAULT NULL,
  "ROI" float DEFAULT NULL,
  "Margin" float DEFAULT NULL,
  "GoalValuePerVisit" float DEFAULT NULL,
  "GoalStartsAll" int(11) DEFAULT NULL,
  "GoalCompletionsAll" int(11) DEFAULT NULL,
  "GoalAbandonsAll" int(11) DEFAULT NULL,
  "GoalValueAll" float DEFAULT NULL,
  "GoalConversionRateAll" float DEFAULT NULL,
  "GoalAbandonRateAll" float DEFAULT NULL,
  "Goal1Starts" int(11) DEFAULT NULL,
  "Goal1Completions" int(11) DEFAULT NULL,
  "Goal1Abandons" int(11) DEFAULT NULL,
  "Goal1Value" float DEFAULT NULL,
  "Goal1ConversionRate" float DEFAULT NULL,
  "Goal1AbandonRate" float DEFAULT NULL,
  "Goal2Starts" int(11) DEFAULT NULL,
  "Goal2Completions" int(11) DEFAULT NULL,
  "Goal2Abandons" int(11) DEFAULT NULL,
  "Goal2Value" float DEFAULT NULL,
  "Goal2ConversionRate" float DEFAULT NULL,
  "Goal2AbandonRate" float DEFAULT NULL,
  "Goal3Starts" int(11) DEFAULT NULL,
  "Goal3Completions" int(11) DEFAULT NULL,
  "Goal3Abandons" int(11) DEFAULT NULL,
  "Goal3Value" float DEFAULT NULL,
  "Goal3ConversionRate" float DEFAULT NULL,
  "Goal3AbandonRate" float DEFAULT NULL,
  "Entrances" int(11) DEFAULT NULL,
  "EntranceRate" float DEFAULT NULL,
  "Pageviews" int(11) DEFAULT NULL,
  "PageviewsPerVisit" float DEFAULT NULL,
  "UniquePageviews" int(11) DEFAULT NULL,
  "TimeOnPage" float DEFAULT NULL,
  "AvgTimeOnPage" float DEFAULT NULL,
  "Exits" int(11) DEFAULT NULL,
  "ExitRate" float DEFAULT NULL,
  "PageLoadTime" float DEFAULT NULL,
  "PageLoadSample" float DEFAULT NULL,
  "AvgPageLoadTime" float DEFAULT NULL,
  "DomainLookupTime" float DEFAULT NULL,
  "AvgDomainLookupTime" float DEFAULT NULL,
  "PageDownloadTime" float DEFAULT NULL,
  "AvgPageDownloadTime" float DEFAULT NULL,
  "RedirectionTime" float DEFAULT NULL,
  "AvgRedirectionTime" float DEFAULT NULL,
  "ServerConnectionTime" float DEFAULT NULL,
  "AvgServerConnectionTime" float DEFAULT NULL,
  "ServerResponseTime" float DEFAULT NULL,
  "AvgServerResponseTime" float DEFAULT NULL,
  "SpeedMetricsSample" float DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctVisitor" ("Date","VisitCount","DaysSinceLastVisit"),
  KEY "fk_fctVisitor_dimDate" ("Date"),
  KEY "fk_fctVisitor_dimVisitor" ("VisitCount")
) AUTO_INCREMENT=296 ;

-- --------------------------------------------------------

--
-- Structure for view `dimexitpagepath`
--
DROP TABLE IF EXISTS `dimexitpagepath`;

CREATE VIEW "workcommer"."dimexitpagepath" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "ExitPagePath" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimlandingpagepath`
--
DROP TABLE IF EXISTS `dimlandingpagepath`;

CREATE VIEW "workcommer"."dimlandingpagepath" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "LandingPagePath" from "workcommer"."dimpagepath";

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fctdate`
--
ALTER TABLE `fctdate`
  ADD CONSTRAINT "fk_fctDate_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctform`
--
ALTER TABLE `fctform`
  ADD CONSTRAINT "fk_fctForm_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimHostName" FOREIGN KEY ("dimHostName") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimSession" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctgeo`
--
ALTER TABLE `fctgeo`
  ADD CONSTRAINT "fk_fctGeo_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGeo_dimGeo" FOREIGN KEY ("Latitude", "Longitude", "City", "Country") REFERENCES "dimgeo" ("Latitude", "Longitude", "City", "Country") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctloanhistory`
--
ALTER TABLE `fctloanhistory`
  ADD CONSTRAINT "fk_fctloanhistory_dimGeo" FOREIGN KEY ("dimGeo") REFERENCES "dimgeo" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimHostname" FOREIGN KEY ("dimHostName") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimLandingPage" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimNetwork" FOREIGN KEY ("dimNetwork") REFERENCES "dimnetwork" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimPlatform" FOREIGN KEY ("dimPlatform") REFERENCES "dimplatform" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimSession" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimSystem" FOREIGN KEY ("dimSystem") REFERENCES "fctsystem" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctnetwork`
--
ALTER TABLE `fctnetwork`
  ADD CONSTRAINT "fk_fctNetwork_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctNetwork_dimNetwork" FOREIGN KEY ("NetworkDomain", "NetworkLocation") REFERENCES "dimnetwork" ("NetworkDomain", "NetworkLocation") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsession`
--
ALTER TABLE `fctsession`
  ADD CONSTRAINT "fk_fctSession_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctSession_dimSession" FOREIGN KEY ("VisitLength") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsystem`
--
ALTER TABLE `fctsystem`
  ADD CONSTRAINT "fk_fctSystem_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvisitor`
--
ALTER TABLE `fctvisitor`
  ADD CONSTRAINT "fk_fctVisitor_dimDate" FOREIGN KEY ("Date") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctVisitor_dimVisitor" FOREIGN KEY ("VisitCount") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
