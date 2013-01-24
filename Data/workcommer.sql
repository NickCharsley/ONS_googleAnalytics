-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2013 at 05:48 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.7

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
-- Table structure for table 'dimadwords_one'
--

DROP TABLE IF EXISTS dimadwords_one;
CREATE TABLE dimadwords_one (
  ID int(11) NOT NULL,
  AdGroup varchar(45) DEFAULT NULL,
  AdSlot varchar(45) DEFAULT NULL,
  AdSlotPosition varchar(45) DEFAULT NULL,
  AdPlacementDomain varchar(45) DEFAULT NULL,
  AdPlacementUrl varchar(2048) DEFAULT NULL,
  AdTargetingOption varchar(45) DEFAULT NULL,
  AdDestinationUrl varchar(2048) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimadwords_two'
--

DROP TABLE IF EXISTS dimadwords_two;
CREATE TABLE dimadwords_two (
  ID int(11) NOT NULL,
  AdGroup varchar(45) DEFAULT NULL,
  AdDistributionNetwork varchar(45) DEFAULT NULL,
  AdMatchType varchar(45) DEFAULT NULL,
  AdDestinationUrl varchar(2048) DEFAULT NULL,
  AdwordsCustomerID varchar(45) DEFAULT NULL,
  AdwordsCampaignID varchar(45) DEFAULT NULL,
  AdwordsAdGroupID varchar(45) DEFAULT NULL,
  AdwordsCreativeID varchar(45) DEFAULT NULL,
  AdwordsCriteriaID varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimcustomvar'
--

DROP TABLE IF EXISTS dimcustomvar;
CREATE TABLE dimcustomvar (
  ID int(11) NOT NULL,
  CustomVarName varchar(70) NOT NULL,
  CustomVarValue varchar(70) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY dimCustomVar_indx (CustomVarName,CustomVarValue)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimcustomvar1'
--
DROP VIEW IF EXISTS `dimcustomvar1`;
CREATE TABLE `dimcustomvar1` (
`ID` int(11)
,`CustomVarName1` varchar(70)
,`CustomVarValue1` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimcustomvar2'
--
DROP VIEW IF EXISTS `dimcustomvar2`;
CREATE TABLE `dimcustomvar2` (
`ID` int(11)
,`CustomVarName2` varchar(70)
,`CustomVarValue2` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimcustomvar3'
--
DROP VIEW IF EXISTS `dimcustomvar3`;
CREATE TABLE `dimcustomvar3` (
`ID` int(11)
,`CustomVarName3` varchar(70)
,`CustomVarValue3` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimcustomvar4'
--
DROP VIEW IF EXISTS `dimcustomvar4`;
CREATE TABLE `dimcustomvar4` (
`ID` int(11)
,`CustomVarName4` varchar(70)
,`CustomVarValue4` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimcustomvar5'
--
DROP VIEW IF EXISTS `dimcustomvar5`;
CREATE TABLE `dimcustomvar5` (
`ID` int(11)
,`CustomVarName5` varchar(70)
,`CustomVarValue5` varchar(70)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimdate'
--

DROP TABLE IF EXISTS dimdate;
CREATE TABLE dimdate (
  ID int(11) NOT NULL,
  "Date" date DEFAULT NULL,
  Description varchar(45) DEFAULT NULL,
  "Year" char(4) DEFAULT NULL,
  "Month" char(2) DEFAULT NULL,
  "Week" char(2) DEFAULT NULL,
  "Day" char(2) DEFAULT NULL,
  DayOfWeek char(2) DEFAULT NULL,
  MonthName varchar(15) DEFAULT NULL,
  DayOfWeekName varchar(15) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY Date_UNIQUE ("Date")
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimdaysince'
--

DROP TABLE IF EXISTS dimdaysince;
CREATE TABLE dimdaysince (
  ID int(11) NOT NULL,
  Days int(11) DEFAULT NULL,
  Description varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY Days_UNIQUE (Days)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimdayssincelastvisit'
--
DROP VIEW IF EXISTS `dimdayssincelastvisit`;
CREATE TABLE `dimdayssincelastvisit` (
`ID` int(11)
,`DaysSinceLastVisit` int(11)
,`Description` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimecommerce'
--

DROP TABLE IF EXISTS dimecommerce;
CREATE TABLE dimecommerce (
  ID int(11) NOT NULL,
  TransactionId varchar(70) NOT NULL,
  Affiliation varchar(70) DEFAULT NULL,
  VisitsToTransaction int(11) DEFAULT NULL,
  DaysToTransaction int(11) DEFAULT NULL,
  ProductSku varchar(70) DEFAULT NULL,
  ProductName varchar(70) DEFAULT NULL,
  ProductCategory varchar(70) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimevent'
--

DROP TABLE IF EXISTS dimevent;
CREATE TABLE dimevent (
  ID int(11) NOT NULL,
  EventCategory varchar(70) NOT NULL,
  EventAction varchar(70) NOT NULL,
  EventLabel varchar(70) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY dimEvent_indx (EventCategory,EventAction,EventLabel)
);

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

DROP TABLE IF EXISTS dimgeo;
CREATE TABLE dimgeo (
  ID int(11) NOT NULL,
  Latitude decimal(9,6) NOT NULL,
  Longitude decimal(9,6) NOT NULL,
  City varchar(45) NOT NULL,
  Country varchar(45) NOT NULL,
  Continent varchar(45) NOT NULL,
  SubContinent varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY dimGeo_indx (Latitude,Longitude,City,Country)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimgoal'
--

DROP TABLE IF EXISTS dimgoal;
CREATE TABLE dimgoal (
  ID int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  GoalNumber int(11) NOT NULL,
  GoalLabel varchar(70) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY dimEvent_indx (dimProfile,GoalNumber,GoalLabel),
  KEY fk_dimGoal_dimProfile_idx (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimhostname'
--

DROP TABLE IF EXISTS dimhostname;
CREATE TABLE dimhostname (
  ID int(11) NOT NULL,
  Hostname varchar(512) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimHostName (Hostname)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimhour'
--

DROP TABLE IF EXISTS dimhour;
CREATE TABLE dimhour (
  ID int(11) NOT NULL,
  "Hour" varchar(2) NOT NULL,
  Description varchar(45) NOT NULL,
  StartTime datetime NOT NULL,
  EndTime datetime NOT NULL,
  PRIMARY KEY (ID)
);

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

DROP TABLE IF EXISTS dimmobile;
CREATE TABLE dimmobile (
  ID int(11) NOT NULL,
  IsMobile varchar(45) NOT NULL,
  MobileDeviceBranding varchar(45) NOT NULL,
  MobileDeviceModel varchar(45) NOT NULL,
  MobileInputSelector varchar(45) NOT NULL,
  MobileDeviceInfo varchar(45) NOT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimnetwork'
--

DROP TABLE IF EXISTS dimnetwork;
CREATE TABLE dimnetwork (
  ID int(11) NOT NULL,
  NetworkDomain varchar(45) NOT NULL,
  NetworkLocation varchar(512) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimNetwork (NetworkDomain,NetworkLocation)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimnextpagepath'
--
DROP VIEW IF EXISTS `dimnextpagepath`;
CREATE TABLE `dimnextpagepath` (
`ID` int(11)
,`NextPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimpagedepth'
--

DROP TABLE IF EXISTS dimpagedepth;
CREATE TABLE dimpagedepth (
  ID int(11) NOT NULL,
  PageDepth int(11) DEFAULT NULL,
  Description varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY PageDepth_UNIQUE (PageDepth)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimpagepath'
--

DROP TABLE IF EXISTS dimpagepath;
CREATE TABLE dimpagepath (
  ID int(11) NOT NULL,
  PagePath varchar(4096) NOT NULL,
  PageType varchar(45) NOT NULL DEFAULT 'Unknown',
  HasShortcode int(11) NOT NULL DEFAULT '0',
  Shortcode varchar(1024) DEFAULT NULL,
  hasURN int(11) NOT NULL DEFAULT '0',
  URN varchar(24) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimpagepathlevel1'
--
DROP VIEW IF EXISTS `dimpagepathlevel1`;
CREATE TABLE `dimpagepathlevel1` (
`ID` int(11)
,`PagePathLevel1` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimpagepathlevel2'
--
DROP VIEW IF EXISTS `dimpagepathlevel2`;
CREATE TABLE `dimpagepathlevel2` (
`ID` int(11)
,`PagePathLevel2` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimpagepathlevel3'
--
DROP VIEW IF EXISTS `dimpagepathlevel3`;
CREATE TABLE `dimpagepathlevel3` (
`ID` int(11)
,`PagePathLevel3` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimpagepathlevel4'
--
DROP VIEW IF EXISTS `dimpagepathlevel4`;
CREATE TABLE `dimpagepathlevel4` (
`ID` int(11)
,`PagePathLevel4` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimplatform'
--

DROP TABLE IF EXISTS dimplatform;
CREATE TABLE dimplatform (
  ID int(11) NOT NULL,
  Browser varchar(45) NOT NULL,
  BrowserVersion varchar(45) NOT NULL,
  OperatingSystem varchar(45) NOT NULL,
  OperatingSystemVersion varchar(45) NOT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimpreviouspagepath'
--
DROP VIEW IF EXISTS `dimpreviouspagepath`;
CREATE TABLE `dimpreviouspagepath` (
`ID` int(11)
,`PreviousPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimproduct'
--
DROP VIEW IF EXISTS `dimproduct`;
CREATE TABLE `dimproduct` (
`ID` int(11)
,`TransactionId` varchar(70)
,`ProductSku` varchar(70)
,`ProductName` varchar(70)
,`ProductCategory` varchar(70)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimprofile'
--

DROP TABLE IF EXISTS dimprofile;
CREATE TABLE dimprofile (
  ID int(11) NOT NULL,
  ProfileName varchar(45) NOT NULL DEFAULT 'Unknown',
  WebPropertyID varchar(45) NOT NULL,
  Currency varchar(45) NOT NULL,
  WebsiteURL varchar(45) NOT NULL,
  "Type" varchar(45) NOT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimsecondpagepath'
--
DROP VIEW IF EXISTS `dimsecondpagepath`;
CREATE TABLE `dimsecondpagepath` (
`ID` int(11)
,`SecondPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimsession'
--

DROP TABLE IF EXISTS dimsession;
CREATE TABLE dimsession (
  ID int(11) NOT NULL,
  VisitLength int(11) NOT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimsocialtraffic'
--

DROP TABLE IF EXISTS dimsocialtraffic;
CREATE TABLE dimsocialtraffic (
  ID int(11) NOT NULL,
  SocialNetwork varchar(45) DEFAULT NULL,
  HasSocialSourceReferral varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimsystem'
--

DROP TABLE IF EXISTS dimsystem;
CREATE TABLE dimsystem (
  ID int(11) NOT NULL,
  FlashVersion varchar(45) NOT NULL,
  JavaEnabled varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  ScreenColors varchar(45) NOT NULL,
  ScreenResolution varchar(45) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimSystem (FlashVersion,JavaEnabled,"Language",ScreenColors,ScreenResolution)
);

-- --------------------------------------------------------

--
-- Table structure for table 'dimtraffic'
--

DROP TABLE IF EXISTS dimtraffic;
CREATE TABLE dimtraffic (
  ID int(11) NOT NULL,
  Campaign varchar(45) DEFAULT NULL,
  "Source" varchar(45) DEFAULT NULL,
  Keyword varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimtransaction'
--
DROP VIEW IF EXISTS `dimtransaction`;
CREATE TABLE `dimtransaction` (
`ID` int(11)
,`TransactionId` varchar(70)
,`Affiliation` varchar(70)
,`VisitsToTransaction` int(11)
,`DaysToTransaction` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view 'dimvanquissession'
--
DROP VIEW IF EXISTS `dimvanquissession`;
CREATE TABLE `dimvanquissession` (
`ID` int(11)
,`CustomVarName1` varchar(70)
,`CustomVarValue1` varchar(70)
,`SessionID` varchar(70)
);
-- --------------------------------------------------------

--
-- Table structure for table 'dimvisitor'
--

DROP TABLE IF EXISTS dimvisitor;
CREATE TABLE dimvisitor (
  ID int(11) NOT NULL,
  VisitCount int(11) DEFAULT NULL,
  VisitorType varchar(45) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_VisitCount (VisitCount)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctadwords_one'
--

DROP TABLE IF EXISTS fctadwords_one;
CREATE TABLE fctadwords_one (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimAdwords_one int(11) NOT NULL,
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
  PRIMARY KEY (ID),
  KEY fk_fctAdwords_one_dimDate_idx (dimDate),
  KEY fk_fctAdwords_one_dimAdwords_one_idx (dimAdwords_one)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctadwords_two'
--

DROP TABLE IF EXISTS fctadwords_two;
CREATE TABLE fctadwords_two (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimAdwords_two int(11) NOT NULL,
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
  PRIMARY KEY (ID),
  KEY fk_fctAdwords_two_dimDate_idx (dimDate),
  KEY fk_fctAdwords_two_dimAdwords_two_idx (dimAdwords_two)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar'
--

DROP TABLE IF EXISTS fctcustomvar;
CREATE TABLE fctcustomvar (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar1 int(11) NOT NULL,
  dimCustomVar2 int(11) NOT NULL,
  dimCustomVar3 int(11) NOT NULL,
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
  KEY fk_fctCustomVar_dimCustomVar1 (dimCustomVar1),
  KEY fk_fctCustomVar_dimCustomVar2 (dimCustomVar2),
  KEY fk_fctCustomVar_dimCustomVar3 (dimCustomVar3),
  KEY fk_fctCustomVar_dimDate (dimDate),
  KEY fk_fctCustomVar_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar1'
--

DROP TABLE IF EXISTS fctcustomvar1;
CREATE TABLE fctcustomvar1 (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar1 int(11) NOT NULL,
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
  KEY fk_fctCustomVar1_dimCustomVar1 (dimCustomVar1),
  KEY fk_fctCustomVar1_dimDate (dimDate),
  KEY fk_fctCustomVar1_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar2'
--

DROP TABLE IF EXISTS fctcustomvar2;
CREATE TABLE fctcustomvar2 (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar2 int(11) NOT NULL,
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
  KEY fk_fctCustomVar2_dimCustomVar2 (dimCustomVar2),
  KEY fk_fctCustomVar2_dimDate (dimDate),
  KEY fk_fctCustomVar2_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar3'
--

DROP TABLE IF EXISTS fctcustomvar3;
CREATE TABLE fctcustomvar3 (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar3 int(11) NOT NULL,
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
  KEY fk_fctCustomVar3_dimCustomVar3 (dimCustomVar3),
  KEY fk_fctCustomVar3_dimDate (dimDate),
  KEY fk_fctCustomVar3_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar4'
--

DROP TABLE IF EXISTS fctcustomvar4;
CREATE TABLE fctcustomvar4 (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar4 int(11) NOT NULL,
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
  KEY fk_fctCustomVar4_dimCustomVar4 (dimCustomVar4),
  KEY fk_fctCustomVar4_dimDate (dimDate),
  KEY fk_fctCustomVar4_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctcustomvar5'
--

DROP TABLE IF EXISTS fctcustomvar5;
CREATE TABLE fctcustomvar5 (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimCustomVar5 int(11) NOT NULL,
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
  KEY fk_fctCustomVar5_dimCustomVar5 (dimCustomVar5),
  KEY fk_fctCustomVar5_dimDate (dimDate),
  KEY fk_fctCustomVar5_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctdate'
--

DROP TABLE IF EXISTS fctdate;
CREATE TABLE fctdate (
  ID int(11) NOT NULL,
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
  Impressions int(11) NOT NULL DEFAULT '0',
  AdClicks int(11) NOT NULL DEFAULT '0',
  AdCost float NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal5Completions int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal16Completions int(11) NOT NULL DEFAULT '0',
  Goal17Completions int(11) NOT NULL DEFAULT '0',
  Goal18Completions int(11) NOT NULL DEFAULT '0',
  Goal19Completions int(11) NOT NULL DEFAULT '0',
  Goal20Completions int(11) NOT NULL DEFAULT '0',
  Goal1Starts int(11) NOT NULL DEFAULT '0',
  Goal2Starts int(11) NOT NULL DEFAULT '0',
  Goal3Starts int(11) NOT NULL DEFAULT '0',
  Goal4Starts int(11) NOT NULL DEFAULT '0',
  Goal5Starts int(11) NOT NULL DEFAULT '0',
  Goal6Starts int(11) NOT NULL DEFAULT '0',
  Goal7Starts int(11) NOT NULL DEFAULT '0',
  Goal8Starts int(11) NOT NULL DEFAULT '0',
  Goal9Starts int(11) NOT NULL DEFAULT '0',
  Goal10Starts int(11) NOT NULL DEFAULT '0',
  Goal11Starts int(11) NOT NULL DEFAULT '0',
  Goal12Starts int(11) NOT NULL DEFAULT '0',
  Goal13Starts int(11) NOT NULL DEFAULT '0',
  Goal14Starts int(11) NOT NULL DEFAULT '0',
  Goal15Starts int(11) NOT NULL DEFAULT '0',
  Goal16Starts int(11) NOT NULL DEFAULT '0',
  Goal17Starts int(11) NOT NULL DEFAULT '0',
  Goal18Starts int(11) NOT NULL DEFAULT '0',
  Goal19Starts int(11) NOT NULL DEFAULT '0',
  Goal20Starts int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimDate (dimDate,dimProfile),
  KEY fk_fctDate_dimDate_idx (dimDate),
  KEY fk_fctDate_dimProfile_idx (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctdevice'
--

DROP TABLE IF EXISTS fctdevice;
CREATE TABLE fctdevice (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctecommerce'
--

DROP TABLE IF EXISTS fctecommerce;
CREATE TABLE fctecommerce (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimEcommerce int(11) NOT NULL,
  ItemQuantity int(11) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY indx_fctEcommerce (dimDate,dimProfile,dimEcommerce),
  KEY fk_fctEcommerce_dimDate_idx (dimDate),
  KEY fk_fctEcommerce_dimProfile_idx (dimProfile),
  KEY fk_fctEcommerce_dimTransaction_idx (dimEcommerce)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctevent'
--

DROP TABLE IF EXISTS fctevent;
CREATE TABLE fctevent (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimEvent int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  totalEvents int(11) NOT NULL DEFAULT '0',
  uniqueEvents int(11) NOT NULL DEFAULT '0',
  eventValue int(11) NOT NULL DEFAULT '0',
  visitsWithEvent int(11) NOT NULL DEFAULT '0',
  eventsPerVisitWithEvent int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY indx_dimEvent (dimDate,dimProfile,dimEvent),
  KEY fk_dimEvent_dimDate_idx (dimDate),
  KEY fk_dimEvent_dimProfile_idx (dimProfile),
  KEY fk_fctdimEvent_dimEvent_idx (dimEvent)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctexitpagepath'
--

DROP TABLE IF EXISTS fctexitpagepath;
CREATE TABLE fctexitpagepath (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimLandingPagePath int(11) NOT NULL,
  dimExitPagePath int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimDaysSinceLastVisit int(11) NOT NULL,
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
  UNIQUE KEY indx_dimExitPagePath (dimDate,dimProfile,dimExitPagePath,dimLandingPagePath,dimVisitor,dimDaysSinceLastVisit),
  KEY fk_fctExitPagePath_dimDate_idx (dimDate),
  KEY fk_fctExitPagePath_dimDaysSinceLastVisit_idx (dimDaysSinceLastVisit),
  KEY fk_fctExitPagePath_dimProfile_idx (dimProfile),
  KEY fk_fctExitPagePath_dimVisitor_idx (dimVisitor),
  KEY fk_fctExitPagePath_dimLandingPagePath_idx (dimLandingPagePath),
  KEY fk_fctExitPagePath_dimExitPagePath_idx (dimExitPagePath)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctform'
--

DROP TABLE IF EXISTS fctform;
CREATE TABLE fctform (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctgeo'
--

DROP TABLE IF EXISTS fctgeo;
CREATE TABLE fctgeo (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctgoaltraffic'
--

DROP TABLE IF EXISTS fctgoaltraffic;
CREATE TABLE fctgoaltraffic (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimTraffic int(11) NOT NULL,
  dimGoal int(11) NOT NULL,
  GoalCompletions int(11) NOT NULL DEFAULT '0',
  GoalStarts int(11) NOT NULL DEFAULT '0',
  GoalAbandons int(11) NOT NULL DEFAULT '0',
  GoalValue int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctGoalTraffic_dimDate (dimDate),
  KEY fk_fctGoalTraffic_dimGoal (dimGoal),
  KEY fk_fctGoalTraffic_dimProfile (dimProfile),
  KEY fk_fctGoalTraffic_dimTraffic (dimTraffic)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fcthostname'
--

DROP TABLE IF EXISTS fcthostname;
CREATE TABLE fcthostname (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctlandingpagepath'
--

DROP TABLE IF EXISTS fctlandingpagepath;
CREATE TABLE fctlandingpagepath (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctloanhistory'
--

DROP TABLE IF EXISTS fctloanhistory;
CREATE TABLE fctloanhistory (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctmobile'
--

DROP TABLE IF EXISTS fctmobile;
CREATE TABLE fctmobile (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctnetwork'
--

DROP TABLE IF EXISTS fctnetwork;
CREATE TABLE fctnetwork (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctpagetracking'
--

DROP TABLE IF EXISTS fctpagetracking;
CREATE TABLE fctpagetracking (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimHostname int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimPageDepth int(11) NOT NULL,
  dimLandingPagePath int(11) NOT NULL,
  dimSecondPagePath int(11) NOT NULL,
  dimPagePath int(11) NOT NULL,
  dimNextPagePath int(11) NOT NULL,
  dimPreviousPagePath int(11) NOT NULL,
  dimExitPagePath int(11) NOT NULL,
  Entrances int(11) NOT NULL,
  Pageviews int(11) NOT NULL,
  UniquePageviews int(11) NOT NULL,
  TimeOnPage int(11) NOT NULL,
  Exits int(11) NOT NULL,
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal5Completions int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal16Completions int(11) NOT NULL DEFAULT '0',
  Goal17Completions int(11) NOT NULL DEFAULT '0',
  Goal18Completions int(11) NOT NULL DEFAULT '0',
  Goal19Completions int(11) NOT NULL DEFAULT '0',
  Goal20Completions int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctPageTracking_dimDate (dimDate),
  KEY fk_fctPageTracking_dimProfile (dimProfile),
  KEY fk_fctPageTracking_dimHostname (dimHostname),
  KEY fk_fctPageTracking_dimVisitor (dimVisitor),
  KEY fk_fctPageTracking_dimPageDepth (dimPageDepth),
  KEY fk_fctPageTracking_dimLandingPagePath (dimLandingPagePath),
  KEY fk_fctPageTracking_dimSecondPagePath (dimSecondPagePath),
  KEY fk_fctPageTracking_dimPagePath (dimPagePath),
  KEY fk_fctPageTracking_dimNextPagePath (dimNextPagePath),
  KEY fk_fctPageTracking_dimPreviousPagePath (dimPreviousPagePath),
  KEY fk_fctPageTracking_dimExitPagePath (dimExitPagePath)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctplatform'
--

DROP TABLE IF EXISTS fctplatform;
CREATE TABLE fctplatform (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctsession'
--

DROP TABLE IF EXISTS fctsession;
CREATE TABLE fctsession (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctsystem'
--

DROP TABLE IF EXISTS fctsystem;
CREATE TABLE fctsystem (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fcttraffic'
--

DROP TABLE IF EXISTS fcttraffic;
CREATE TABLE fcttraffic (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimTraffic int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnPage int(11) NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  Impressions int(11) NOT NULL DEFAULT '0',
  AdClicks int(11) NOT NULL DEFAULT '0',
  AdCost float NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnSite int(11) NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal1Starts int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal2Starts int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal3Starts int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal4Starts int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal6Starts int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal7Starts int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal8Starts int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal9Starts int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal10Starts int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal11Starts int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal12Starts int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal13Starts int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal14Starts int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal15Starts int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctTraffic_dimDate (dimDate),
  KEY fk_fctTraffic_dimProfile (dimProfile),
  KEY fk_fctTraffic_dimTraffic (dimTraffic)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvanquissession'
--

DROP TABLE IF EXISTS fctvanquissession;
CREATE TABLE fctvanquissession (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
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
  PageLoadTime int(11) NOT NULL DEFAULT '0',
  PageLoadSample int(11) NOT NULL DEFAULT '0',
  DomainLookupTime int(11) NOT NULL DEFAULT '0',
  PageDownloadTime int(11) NOT NULL DEFAULT '0',
  RedirectionTime int(11) NOT NULL DEFAULT '0',
  ServerConnectionTime int(11) NOT NULL DEFAULT '0',
  ServerResponseTime int(11) NOT NULL DEFAULT '0',
  SpeedMetricsSample int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctVanquisSession_dimVanquisSession (dimVanquisSession),
  KEY fk_fctVanquisSession_dimDate (dimDate),
  KEY fk_fctVanquisSession_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvisitor'
--

DROP TABLE IF EXISTS fctvisitor;
CREATE TABLE fctvisitor (
  ID int(11) NOT NULL,
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
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvsdevice'
--

DROP TABLE IF EXISTS fctvsdevice;
CREATE TABLE fctvsdevice (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimHour int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimGeo int(11) NOT NULL,
  dimPlatform int(11) NOT NULL,
  dimSystem int(11) NOT NULL,
  dimNetwork int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctvsDevice_dimDate (dimDate),
  KEY fk_fctvsDevice_dimGeo (dimGeo),
  KEY fk_fctvsDevice_dimHour (dimHour),
  KEY fk_fctvsDevice_dimNetwork (dimNetwork),
  KEY fk_fctvsDevice_dimPlatform (dimPlatform),
  KEY fk_fctvsDevice_dimProfile (dimProfile),
  KEY fk_fctvsDevice_dimSystem (dimSystem),
  KEY fk_fctvsDevice_dimVisitor (dimVisitor),
  KEY fk_fctvsDevice_dimVanquisSession (dimVanquisSession)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvsecommerce'
--

DROP TABLE IF EXISTS fctvsecommerce;
CREATE TABLE fctvsecommerce (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimEcommerce int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
  ItemQuantity int(11) NOT NULL,
  PRIMARY KEY (ID),
  KEY fk_fctvsEcommerce_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsEcommerce_dimDate (dimDate),
  KEY fk_fctvsEcommerce_dimEcommerce (dimEcommerce),
  KEY fk_fctvsEcommerce_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvsevent'
--

DROP TABLE IF EXISTS fctvsevent;
CREATE TABLE fctvsevent (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimEvent int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  Visitors int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnSite float NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  Entrances int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  TimeOnPage float NOT NULL DEFAULT '0',
  Exits int(11) NOT NULL DEFAULT '0',
  totalEvents int(11) NOT NULL DEFAULT '0',
  uniqueEvents int(11) NOT NULL DEFAULT '0',
  eventValue int(11) NOT NULL DEFAULT '0',
  visitsWithEvent int(11) NOT NULL DEFAULT '0',
  eventsPerVisitWithEvent int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctvsEvent_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsEvent_dimDate (dimDate),
  KEY fk_fctvsEvent_dimEvent (dimEvent),
  KEY fk_fctvsEvent_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvsgeo'
--

DROP TABLE IF EXISTS fctvsgeo;
CREATE TABLE fctvsgeo (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimGeo int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
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
  KEY fk_fctvsGeo_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsGeo_dimDate (dimDate),
  KEY fk_fctvsGeo_dimGeo (dimGeo),
  KEY fk_fctvsGeo_dimProfile (dimProfile)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvspagetracking'
--

DROP TABLE IF EXISTS fctvspagetracking;
CREATE TABLE fctvspagetracking (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimHostname int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimPageDepth int(11) NOT NULL,
  dimLandingPagePath int(11) NOT NULL,
  dimSecondPagePath int(11) NOT NULL,
  dimPagePath int(11) NOT NULL,
  dimNextPagePath int(11) NOT NULL,
  dimPreviousPagePath int(11) NOT NULL,
  dimExitPagePath int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
  Entrances int(11) NOT NULL,
  Pageviews int(11) NOT NULL,
  UniquePageviews int(11) NOT NULL,
  TimeOnPage int(11) NOT NULL,
  Exits int(11) NOT NULL,
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  GoalAbandonsAll int(11) NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal5Completions int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal16Completions int(11) NOT NULL DEFAULT '0',
  Goal17Completions int(11) NOT NULL DEFAULT '0',
  Goal18Completions int(11) NOT NULL DEFAULT '0',
  Goal19Completions int(11) NOT NULL DEFAULT '0',
  Goal20Completions int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctvsPageTracking_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsPageTracking_dimDate (dimDate),
  KEY fk_fctvsPageTracking_dimExitPagePath (dimExitPagePath),
  KEY fk_fctvsPageTracking_dimHostname (dimHostname),
  KEY fk_fctvsPageTracking_dimLandingPagePath (dimLandingPagePath),
  KEY fk_fctvsPageTracking_dimNextPagePath (dimNextPagePath),
  KEY fk_fctvsPageTracking_dimPageDepth (dimPageDepth),
  KEY fk_fctvsPageTracking_dimPagePath (dimPagePath),
  KEY fk_fctvsPageTracking_dimPreviousPagePath (dimPreviousPagePath),
  KEY fk_fctvsPageTracking_dimProfile (dimProfile),
  KEY fk_fctvsPageTracking_dimSecondPagePath (dimSecondPagePath),
  KEY fk_fctvsPageTracking_dimVisitor (dimVisitor)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvssystem'
--

DROP TABLE IF EXISTS fctvssystem;
CREATE TABLE fctvssystem (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimSystem int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
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
  KEY fk_fctvsSystem_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsSystem_dimDate (dimDate),
  KEY fk_fctvsSystem_dimProfile (dimProfile),
  KEY fk_fctvsSystem_dimSystem (dimSystem)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvstraffic'
--

DROP TABLE IF EXISTS fctvstraffic;
CREATE TABLE fctvstraffic (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimTraffic int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
  Visits int(11) NOT NULL DEFAULT '0',
  NewVisits int(11) NOT NULL DEFAULT '0',
  Bounces int(11) NOT NULL DEFAULT '0',
  TimeOnPage int(11) NOT NULL DEFAULT '0',
  OrganicSearches int(11) NOT NULL DEFAULT '0',
  Pageviews int(11) NOT NULL DEFAULT '0',
  UniquePageviews int(11) NOT NULL DEFAULT '0',
  TimeOnSite int(11) NOT NULL DEFAULT '0',
  Goal1Completions int(11) NOT NULL DEFAULT '0',
  Goal1Starts int(11) NOT NULL DEFAULT '0',
  Goal2Completions int(11) NOT NULL DEFAULT '0',
  Goal2Starts int(11) NOT NULL DEFAULT '0',
  Goal3Completions int(11) NOT NULL DEFAULT '0',
  Goal3Starts int(11) NOT NULL DEFAULT '0',
  Goal4Completions int(11) NOT NULL DEFAULT '0',
  Goal4Starts int(11) NOT NULL DEFAULT '0',
  Goal6Completions int(11) NOT NULL DEFAULT '0',
  Goal6Starts int(11) NOT NULL DEFAULT '0',
  Goal7Completions int(11) NOT NULL DEFAULT '0',
  Goal7Starts int(11) NOT NULL DEFAULT '0',
  Goal8Completions int(11) NOT NULL DEFAULT '0',
  Goal8Starts int(11) NOT NULL DEFAULT '0',
  Goal9Completions int(11) NOT NULL DEFAULT '0',
  Goal9Starts int(11) NOT NULL DEFAULT '0',
  Goal10Completions int(11) NOT NULL DEFAULT '0',
  Goal10Starts int(11) NOT NULL DEFAULT '0',
  Goal11Completions int(11) NOT NULL DEFAULT '0',
  Goal11Starts int(11) NOT NULL DEFAULT '0',
  Goal12Completions int(11) NOT NULL DEFAULT '0',
  Goal12Starts int(11) NOT NULL DEFAULT '0',
  Goal13Completions int(11) NOT NULL DEFAULT '0',
  Goal13Starts int(11) NOT NULL DEFAULT '0',
  Goal14Completions int(11) NOT NULL DEFAULT '0',
  Goal14Starts int(11) NOT NULL DEFAULT '0',
  Goal15Completions int(11) NOT NULL DEFAULT '0',
  Goal15Starts int(11) NOT NULL DEFAULT '0',
  GoalCompletionsAll int(11) NOT NULL DEFAULT '0',
  GoalStartsAll int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  KEY fk_fctvsTraffic_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsTraffic_dimDate (dimDate),
  KEY fk_fctvsTraffic_dimProfile (dimProfile),
  KEY fk_fctvsTraffic_dimTraffic (dimTraffic)
);

-- --------------------------------------------------------

--
-- Table structure for table 'fctvsvisitor'
--

DROP TABLE IF EXISTS fctvsvisitor;
CREATE TABLE fctvsvisitor (
  ID int(11) NOT NULL,
  dimDate int(11) NOT NULL,
  dimProfile int(11) NOT NULL,
  dimVisitor int(11) NOT NULL,
  dimDaysSinceLastVisit int(11) NOT NULL,
  dimVanquisSession int(11) NOT NULL,
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
  KEY fk_fctvsVisitor_dimDaysSinceLastVisit (dimDaysSinceLastVisit),
  KEY fk_fctvsVisitor_dimVanquisSession (dimVanquisSession),
  KEY fk_fctvsVisitor_dimDate (dimDate),
  KEY fk_fctvsVisitor_dimProfile (dimProfile),
  KEY fk_fctvsVisitor_dimVisitor (dimVisitor)
);

-- --------------------------------------------------------

--
-- Structure for view 'dimcustomvar1'
--
DROP TABLE IF EXISTS `dimcustomvar1`;

CREATE VIEW workcommer.dimcustomvar1 AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName1,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue1 from workcommer.dimcustomvar;

-- --------------------------------------------------------

--
-- Structure for view 'dimcustomvar2'
--
DROP TABLE IF EXISTS `dimcustomvar2`;

CREATE VIEW workcommer.dimcustomvar2 AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName2,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue2 from workcommer.dimcustomvar;

-- --------------------------------------------------------

--
-- Structure for view 'dimcustomvar3'
--
DROP TABLE IF EXISTS `dimcustomvar3`;

CREATE VIEW workcommer.dimcustomvar3 AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName3,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue3 from workcommer.dimcustomvar;

-- --------------------------------------------------------

--
-- Structure for view 'dimcustomvar4'
--
DROP TABLE IF EXISTS `dimcustomvar4`;

CREATE VIEW workcommer.dimcustomvar4 AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName4,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue4 from workcommer.dimcustomvar;

-- --------------------------------------------------------

--
-- Structure for view 'dimcustomvar5'
--
DROP TABLE IF EXISTS `dimcustomvar5`;

CREATE VIEW workcommer.dimcustomvar5 AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName5,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue5 from workcommer.dimcustomvar;

-- --------------------------------------------------------

--
-- Structure for view 'dimdayssincelastvisit'
--
DROP TABLE IF EXISTS `dimdayssincelastvisit`;

CREATE VIEW workcommer.dimdayssincelastvisit AS select workcommer.dimdaysince.ID AS ID,workcommer.dimdaysince.Days AS DaysSinceLastVisit,workcommer.dimdaysince.Description AS Description from workcommer.dimdaysince;

-- --------------------------------------------------------

--
-- Structure for view 'dimexitpagepath'
--
DROP TABLE IF EXISTS `dimexitpagepath`;

CREATE VIEW workcommer.dimexitpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS ExitPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimlandingpagepath'
--
DROP TABLE IF EXISTS `dimlandingpagepath`;

CREATE VIEW workcommer.dimlandingpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS LandingPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimnextpagepath'
--
DROP TABLE IF EXISTS `dimnextpagepath`;

CREATE VIEW workcommer.dimnextpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS NextPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimpagepathlevel1'
--
DROP TABLE IF EXISTS `dimpagepathlevel1`;

CREATE VIEW workcommer.dimpagepathlevel1 AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS PagePathLevel1 from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimpagepathlevel2'
--
DROP TABLE IF EXISTS `dimpagepathlevel2`;

CREATE VIEW workcommer.dimpagepathlevel2 AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS PagePathLevel2 from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimpagepathlevel3'
--
DROP TABLE IF EXISTS `dimpagepathlevel3`;

CREATE VIEW workcommer.dimpagepathlevel3 AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS PagePathLevel3 from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimpagepathlevel4'
--
DROP TABLE IF EXISTS `dimpagepathlevel4`;

CREATE VIEW workcommer.dimpagepathlevel4 AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS PagePathLevel4 from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimpreviouspagepath'
--
DROP TABLE IF EXISTS `dimpreviouspagepath`;

CREATE VIEW workcommer.dimpreviouspagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS PreviousPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimproduct'
--
DROP TABLE IF EXISTS `dimproduct`;

CREATE VIEW workcommer.dimproduct AS select workcommer.dimecommerce.ID AS ID,workcommer.dimecommerce.TransactionId AS TransactionId,workcommer.dimecommerce.ProductSku AS ProductSku,workcommer.dimecommerce.ProductName AS ProductName,workcommer.dimecommerce.ProductCategory AS ProductCategory from workcommer.dimecommerce;

-- --------------------------------------------------------

--
-- Structure for view 'dimsecondpagepath'
--
DROP TABLE IF EXISTS `dimsecondpagepath`;

CREATE VIEW workcommer.dimsecondpagepath AS select workcommer.dimpagepath.ID AS ID,workcommer.dimpagepath.PagePath AS SecondPagePath from workcommer.dimpagepath;

-- --------------------------------------------------------

--
-- Structure for view 'dimtransaction'
--
DROP TABLE IF EXISTS `dimtransaction`;

CREATE VIEW workcommer.dimtransaction AS select workcommer.dimecommerce.ID AS ID,workcommer.dimecommerce.TransactionId AS TransactionId,workcommer.dimecommerce.Affiliation AS Affiliation,workcommer.dimecommerce.VisitsToTransaction AS VisitsToTransaction,workcommer.dimecommerce.DaysToTransaction AS DaysToTransaction from workcommer.dimecommerce;

-- --------------------------------------------------------

--
-- Structure for view 'dimvanquissession'
--
DROP TABLE IF EXISTS `dimvanquissession`;

CREATE VIEW workcommer.dimvanquissession AS select workcommer.dimcustomvar.ID AS ID,workcommer.dimcustomvar.CustomVarName AS CustomVarName1,workcommer.dimcustomvar.CustomVarValue AS CustomVarValue1,workcommer.dimcustomvar.CustomVarValue AS SessionID from workcommer.dimcustomvar where (workcommer.dimcustomvar.CustomVarName = 'SessionId');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dimgoal`
--
ALTER TABLE `dimgoal`
  ADD CONSTRAINT fk_dimGoal_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctadwords_one`
--
ALTER TABLE `fctadwords_one`
  ADD CONSTRAINT fk_fctAdwords_one_dimAdwords_one FOREIGN KEY (dimAdwords_one) REFERENCES dimadwords_one (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctAdwords_one_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctadwords_two`
--
ALTER TABLE `fctadwords_two`
  ADD CONSTRAINT fk_fctAdwords_two_dimAdwords_two FOREIGN KEY (dimAdwords_two) REFERENCES dimadwords_two (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctAdwords_two_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar`
--
ALTER TABLE `fctcustomvar`
  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar1 FOREIGN KEY (dimCustomVar1) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar2 FOREIGN KEY (dimCustomVar2) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar3 FOREIGN KEY (dimCustomVar3) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar1`
--
ALTER TABLE `fctcustomvar1`
  ADD CONSTRAINT fk_fctCustomVar1_dimCustomVar1 FOREIGN KEY (dimCustomVar1) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar1_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar1_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar2`
--
ALTER TABLE `fctcustomvar2`
  ADD CONSTRAINT fk_fctCustomVar2_dimCustomVar2 FOREIGN KEY (dimCustomVar2) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar2_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar2_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar3`
--
ALTER TABLE `fctcustomvar3`
  ADD CONSTRAINT fk_fctCustomVar3_dimCustomVar3 FOREIGN KEY (dimCustomVar3) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar3_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar3_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar4`
--
ALTER TABLE `fctcustomvar4`
  ADD CONSTRAINT fk_fctCustomVar4_dimCustomVar4 FOREIGN KEY (dimCustomVar4) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar4_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar4_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar5`
--
ALTER TABLE `fctcustomvar5`
  ADD CONSTRAINT fk_fctCustomVar5_dimCustomVar5 FOREIGN KEY (dimCustomVar5) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar5_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctCustomVar5_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `fctecommerce`
--
ALTER TABLE `fctecommerce`
  ADD CONSTRAINT fk_fctEcommerce_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctEcommerce_dimEcommerce FOREIGN KEY (dimEcommerce) REFERENCES dimecommerce (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctEcommerce_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctevent`
--
ALTER TABLE `fctevent`
  ADD CONSTRAINT fk_fctEvent_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctEvent_dimEvent FOREIGN KEY (dimEvent) REFERENCES dimevent (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctEvent_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctexitpagepath`
--
ALTER TABLE `fctexitpagepath`
  ADD CONSTRAINT fk_fctExitPagePath_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctExitPagePath_dimDaysSinceLastVisit FOREIGN KEY (dimDaysSinceLastVisit) REFERENCES dimdaysince (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctExitPagePath_dimExitPagePath FOREIGN KEY (dimExitPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctExitPagePath_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctExitPagePath_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctExitPagePath_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `fctgoaltraffic`
--
ALTER TABLE `fctgoaltraffic`
  ADD CONSTRAINT fk_fctGoalTraffic_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGoalTraffic_dimGoal FOREIGN KEY (dimGoal) REFERENCES dimgoal (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGoalTraffic_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctGoalTraffic_dimTraffic FOREIGN KEY (dimTraffic) REFERENCES dimtraffic (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `fctpagetracking`
--
ALTER TABLE `fctpagetracking`
  ADD CONSTRAINT fk_fctPageTracking_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimExitPagePath FOREIGN KEY (dimExitPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimNextPagePath FOREIGN KEY (dimNextPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimPageDepth FOREIGN KEY (dimPageDepth) REFERENCES dimpagedepth (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimPreviousPagePath FOREIGN KEY (dimPreviousPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimSecondPagePath FOREIGN KEY (dimSecondPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctPageTracking_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `fcttraffic`
--
ALTER TABLE `fcttraffic`
  ADD CONSTRAINT fk_fctTraffic_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctTraffic_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctTraffic_dimTraffic FOREIGN KEY (dimTraffic) REFERENCES dimtraffic (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvanquissession`
--
ALTER TABLE `fctvanquissession`
  ADD CONSTRAINT fk_fctVanquisSession_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVanquisSession_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVanquisSession_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvisitor`
--
ALTER TABLE `fctvisitor`
  ADD CONSTRAINT fk_fctVisitor_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctVisitor_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvsdevice`
--
ALTER TABLE `fctvsdevice`
  ADD CONSTRAINT fk_fctvsDevice_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimHour FOREIGN KEY (dimHour) REFERENCES dimhour (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsDevice_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvsecommerce`
--
ALTER TABLE `fctvsecommerce`
  ADD CONSTRAINT fk_fctvsEcommerce_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEcommerce_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEcommerce_dimEcommerce FOREIGN KEY (dimEcommerce) REFERENCES dimecommerce (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEcommerce_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvsevent`
--
ALTER TABLE `fctvsevent`
  ADD CONSTRAINT fk_fctvsEvent_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEvent_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEvent_dimEvent FOREIGN KEY (dimEvent) REFERENCES dimevent (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsEvent_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvsgeo`
--
ALTER TABLE `fctvsgeo`
  ADD CONSTRAINT fk_fctvsGeo_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsGeo_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsGeo_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsGeo_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvspagetracking`
--
ALTER TABLE `fctvspagetracking`
  ADD CONSTRAINT fk_fctvsPageTracking_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimExitPagePath FOREIGN KEY (dimExitPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimhostname (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimNextPagePath FOREIGN KEY (dimNextPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimPageDepth FOREIGN KEY (dimPageDepth) REFERENCES dimpagedepth (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimPreviousPagePath FOREIGN KEY (dimPreviousPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimSecondPagePath FOREIGN KEY (dimSecondPagePath) REFERENCES dimpagepath (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsPageTracking_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvssystem`
--
ALTER TABLE `fctvssystem`
  ADD CONSTRAINT fk_fctvsSystem_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsSystem_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsSystem_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsSystem_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvstraffic`
--
ALTER TABLE `fctvstraffic`
  ADD CONSTRAINT fk_fctvsTraffic_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsTraffic_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsTraffic_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsTraffic_dimTraffic FOREIGN KEY (dimTraffic) REFERENCES dimtraffic (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvsvisitor`
--
ALTER TABLE `fctvsvisitor`
  ADD CONSTRAINT fk_fctvsVisitor_dimDaysSinceLastVisit FOREIGN KEY (dimDaysSinceLastVisit) REFERENCES dimdaysince (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsVisitor_dimVanquisSession FOREIGN KEY (dimVanquisSession) REFERENCES dimcustomvar (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsVisitor_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsVisitor_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_fctvsVisitor_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
