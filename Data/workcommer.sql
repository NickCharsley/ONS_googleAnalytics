-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2012 at 10:43 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.7



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'workcommer'
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimadwords'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimadwords;
CREATE table dbo.dimadwords (
  ID int NOT NULL identity,
  AdGroup varchar(45) DEFAULT NULL,
  AdSlot varchar(45) DEFAULT NULL,
  AdSlotPosition varchar(45) DEFAULT NULL,
  AdDistributionNetwork varchar(45) DEFAULT NULL,
  AdMatchType varchar(45) DEFAULT NULL,
  AdMatchedQuery varchar(45) DEFAULT NULL,
  AdPlacementDomain varchar(45) DEFAULT NULL,
  AdPlacementUrl varchar(2048) DEFAULT NULL,
  AdFormat varchar(45) DEFAULT NULL,
  AdTargetingType varchar(45) DEFAULT NULL,
  AdTargetingOption varchar(45) DEFAULT NULL,
  AdDisplayUrl varchar(2048) DEFAULT NULL,
  AdDestinationUrl varchar(2048) DEFAULT NULL,
  AdwordsCustomerID varchar(45) DEFAULT NULL,
  AdwordsCampaignID varchar(45) DEFAULT NULL,
  AdwordsAdGroupID varchar(45) DEFAULT NULL,
  AdwordsCreativeID varchar(45) DEFAULT NULL,
  AdwordsCriteriaID varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimdate'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimdate;
CREATE table dbo.dimdate (
  ID int NOT NULL,
  "Date" date DEFAULT NULL,
  Description varchar(45) DEFAULT NULL,
  "Year" char(4) DEFAULT NULL,
  "Month" char(2) DEFAULT NULL,
  "Week" char(2) DEFAULT NULL,
  "Day" char(2) DEFAULT NULL,
  DayOfWeek char(2) DEFAULT NULL,
  MonthName varchar(15) DEFAULT NULL,
  DayOfWeekName varchar(15) DEFAULT NULL,
  PRIMARY KEY (ID)
  
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimgeo'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimgeo;
CREATE table dbo.dimgeo (
  ID int NOT NULL identity,
  Latitude decimal(9,6) NOT NULL,
  Longitude decimal(9,6) NOT NULL,
  City varchar(45) NOT NULL,
  Country varchar(45) NOT NULL,
  Continent varchar(45) NOT NULL,
  SubContinent varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimhostname'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimhostname;
CREATE table dbo.dimhostname (
  ID int NOT NULL identity,
  Hostname varchar(512) NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimhour'
--
-- Creation: Dec 13, 2012 at 07:25 PM
--

DROP table dbo.dimhour;
CREATE table dbo.dimhour (
  ID int NOT NULL,
  "Hour" varchar(2) NOT NULL,
  Description varchar(45) NOT NULL,
  StartTime datetime NOT NULL,
  EndTime datetime NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimmobile'
--
-- Creation: Dec 14, 2012 at 06:30 PM
--

DROP table dbo.dimmobile;
CREATE table dbo.dimmobile (
  ID int NOT NULL identity,
  IsMobile varchar(45) NOT NULL,
  MobileDeviceBranding varchar(45) NOT NULL,
  MobileDeviceModel varchar(45) NOT NULL,
  MobileInputSelector varchar(45) NOT NULL,
  MobileDeviceInfo varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimnetwork'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimnetwork;
CREATE table dbo.dimnetwork (
  ID int NOT NULL identity,
  NetworkDomain varchar(45) NOT NULL,
  NetworkLocation varchar(512) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimNetwork (NetworkDomain,NetworkLocation)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimpagepath'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimpagepath;
CREATE table dbo.dimpagepath (
  ID int NOT NULL identity,
  PagePath varchar(4096) NOT NULL,
  PageType varchar(45) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimpagetracking'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimpagetracking;
CREATE table dbo.dimpagetracking (
  ID int NOT NULL identity,
  Hostname varchar(45) NOT NULL,
  PagePath varchar(45) NOT NULL,
  LandingPagePath varchar(45) NOT NULL,
  SecondPagePath varchar(45) NOT NULL,
  ExitPagePath varchar(45) NOT NULL,
  PreviousPagePath varchar(45) NOT NULL,
  NextPagePath varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimPageTracking (Hostname,PagePath,LandingPagePath,SecondPagePath,ExitPagePath,PreviousPagePath,NextPagePath)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimplatform'
--
-- Creation: Dec 13, 2012 at 07:55 AM
--

DROP table dbo.dimplatform;
CREATE table dbo.dimplatform (
  ID int NOT NULL identity,
  Browser varchar(45) NOT NULL,
  BrowserVersion varchar(45) NOT NULL,
  OperatingSystem varchar(45) NOT NULL,
  OperatingSystemVersion varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimprofile'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimprofile;
CREATE table dbo.dimprofile (
  ID int NOT NULL,
  ProfileName varchar(45) NOT NULL DEFAULT 'Unknown',
  WebPropertyID varchar(45) NOT NULL,
  Currency varchar(45) NOT NULL,
  WebsiteURL varchar(45) NOT NULL,
  "Type" varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimsession'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimsession;
CREATE table dbo.dimsession (
  ID int NOT NULL,
  VisitLength int NOT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimsocialtraffic'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimsocialtraffic;
CREATE table dbo.dimsocialtraffic (
  ID int NOT NULL identity,
  SocialNetwork varchar(45) DEFAULT NULL,
  HasSocialSourceReferral varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimsystem'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimsystem;
CREATE table dbo.dimsystem (
  ID int NOT NULL identity,
  FlashVersion varchar(45) NOT NULL,
  JavaEnabled varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  ScreenColors varchar(45) NOT NULL,
  ScreenResolution varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSystem (FlashVersion,JavaEnabled,"Language",ScreenColors,ScreenResolution)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimtraffic'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimtraffic;
CREATE table dbo.dimtraffic (
  ID int NOT NULL identity,
  ReferralPath varchar(45) DEFAULT NULL,
  Campaign varchar(45) DEFAULT NULL,
  "Source" varchar(45) DEFAULT NULL,
  "Medium" varchar(45) DEFAULT NULL,
  Keyword varchar(45) DEFAULT NULL,
  AdContent varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimTraffic (ReferralPath,Campaign,"Source","Medium",Keyword,AdContent)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'dimvisitor'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.dimvisitor;
CREATE table dbo.dimvisitor (
  ID int NOT NULL,
  VisitCount int DEFAULT NULL,
  VisitorType varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_VisitCount (VisitCount)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctadwords'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctadwords;
CREATE table dbo.fctadwords (
  ID int NOT NULL identity,
  "Date" int DEFAULT NULL,
  "Hour" varchar(45) DEFAULT NULL,
  AdGroup varchar(45) DEFAULT NULL,
  AdDistributionNetwork varchar(45) DEFAULT NULL,
  AdMatchType varchar(45) DEFAULT NULL,
  AdDestinationUrl varchar(2048) DEFAULT NULL,
  AdwordsCustomerID varchar(45) DEFAULT NULL,
  AdwordsCampaignID varchar(45) DEFAULT NULL,
  AdwordsAdGroupID varchar(45) DEFAULT NULL,
  AdwordsCreativeID varchar(45) DEFAULT NULL,
  AdwordsCriteriaID varchar(45) DEFAULT NULL,
  Impressions varchar(45) DEFAULT NULL,
  AdClicks varchar(45) DEFAULT NULL,
  AdCost varchar(45) DEFAULT NULL,
  CPM varchar(45) DEFAULT NULL,
  CPC varchar(45) DEFAULT NULL,
  CTR varchar(45) DEFAULT NULL,
  CostPerTransaction varchar(45) DEFAULT NULL,
  CostPerGoalConversion varchar(45) DEFAULT NULL,
  CostPerConversion varchar(45) DEFAULT NULL,
  RPC varchar(45) DEFAULT NULL,
  ROI varchar(45) DEFAULT NULL,
  Margin varchar(45) DEFAULT NULL,
  Goal1Starts varchar(45) DEFAULT NULL,
  Goal1Completions varchar(45) DEFAULT NULL,
  Goal1Value varchar(45) DEFAULT NULL,
  Goal1ConversionRate varchar(45) DEFAULT NULL,
  Goal1Abandons varchar(45) DEFAULT NULL,
  Goal1AbandonRate varchar(45) DEFAULT NULL,
  Goal2Starts varchar(45) DEFAULT NULL,
  Goal2Completions varchar(45) DEFAULT NULL,
  Goal2Value varchar(45) DEFAULT NULL,
  Goal2ConversionRate varchar(45) DEFAULT NULL,
  Goal2Abandons varchar(45) DEFAULT NULL,
  Goal2AbandonRate varchar(45) DEFAULT NULL,
  Goal3Starts varchar(45) DEFAULT NULL,
  Goal3Completions varchar(45) DEFAULT NULL,
  Goal3Value varchar(45) DEFAULT NULL,
  Goal3ConversionRate varchar(45) DEFAULT NULL,
  Goal3Abandons varchar(45) DEFAULT NULL,
  Goal3AbandonRate varchar(45) DEFAULT NULL,
  GoalStartsAll varchar(45) DEFAULT NULL,
  GoalCompletionsAll varchar(45) DEFAULT NULL,
  GoalValueAll varchar(45) DEFAULT NULL,
  GoalValuePerVisit varchar(45) DEFAULT NULL,
  GoalConversionRateAll varchar(45) DEFAULT NULL,
  GoalAbandonsAll varchar(45) DEFAULT NULL,
  GoalAbandonRateAll varchar(45) DEFAULT NULL,
  NewVisits varchar(45) DEFAULT NULL,
  PercentNewVisits varchar(45) DEFAULT NULL,
  Visits varchar(45) DEFAULT NULL,
  Bounces varchar(45) DEFAULT NULL,
  EntranceBounceRate varchar(45) DEFAULT NULL,
  VisitBounceRate varchar(45) DEFAULT NULL,
  TimeOnSite varchar(45) DEFAULT NULL,
  AvgTimeOnSite varchar(45) DEFAULT NULL,
  OrganicSearches varchar(45) DEFAULT NULL,
  Entrances varchar(45) DEFAULT NULL,
  EntranceRate varchar(45) DEFAULT NULL,
  Pageviews varchar(45) DEFAULT NULL,
  PageviewsPerVisit varchar(45) DEFAULT NULL,
  UniquePageviews varchar(45) DEFAULT NULL,
  TimeOnPage varchar(45) DEFAULT NULL,
  AvgTimeOnPage varchar(45) DEFAULT NULL,
  Exits varchar(45) DEFAULT NULL,
  ExitRate varchar(45) DEFAULT NULL,
  PageLoadTime varchar(45) DEFAULT NULL,
  PageLoadSample varchar(45) DEFAULT NULL,
  AvgPageLoadTime varchar(45) DEFAULT NULL,
  DomainLookupTime varchar(45) DEFAULT NULL,
  AvgDomainLookupTime varchar(45) DEFAULT NULL,
  PageDownloadTime varchar(45) DEFAULT NULL,
  AvgPageDownloadTime varchar(45) DEFAULT NULL,
  RedirectionTime varchar(45) DEFAULT NULL,
  AvgRedirectionTime varchar(45) DEFAULT NULL,
  ServerConnectionTime varchar(45) DEFAULT NULL,
  AvgServerConnectionTime varchar(45) DEFAULT NULL,
  ServerResponseTime varchar(45) DEFAULT NULL,
  AvgServerResponseTime varchar(45) DEFAULT NULL,
  SpeedMetricsSample varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctdate'
--
-- Creation: Dec 14, 2012 at 07:43 AM
--

DROP table dbo.fctdate;
CREATE table dbo.fctdate (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimDate (dimDate),
  KEY fk_fctDate_dimDate_idx (dimDate),
  KEY fk_fctDate_dimProfile_idx (dimProfile)
) ;

--
-- RELATIONS FOR table dbo.fctdate:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctdevice'
--
-- Creation: Dec 13, 2012 at 07:21 PM
--

DROP table dbo.fctdevice;
CREATE table dbo.fctdevice (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimHour int NOT NULL,
  dimProfile int NOT NULL,
  dimGeo int NOT NULL,
  dimPlatform int NOT NULL,
  dimSystem int NOT NULL,
  dimNetwork int NOT NULL,
  dimVisitor int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctDevice_dimDate_idx (dimDate),
  KEY fk_fctDevice_dimHour_idx (dimHour),
  KEY fk_fctDevice_dimProfile_idx (dimProfile),
  KEY fk_fctDevice_dimGeo_idx (dimGeo),
  KEY fk_fctDevice_dimPlatform_idx (dimPlatform),
  KEY fk_fctDevice_dimSystem_idx (dimSystem),
  KEY fk_fctDevice_dim_idx (dimNetwork),
  KEY fk_fctDevice_dimVisitor_idx (dimVisitor)
) ;

--
-- RELATIONS FOR table dbo.fctdevice:
--   dimDate
--       dimdate -> ID
--   dimGeo
--       dimgeo -> ID
--   dimHour
--       dimhour -> ID
--   dimNetwork
--       dimnetwork -> ID
--   dimPlatform
--       dimplatform -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSystem
--       dimsystem -> ID
--   dimVisitor
--       dimvisitor -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctform'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctform;
CREATE table dbo.fctform (
  ID int NOT NULL identity,
  dimProfile int NOT NULL,
  dimDate int NOT NULL,
  dimVisitor int NOT NULL,
  dimSession int NOT NULL,
  dimPagePath int NOT NULL,
  dimHostName int NOT NULL,
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  TimeOnSite int NOT NULL DEFAULT '0',
  Visits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_fctForm (dimProfile,dimDate,dimVisitor,dimSession,dimPagePath,dimHostName),
  KEY fk_fctForm_dimDate_idx (dimDate),
  KEY fk_fctForm_dimVisitor_idx (dimVisitor),
  KEY fk_fctForm_dimSession_idx (dimSession),
  KEY fk_fctForm_dimHostName_idx (dimHostName),
  KEY fk_fctForm_dimPagePath_idx (dimPagePath),
  KEY fk_fctForm_dimProfile_idx (dimProfile)
) ;

--
-- RELATIONS FOR table dbo.fctform:
--   dimDate
--       dimdate -> ID
--   dimHostName
--       dimhostname -> ID
--   dimPagePath
--       dimpagepath -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSession
--       dimsession -> ID
--   dimVisitor
--       dimvisitor -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctgeo'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctgeo;
CREATE table dbo.fctgeo (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimGeo int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimGeo (dimDate,dimProfile,dimGeo),
  KEY fk_fctGeo_dimDate_idx (dimDate),
  KEY fk_fctGeo_dimProfile_idx (dimProfile),
  KEY fk_fctGeo_dimGeo_idx (dimGeo)
) ;

--
-- RELATIONS FOR table dbo.fctgeo:
--   dimDate
--       dimdate -> ID
--   dimGeo
--       dimgeo -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fcthostname'
--
-- Creation: Dec 14, 2012 at 03:09 PM
--

DROP table dbo.fcthostname;
CREATE table dbo.fcthostname (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimHostname int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimHostname (dimDate,dimProfile,dimHostname),
  KEY fk_fctHostname_dimDate_idx (dimDate),
  KEY fk_fctHostname_dimProfile_idx (dimProfile),
  KEY fk_fctHostname_dimHostname_idx (dimHostname)
) ;

--
-- RELATIONS FOR table dbo.fcthostname:
--   dimDate
--       dimdate -> ID
--   dimHostname
--       dimhostname -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctlandingpagepath'
--
-- Creation: Dec 14, 2012 at 03:15 PM
--

DROP table dbo.fctlandingpagepath;
CREATE table dbo.fctlandingpagepath (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimLandingPagePath int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimLandingPagePath (dimDate,dimProfile,dimLandingPagePath),
  KEY fk_fctLandingPagePath_dimDate_idx (dimDate),
  KEY fk_fctLandingPagePath_dimProfile_idx (dimProfile),
  KEY fk_fctLandingPagePath_dimLandingPagePath_idx (dimLandingPagePath)
) ;

--
-- RELATIONS FOR table dbo.fctlandingpagepath:
--   dimDate
--       dimdate -> ID
--   dimLandingPagePath
--       dimpagepath -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctloanhistory'
--
-- Creation: Dec 12, 2012 at 06:16 PM
--

DROP table dbo.fctloanhistory;
CREATE table dbo.fctloanhistory (
  ID int NOT NULL identity,
  dimProfile int NOT NULL,
  dimDate int NOT NULL,
  dimHostName int NOT NULL,
  dimNetwork int NOT NULL,
  dimVisitor int NOT NULL,
  dimSession int NOT NULL,
  dimGeo int NOT NULL,
  dimSystem int NOT NULL,
  dimPlatform int NOT NULL,
  dimLandingPagePath int NOT NULL,
  dimMobile int NOT NULL,
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  TimeOnSite int NOT NULL DEFAULT '0',
  Visits int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Goal1Starts int NOT NULL DEFAULT '0',
  Goal1Completions int NOT NULL DEFAULT '0',
  Goal1Abandons int NOT NULL DEFAULT '0',
  Goal1Value float NOT NULL DEFAULT '0',
  Goal2Starts int NOT NULL DEFAULT '0',
  Goal2Completions int NOT NULL DEFAULT '0',
  Goal2Abandons int NOT NULL DEFAULT '0',
  Goal2Value float NOT NULL DEFAULT '0',
  Goal3Starts int NOT NULL DEFAULT '0',
  Goal3Completions int NOT NULL DEFAULT '0',
  Goal3Abandons int NOT NULL DEFAULT '0',
  Goal3Value float NOT NULL DEFAULT '0',
  Goal4Starts int NOT NULL DEFAULT '0',
  Goal4Completions int NOT NULL DEFAULT '0',
  Goal4Abandons int NOT NULL DEFAULT '0',
  Goal4Value float NOT NULL DEFAULT '0',
  Goal5Starts int NOT NULL DEFAULT '0',
  Goal5Completions int NOT NULL DEFAULT '0',
  Goal5Abandons int NOT NULL DEFAULT '0',
  Goal5Value float NOT NULL DEFAULT '0',
  Goal6Starts int NOT NULL DEFAULT '0',
  Goal6Completions int NOT NULL DEFAULT '0',
  Goal6Abandons int NOT NULL DEFAULT '0',
  Goal6Value float NOT NULL DEFAULT '0',
  Goal7Starts int NOT NULL DEFAULT '0',
  Goal7Completions int NOT NULL DEFAULT '0',
  Goal7Abandons int NOT NULL DEFAULT '0',
  Goal7Value float NOT NULL DEFAULT '0',
  Goal8Starts int NOT NULL DEFAULT '0',
  Goal8Completions int NOT NULL DEFAULT '0',
  Goal8Abandons int NOT NULL DEFAULT '0',
  Goal8Value float NOT NULL DEFAULT '0',
  Goal9Starts int NOT NULL DEFAULT '0',
  Goal9Completions int NOT NULL DEFAULT '0',
  Goal9Abandons int NOT NULL DEFAULT '0',
  Goal9Value float NOT NULL DEFAULT '0',
  Goal10Starts int NOT NULL DEFAULT '0',
  Goal10Completions int NOT NULL DEFAULT '0',
  Goal10Abandons int NOT NULL DEFAULT '0',
  Goal10Value float NOT NULL DEFAULT '0',
  Goal11Starts int NOT NULL DEFAULT '0',
  Goal11Completions int NOT NULL DEFAULT '0',
  Goal11Abandons int NOT NULL DEFAULT '0',
  Goal11Value float NOT NULL DEFAULT '0',
  Goal12Starts int NOT NULL DEFAULT '0',
  Goal12Completions int NOT NULL DEFAULT '0',
  Goal12Abandons int NOT NULL DEFAULT '0',
  Goal12Value float NOT NULL DEFAULT '0',
  Goal13Starts int NOT NULL DEFAULT '0',
  Goal13Completions int NOT NULL DEFAULT '0',
  Goal13Abandons int NOT NULL DEFAULT '0',
  Goal13Value float NOT NULL DEFAULT '0',
  Goal14Starts int NOT NULL DEFAULT '0',
  Goal14Completions int NOT NULL DEFAULT '0',
  Goal14Abandons int NOT NULL DEFAULT '0',
  Goal14Value float NOT NULL DEFAULT '0',
  Goal15Starts int NOT NULL DEFAULT '0',
  Goal15Completions int NOT NULL DEFAULT '0',
  Goal15Abandons int NOT NULL DEFAULT '0',
  Goal15Value float NOT NULL DEFAULT '0',
  Goal16Starts int NOT NULL DEFAULT '0',
  Goal16Completions int NOT NULL DEFAULT '0',
  Goal16Abandons int NOT NULL DEFAULT '0',
  Goal16Value float NOT NULL DEFAULT '0',
  Goal17Starts int NOT NULL DEFAULT '0',
  Goal17Completions int NOT NULL DEFAULT '0',
  Goal17Abandons int NOT NULL DEFAULT '0',
  Goal17Value float NOT NULL DEFAULT '0',
  Goal18Starts int NOT NULL DEFAULT '0',
  Goal18Completions int NOT NULL DEFAULT '0',
  Goal18Abandons int NOT NULL DEFAULT '0',
  Goal18Value float NOT NULL DEFAULT '0',
  Goal19Starts int NOT NULL DEFAULT '0',
  Goal19Completions int NOT NULL DEFAULT '0',
  Goal19Abandons int NOT NULL DEFAULT '0',
  Goal19Value float NOT NULL DEFAULT '0',
  Goal20Starts int NOT NULL DEFAULT '0',
  Goal20Completions int NOT NULL DEFAULT '0',
  Goal20Abandons int NOT NULL DEFAULT '0',
  Goal20Value float NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fkt_idx (dimDate),
  KEY fctloanhistory_dimProfile_idx (dimProfile),
  KEY fk_fctloanhistory_dimLandingPagePath_idx (dimLandingPagePath),
  KEY fk_fctloanhistory_dimVisitors_idx (dimVisitor),
  KEY fk_fctloanhistory_dimSession_idx (dimSession),
  KEY fk_fctloanhistory_dimNetwork_idx (dimNetwork),
  KEY fk_fctloanhistory_dimHostname_idx (dimHostName),
  KEY fk_fctloanhistory_dimSystem_idx (dimSystem),
  KEY fk_fctloanhistory_dimPlatform_idx (dimPlatform),
  KEY fk_fctloanhistory_dimGeo_idx (dimGeo),
  KEY fk_fctloanhistory_dimMobile_idx (dimMobile)
) ;

--
-- RELATIONS FOR table dbo.fctloanhistory:
--   dimDate
--       dimdate -> ID
--   dimGeo
--       dimgeo -> ID
--   dimHostName
--       dimhostname -> ID
--   dimLandingPagePath
--       dimpagepath -> ID
--   dimMobile
--       dimmobile -> ID
--   dimNetwork
--       dimnetwork -> ID
--   dimPlatform
--       dimplatform -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSession
--       dimsession -> ID
--   dimSystem
--       dimsystem -> ID
--   dimVisitor
--       dimvisitor -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctmobile'
--
-- Creation: Dec 14, 2012 at 06:40 PM
--

DROP table dbo.fctmobile;
CREATE table dbo.fctmobile (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimMobile int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID)
) ;

--
-- RELATIONS FOR table dbo.fctmobile:
--   dimDate
--       dimdate -> ID
--   dimMobile
--       dimmobile -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctnetwork'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctnetwork;
CREATE table dbo.fctnetwork (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimNetwork int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimNetwork (dimDate,dimProfile,dimNetwork),
  KEY fk_fctNetwork_dimDate_idx (dimDate),
  KEY fk_fctNetwork_dimProfile_idx (dimProfile),
  KEY fk_fctNetwork_dimNetwork_idx (dimNetwork)
) ;

--
-- RELATIONS FOR table dbo.fctnetwork:
--   dimDate
--       dimdate -> ID
--   dimNetwork
--       dimnetwork -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctplatform'
--
-- Creation: Dec 14, 2012 at 04:35 PM
--

DROP table dbo.fctplatform;
CREATE table dbo.fctplatform (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimPlatform int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimPlatform (dimDate,dimProfile,dimPlatform),
  KEY fk_fctPlatform_dimDate_idx (dimDate),
  KEY fk_fctPlatform_dimProfile_idx (dimProfile),
  KEY fk_fctPlatform_dimPlatform_idx (dimPlatform)
) ;

--
-- RELATIONS FOR table dbo.fctplatform:
--   dimDate
--       dimdate -> ID
--   dimPlatform
--       dimplatform -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctsession'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctsession;
CREATE table dbo.fctsession (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimSession int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSession (dimDate,dimProfile,dimSession),
  KEY fk_fctSession_dimDate_idx (dimDate),
  KEY fk_fctSession_dimProfile_idx (dimProfile),
  KEY fk_fctSession_dimSession_idx (dimSession)
) ;

--
-- RELATIONS FOR table dbo.fctsession:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSession
--       dimsession -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctsystem'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP table dbo.fctsystem;
CREATE table dbo.fctsystem (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimSystem int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSystem (dimDate,dimProfile,dimSystem),
  KEY fk_fctSystem_dimDate_idx (dimDate),
  KEY fk_fctSystem_dimProfile_idx (dimProfile),
  KEY fk_fctSystem_dimSystem_idx (dimSystem)
) ;

--
-- RELATIONS FOR table dbo.fctsystem:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSystem
--       dimsystem -> ID
--

-- --------------------------------------------------------

--
-- table dbo.structure for table dbo.'fctvisitor'
--
-- Creation: Dec 14, 2012 at 10:58 AM
--

DROP table dbo.fctvisitor;
CREATE table dbo.fctvisitor (
  ID int NOT NULL identity,
  dimDate int NOT NULL,
  dimProfile int NOT NULL,
  dimVisitor int NOT NULL,
  Visits int NOT NULL DEFAULT '0',
  Visitors int NOT NULL DEFAULT '0',
  NewVisits int NOT NULL DEFAULT '0',
  Bounces int NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int NOT NULL DEFAULT '0',
  GoalStartsAll int NOT NULL DEFAULT '0',
  GoalCompletionsAll int NOT NULL DEFAULT '0',
  GoalAbandonsAll int NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int NOT NULL DEFAULT '0',
  Pageviews int NOT NULL DEFAULT '0',
  UniquePageviews int NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimDate (dimDate,dimProfile,dimVisitor),
  KEY fk_fctVisitor_dimDate_idx (dimDate),
  KEY fk_fctVisitor_dimProfile_idx (dimProfile),
  KEY fk_fctVisitor_dimVisitor_idx (dimVisitor)
) ;

--
-- RELATIONS FOR table dbo.fctvisitor:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--   dimVisitor
--       dimvisitor -> ID
--

-- --------------------------------------------------------

--
-- Structure for view 'dimexitpagepath'
--
DROP table dbo."dimexitpagepath";

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW workcommer.dimexitpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS ExitPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimlandingpagepath'
--
DROP table dbo."dimlandingpagepath";

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW workcommer.dimlandingpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS LandingPagePath from workcommer.dimpagepath;

--
-- Constraints for dumped tables
--

--
-- Constraints for table dbo."fctdate"
--
ALTER table dbo."fctdate"
  ADD CONSTRAINT fk_fctDate_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDate_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctdevice"
--
ALTER table dbo."fctdevice"
  ADD CONSTRAINT fk_fctDevice_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimHour FOREIGN KEY (dimHour) REFERENCES dimhour (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctform"
--
ALTER table dbo."fctform"
  ADD CONSTRAINT fk_fctForm_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimHostName FOREIGN KEY (dimHostName) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimSession FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctgeo"
--
ALTER table dbo."fctgeo"
  ADD CONSTRAINT fk_fctGeo_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGeo_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGeo_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fcthostname"
--
ALTER table dbo."fcthostname"
  ADD CONSTRAINT fk_fctHostname_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctHostname_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctHostname_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctlandingpagepath"
--
ALTER table dbo."fctlandingpagepath"
  ADD CONSTRAINT fk_fctLandingPagePath_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctLandingPagePath_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctLandingPagePath_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctloanhistory"
--
ALTER table dbo."fctloanhistory"
  ADD CONSTRAINT fk_fctloanhistory_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimHostname FOREIGN KEY (dimHostName) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimLandingPage FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimMobile FOREIGN KEY (dimMobile) REFERENCES dimmobile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimSession FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctloanhistory_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctmobile"
--
ALTER table dbo."fctmobile"
  ADD CONSTRAINT fk_fctMobile_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctMobile_dimMobile FOREIGN KEY (dimMobile) REFERENCES dimmobile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctMobile_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctnetwork"
--
ALTER table dbo."fctnetwork"
  ADD CONSTRAINT fk_fctNetwork_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctNetwork_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctNetwork_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctplatform"
--
ALTER table dbo."fctplatform"
  ADD CONSTRAINT fk_fctPlatform_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPlatform_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPlatform_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctsession"
--
ALTER table dbo."fctsession"
  ADD CONSTRAINT fk_fctSession_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSession_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSession_dimVisitor FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctsystem"
--
ALTER table dbo."fctsystem"
  ADD CONSTRAINT fk_fctSystem_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSystem_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSystem_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table dbo."fctvisitor"
--
ALTER table dbo."fctvisitor"
  ADD CONSTRAINT fk_fctVisitor_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
