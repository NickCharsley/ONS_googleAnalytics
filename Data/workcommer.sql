-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2012 at 10:43 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'workcommer'
--

-- --------------------------------------------------------

--
-- Table structure for table 'dimadwords'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimadwords;
CREATE TABLE dimadwords (
  ID int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimdate'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimdate;
CREATE TABLE dimdate (
  ID int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  Description varchar(45) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  `Month` char(2) DEFAULT NULL,
  `Week` char(2) DEFAULT NULL,
  `Day` char(2) DEFAULT NULL,
  DayOfWeek char(2) DEFAULT NULL,
  MonthName varchar(15) DEFAULT NULL,
  DayOfWeekName varchar(15) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY Date_UNIQUE (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimexitpagepath'
--
DROP VIEW IF EXISTS `dimexitpagepath`;
CREATE TABLE `dimexitpagepath` (
`ID` int(11)
,`ExitPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimgeo'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimgeo;
CREATE TABLE dimgeo (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Latitude decimal(9,6) NOT NULL,
  Longitude decimal(9,6) NOT NULL,
  City varchar(45) NOT NULL,
  Country varchar(45) NOT NULL,
  Continent varchar(45) NOT NULL,
  SubContinent varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY dimGeo_indx (Latitude,Longitude,City,Country)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimhostname'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimhostname;
CREATE TABLE dimhostname (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Hostname varchar(512) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimHostName (Hostname)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimhour'
--
-- Creation: Dec 13, 2012 at 07:25 PM
--

DROP TABLE IF EXISTS dimhour;
CREATE TABLE dimhour (
  ID int(11) NOT NULL,
  `Hour` varchar(2) NOT NULL,
  Description varchar(45) NOT NULL,
  StartTime datetime NOT NULL,
  EndTime datetime NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimlandingpagepath'
--
DROP VIEW IF EXISTS `dimlandingpagepath`;
CREATE TABLE `dimlandingpagepath` (
`ID` int(11)
,`LandingPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimmobile'
--
-- Creation: Dec 14, 2012 at 06:30 PM
--

DROP TABLE IF EXISTS dimmobile;
CREATE TABLE dimmobile (
  ID int(11) NOT NULL AUTO_INCREMENT,
  IsMobile varchar(45) NOT NULL,
  MobileDeviceBranding varchar(45) NOT NULL,
  MobileDeviceModel varchar(45) NOT NULL,
  MobileInputSelector varchar(45) NOT NULL,
  MobileDeviceInfo varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimnetwork'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimnetwork;
CREATE TABLE dimnetwork (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NetworkDomain varchar(45) NOT NULL,
  NetworkLocation varchar(512) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimNetwork (NetworkDomain,NetworkLocation)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimpagepath'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimpagepath;
CREATE TABLE dimpagepath (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PagePath varchar(4096) NOT NULL,
  PageType varchar(45) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (ID)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimpagetracking'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimpagetracking;
CREATE TABLE dimpagetracking (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Hostname varchar(45) NOT NULL,
  PagePath varchar(45) NOT NULL,
  LandingPagePath varchar(45) NOT NULL,
  SecondPagePath varchar(45) NOT NULL,
  ExitPagePath varchar(45) NOT NULL,
  PreviousPagePath varchar(45) NOT NULL,
  NextPagePath varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimPageTracking (Hostname,PagePath,LandingPagePath,SecondPagePath,ExitPagePath,PreviousPagePath,NextPagePath)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimplatform'
--
-- Creation: Dec 13, 2012 at 07:55 AM
--

DROP TABLE IF EXISTS dimplatform;
CREATE TABLE dimplatform (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Browser varchar(45) NOT NULL,
  BrowserVersion varchar(45) NOT NULL,
  OperatingSystem varchar(45) NOT NULL,
  OperatingSystemVersion varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimprofile'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimprofile;
CREATE TABLE dimprofile (
  ID int(11) NOT NULL,
  ProfileName varchar(45) NOT NULL DEFAULT 'Unknown',
  WebPropertyID varchar(45) NOT NULL,
  Currency varchar(45) NOT NULL,
  WebsiteURL varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimsession'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimsession;
CREATE TABLE dimsession (
  ID int(11) NOT NULL,
  VisitLength int(11) NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimsocialtraffic'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimsocialtraffic;
CREATE TABLE dimsocialtraffic (
  ID int(11) NOT NULL AUTO_INCREMENT,
  SocialNetwork varchar(45) DEFAULT NULL,
  HasSocialSourceReferral varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimsystem'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimsystem;
CREATE TABLE dimsystem (
  ID int(11) NOT NULL AUTO_INCREMENT,
  FlashVersion varchar(45) NOT NULL,
  JavaEnabled varchar(45) NOT NULL,
  `Language` varchar(45) NOT NULL,
  ScreenColors varchar(45) NOT NULL,
  ScreenResolution varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSystem (FlashVersion,JavaEnabled,`Language`,ScreenColors,ScreenResolution)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimtraffic'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimtraffic;
CREATE TABLE dimtraffic (
  ID int(11) NOT NULL AUTO_INCREMENT,
  ReferralPath varchar(45) DEFAULT NULL,
  Campaign varchar(45) DEFAULT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `Medium` varchar(45) DEFAULT NULL,
  Keyword varchar(45) DEFAULT NULL,
  AdContent varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimTraffic (ReferralPath,Campaign,`Source`,`Medium`,Keyword,AdContent)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'dimvisitor'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS dimvisitor;
CREATE TABLE dimvisitor (
  ID int(11) NOT NULL,
  VisitCount int(11) DEFAULT NULL,
  VisitorType varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_VisitCount (VisitCount)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'fctadwords'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctadwords;
CREATE TABLE fctadwords (
  ID int(11) NOT NULL AUTO_INCREMENT,
  `Date` int(11) DEFAULT NULL,
  `Hour` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'fctdate'
--
-- Creation: Dec 14, 2012 at 07:43 AM
--

DROP TABLE IF EXISTS fctdate;
CREATE TABLE fctdate (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimDate (dimDate),
  KEY fk_fctDate_dimDate_idx (dimDate),
  KEY fk_fctDate_dimProfile_idx (dimProfile)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctdate:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctdevice'
--
-- Creation: Dec 13, 2012 at 07:21 PM
--

DROP TABLE IF EXISTS fctdevice;
CREATE TABLE fctdevice (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimHour int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimGeo int(11) NOT NULL,
  dimPlatform int(11) NOT NULL,
  dimSystem int(11) NOT NULL,
  dimNetwork int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctDevice_dimDate_idx (dimDate),
  KEY fk_fctDevice_dimHour_idx (dimHour),
  KEY fk_fctDevice_dimProfile_idx (dimProfile),
  KEY fk_fctDevice_dimGeo_idx (dimGeo),
  KEY fk_fctDevice_dimPlatform_idx (dimPlatform),
  KEY fk_fctDevice_dimSystem_idx (dimSystem),
  KEY fk_fctDevice_dim_idx (dimNetwork),
  KEY fk_fctDevice_dimVisitor_idx (dimVisitor)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctdevice:
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
-- Table structure for table 'fctform'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctform;
CREATE TABLE fctform (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimProfile int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimSession int(11) NOT NULL,
  dimPagePath int(11) NOT NULL,
  dimHostName int(11) NOT NULL,
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  TimeOnSite int(11) NOT NULL DEFAULT '0',
  Visits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_fctForm (dimProfile,dimDate,dimVisitor,dimSession,dimPagePath,dimHostName),
  KEY fk_fctForm_dimDate_idx (dimDate),
  KEY fk_fctForm_dimVisitor_idx (dimVisitor),
  KEY fk_fctForm_dimSession_idx (dimSession),
  KEY fk_fctForm_dimHostName_idx (dimHostName),
  KEY fk_fctForm_dimPagePath_idx (dimPagePath),
  KEY fk_fctForm_dimProfile_idx (dimProfile)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctform:
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
-- Table structure for table 'fctgeo'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctgeo;
CREATE TABLE fctgeo (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimGeo int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimGeo (dimDate,dimProfile,dimGeo),
  KEY fk_fctGeo_dimDate_idx (dimDate),
  KEY fk_fctGeo_dimProfile_idx (dimProfile),
  KEY fk_fctGeo_dimGeo_idx (dimGeo)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctgeo:
--   dimDate
--       dimdate -> ID
--   dimGeo
--       dimgeo -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fcthostname'
--
-- Creation: Dec 14, 2012 at 03:09 PM
--

DROP TABLE IF EXISTS fcthostname;
CREATE TABLE fcthostname (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimHostname int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimHostname (dimDate,dimProfile,dimHostname),
  KEY fk_fctHostname_dimDate_idx (dimDate),
  KEY fk_fctHostname_dimProfile_idx (dimProfile),
  KEY fk_fctHostname_dimHostname_idx (dimHostname)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fcthostname:
--   dimDate
--       dimdate -> ID
--   dimHostname
--       dimhostname -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctlandingpagepath'
--
-- Creation: Dec 14, 2012 at 03:15 PM
--

DROP TABLE IF EXISTS fctlandingpagepath;
CREATE TABLE fctlandingpagepath (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimLandingPagePath int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimLandingPagePath (dimDate,dimProfile,dimLandingPagePath),
  KEY fk_fctLandingPagePath_dimDate_idx (dimDate),
  KEY fk_fctLandingPagePath_dimProfile_idx (dimProfile),
  KEY fk_fctLandingPagePath_dimLandingPagePath_idx (dimLandingPagePath)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctlandingpagepath:
--   dimDate
--       dimdate -> ID
--   dimLandingPagePath
--       dimpagepath -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctloanhistory'
--
-- Creation: Dec 12, 2012 at 06:16 PM
--

DROP TABLE IF EXISTS fctloanhistory;
CREATE TABLE fctloanhistory (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimProfile int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimHostName int(11) NOT NULL,
  dimNetwork int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimSession int(11) NOT NULL,
  dimGeo int(11) NOT NULL,
  dimSystem int(11) NOT NULL,
  dimPlatform int(11) NOT NULL,
  dimLandingPagePath int(11) NOT NULL,
  dimMobile int(11) NOT NULL,
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  TimeOnSite int(11) NOT NULL DEFAULT '0',
  Visits int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Goal1Starts int(11) NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal1Abandons int(11) NOT NULL DEFAULT '0',
  Goal1Value float NOT NULL DEFAULT '0',
  Goal2Starts int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal2Abandons int(11) NOT NULL DEFAULT '0',
  Goal2Value float NOT NULL DEFAULT '0',
  Goal3Starts int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal3Abandons int(11) NOT NULL DEFAULT '0',
  Goal3Value float NOT NULL DEFAULT '0',
  Goal4Starts int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal4Abandons int(11) NOT NULL DEFAULT '0',
  Goal4Value float NOT NULL DEFAULT '0',
  Goal5Starts int(11) NOT NULL DEFAULT '0',
  Goal5Completions int(11) NOT NULL DEFAULT '0',
  Goal5Abandons int(11) NOT NULL DEFAULT '0',
  Goal5Value float NOT NULL DEFAULT '0',
  Goal6Starts int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal6Abandons int(11) NOT NULL DEFAULT '0',
  Goal6Value float NOT NULL DEFAULT '0',
  Goal7Starts int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal7Abandons int(11) NOT NULL DEFAULT '0',
  Goal7Value float NOT NULL DEFAULT '0',
  Goal8Starts int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal8Abandons int(11) NOT NULL DEFAULT '0',
  Goal8Value float NOT NULL DEFAULT '0',
  Goal9Starts int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal9Abandons int(11) NOT NULL DEFAULT '0',
  Goal9Value float NOT NULL DEFAULT '0',
  Goal10Starts int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal10Abandons int(11) NOT NULL DEFAULT '0',
  Goal10Value float NOT NULL DEFAULT '0',
  Goal11Starts int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal11Abandons int(11) NOT NULL DEFAULT '0',
  Goal11Value float NOT NULL DEFAULT '0',
  Goal12Starts int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal12Abandons int(11) NOT NULL DEFAULT '0',
  Goal12Value float NOT NULL DEFAULT '0',
  Goal13Starts int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal13Abandons int(11) NOT NULL DEFAULT '0',
  Goal13Value float NOT NULL DEFAULT '0',
  Goal14Starts int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal14Abandons int(11) NOT NULL DEFAULT '0',
  Goal14Value float NOT NULL DEFAULT '0',
  Goal15Starts int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal15Abandons int(11) NOT NULL DEFAULT '0',
  Goal15Value float NOT NULL DEFAULT '0',
  Goal16Starts int(11) NOT NULL DEFAULT '0',
  Goal16Completions int(11) NOT NULL DEFAULT '0',
  Goal16Abandons int(11) NOT NULL DEFAULT '0',
  Goal16Value float NOT NULL DEFAULT '0',
  Goal17Starts int(11) NOT NULL DEFAULT '0',
  Goal17Completions int(11) NOT NULL DEFAULT '0',
  Goal17Abandons int(11) NOT NULL DEFAULT '0',
  Goal17Value float NOT NULL DEFAULT '0',
  Goal18Starts int(11) NOT NULL DEFAULT '0',
  Goal18Completions int(11) NOT NULL DEFAULT '0',
  Goal18Abandons int(11) NOT NULL DEFAULT '0',
  Goal18Value float NOT NULL DEFAULT '0',
  Goal19Starts int(11) NOT NULL DEFAULT '0',
  Goal19Completions int(11) NOT NULL DEFAULT '0',
  Goal19Abandons int(11) NOT NULL DEFAULT '0',
  Goal19Value float NOT NULL DEFAULT '0',
  Goal20Starts int(11) NOT NULL DEFAULT '0',
  Goal20Completions int(11) NOT NULL DEFAULT '0',
  Goal20Abandons int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctloanhistory:
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
-- Table structure for table 'fctmobile'
--
-- Creation: Dec 14, 2012 at 06:40 PM
--

DROP TABLE IF EXISTS fctmobile;
CREATE TABLE fctmobile (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimMobile int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimMobile (dimDate,dimProfile,dimMobile),
  KEY fk_fctMobile_dimDate_idx (dimDate),
  KEY fk_fctMobile_dimProfile_idx (dimProfile),
  KEY fk_fctMobile_dimMobile_idx (dimMobile)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctmobile:
--   dimDate
--       dimdate -> ID
--   dimMobile
--       dimmobile -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctnetwork'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctnetwork;
CREATE TABLE fctnetwork (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimNetwork int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimNetwork (dimDate,dimProfile,dimNetwork),
  KEY fk_fctNetwork_dimDate_idx (dimDate),
  KEY fk_fctNetwork_dimProfile_idx (dimProfile),
  KEY fk_fctNetwork_dimNetwork_idx (dimNetwork)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctnetwork:
--   dimDate
--       dimdate -> ID
--   dimNetwork
--       dimnetwork -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctplatform'
--
-- Creation: Dec 14, 2012 at 04:35 PM
--

DROP TABLE IF EXISTS fctplatform;
CREATE TABLE fctplatform (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimPlatform int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimPlatform (dimDate,dimProfile,dimPlatform),
  KEY fk_fctPlatform_dimDate_idx (dimDate),
  KEY fk_fctPlatform_dimProfile_idx (dimProfile),
  KEY fk_fctPlatform_dimPlatform_idx (dimPlatform)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctplatform:
--   dimDate
--       dimdate -> ID
--   dimPlatform
--       dimplatform -> ID
--   dimProfile
--       dimprofile -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctsession'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctsession;
CREATE TABLE fctsession (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimSession int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSession (dimDate,dimProfile,dimSession),
  KEY fk_fctSession_dimDate_idx (dimDate),
  KEY fk_fctSession_dimProfile_idx (dimProfile),
  KEY fk_fctSession_dimSession_idx (dimSession)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctsession:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSession
--       dimsession -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctsystem'
--
-- Creation: Dec 12, 2012 at 01:50 PM
--

DROP TABLE IF EXISTS fctsystem;
CREATE TABLE fctsystem (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimSystem int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSystem (dimDate,dimProfile,dimSystem),
  KEY fk_fctSystem_dimDate_idx (dimDate),
  KEY fk_fctSystem_dimProfile_idx (dimProfile),
  KEY fk_fctSystem_dimSystem_idx (dimSystem)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctsystem:
--   dimDate
--       dimdate -> ID
--   dimProfile
--       dimprofile -> ID
--   dimSystem
--       dimsystem -> ID
--

-- --------------------------------------------------------

--
-- Table structure for table 'fctvisitor'
--
-- Creation: Dec 14, 2012 at 10:58 AM
--

DROP TABLE IF EXISTS fctvisitor;
CREATE TABLE fctvisitor (
  ID int(11) NOT NULL AUTO_INCREMENT,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  GoalValueAll float NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimDate (dimDate,dimProfile,dimVisitor),
  KEY fk_fctVisitor_dimDate_idx (dimDate),
  KEY fk_fctVisitor_dimProfile_idx (dimProfile),
  KEY fk_fctVisitor_dimVisitor_idx (dimVisitor)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE fctvisitor:
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
DROP TABLE IF EXISTS `dimexitpagepath`;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW workcommer.dimexitpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS ExitPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimlandingpagepath'
--
DROP TABLE IF EXISTS `dimlandingpagepath`;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW workcommer.dimlandingpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS LandingPagePath from workcommer.dimpagepath;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fctdate`
--
ALTER TABLE `fctdate`
  ADD CONSTRAINT fk_fctDate_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDate_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctdevice`
--
ALTER TABLE `fctdevice`
  ADD CONSTRAINT fk_fctDevice_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimHour FOREIGN KEY (dimHour) REFERENCES dimhour (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctDevice_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctform`
--
ALTER TABLE `fctform`
  ADD CONSTRAINT fk_fctForm_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimHostName FOREIGN KEY (dimHostName) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimSession FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctForm_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctgeo`
--
ALTER TABLE `fctgeo`
  ADD CONSTRAINT fk_fctGeo_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGeo_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGeo_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fcthostname`
--
ALTER TABLE `fcthostname`
  ADD CONSTRAINT fk_fctHostname_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctHostname_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctHostname_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctlandingpagepath`
--
ALTER TABLE `fctlandingpagepath`
  ADD CONSTRAINT fk_fctLandingPagePath_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctLandingPagePath_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctLandingPagePath_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctloanhistory`
--
ALTER TABLE `fctloanhistory`
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
-- Constraints for table `fctmobile`
--
ALTER TABLE `fctmobile`
  ADD CONSTRAINT fk_fctMobile_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctMobile_dimMobile FOREIGN KEY (dimMobile) REFERENCES dimmobile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctMobile_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctnetwork`
--
ALTER TABLE `fctnetwork`
  ADD CONSTRAINT fk_fctNetwork_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctNetwork_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctNetwork_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctplatform`
--
ALTER TABLE `fctplatform`
  ADD CONSTRAINT fk_fctPlatform_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPlatform_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPlatform_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsession`
--
ALTER TABLE `fctsession`
  ADD CONSTRAINT fk_fctSession_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSession_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSession_dimVisitor FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsystem`
--
ALTER TABLE `fctsystem`
  ADD CONSTRAINT fk_fctSystem_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSystem_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctSystem_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvisitor`
--
ALTER TABLE `fctvisitor`
  ADD CONSTRAINT fk_fctVisitor_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
