-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2013 at 02:59 PM
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
-- Table structure for table `dimadwords_one`
--

CREATE TABLE "dimadwords_one" (
  "ID" int(11) NOT NULL,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdSlot" varchar(45) DEFAULT NULL,
  "AdSlotPosition" varchar(45) DEFAULT NULL,
  "AdPlacementDomain" varchar(45) DEFAULT NULL,
  "AdPlacementUrl" varchar(2048) DEFAULT NULL,
  "AdTargetingOption" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimadwords_two`
--

CREATE TABLE "dimadwords_two" (
  "ID" int(11) NOT NULL,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdDistributionNetwork" varchar(45) DEFAULT NULL,
  "AdMatchType" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  "AdwordsCustomerID" varchar(45) DEFAULT NULL,
  "AdwordsCampaignID" varchar(45) DEFAULT NULL,
  "AdwordsAdGroupID" varchar(45) DEFAULT NULL,
  "AdwordsCreativeID" varchar(45) DEFAULT NULL,
  "AdwordsCriteriaID" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimconversionpathnodes`
--

CREATE TABLE "dimconversionpathnodes" (
  "ID" int(11) NOT NULL,
  "NodeName" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimcustomvar`
--

CREATE TABLE "dimcustomvar" (
  "ID" int(11) NOT NULL,
  "customVarName" varchar(70) NOT NULL,
  "customVarValue" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "dimCustomVar_indx" ("customVarName","customVarValue")
) AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimcustomvar1`
--
CREATE TABLE `dimcustomvar1` (
`ID` int(11)
,`CustomVarName1` varchar(70)
,`CustomVarValue1` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimcustomvar2`
--
CREATE TABLE `dimcustomvar2` (
`ID` int(11)
,`CustomVarName2` varchar(70)
,`CustomVarValue2` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimcustomvar3`
--
CREATE TABLE `dimcustomvar3` (
`ID` int(11)
,`CustomVarName3` varchar(70)
,`CustomVarValue3` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimcustomvar4`
--
CREATE TABLE `dimcustomvar4` (
`ID` int(11)
,`CustomVarName4` varchar(70)
,`CustomVarValue4` varchar(70)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimcustomvar5`
--
CREATE TABLE `dimcustomvar5` (
`ID` int(11)
,`CustomVarName5` varchar(70)
,`CustomVarValue5` varchar(70)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimdate`
--

CREATE TABLE "dimdate" (
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
-- Table structure for table `dimdaysince`
--

CREATE TABLE "dimdaysince" (
  "ID" int(11) NOT NULL,
  "Days" int(11) DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "Days_UNIQUE" ("Days")
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimdayssincelastvisit`
--
CREATE TABLE `dimdayssincelastvisit` (
`ID` int(11)
,`DaysSinceLastVisit` int(11)
,`Description` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimecommerce`
--

CREATE TABLE "dimecommerce" (
  "ID" int(11) NOT NULL,
  "TransactionId" varchar(70) NOT NULL,
  "Affiliation" varchar(70) DEFAULT NULL,
  "VisitsToTransaction" int(11) DEFAULT NULL,
  "DaysToTransaction" int(11) DEFAULT NULL,
  "ProductSku" varchar(70) DEFAULT NULL,
  "ProductName" varchar(70) DEFAULT NULL,
  "ProductCategory" varchar(70) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimevent`
--

CREATE TABLE "dimevent" (
  "ID" int(11) NOT NULL,
  "EventCategory" varchar(70) NOT NULL,
  "EventAction" varchar(70) NOT NULL,
  "EventLabel" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "dimEvent_indx" ("EventCategory","EventAction","EventLabel")
) AUTO_INCREMENT=176 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimexitpagepath`
--
CREATE TABLE `dimexitpagepath` (
`ID` int(11)
,`ExitPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimgeo`
--

CREATE TABLE "dimgeo" (
  "ID" int(11) NOT NULL,
  "Latitude" decimal(9,6) NOT NULL,
  "Longitude" decimal(9,6) NOT NULL,
  "City" varchar(45) NOT NULL,
  "Country" varchar(45) NOT NULL,
  "Continent" varchar(45) NOT NULL,
  "SubContinent" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "dimGeo_indx" ("Latitude","Longitude","City","Country")
) AUTO_INCREMENT=259 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimgoal`
--

CREATE TABLE "dimgoal" (
  "ID" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "GoalNumber" int(11) NOT NULL,
  "GoalLabel" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "dimEvent_indx" ("dimProfile","GoalNumber","GoalLabel"),
  KEY "fk_dimGoal_dimProfile_idx" ("dimProfile")
) AUTO_INCREMENT=194 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimhostname`
--

CREATE TABLE "dimhostname" (
  "ID" int(11) NOT NULL,
  "Hostname" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimHostName" ("Hostname")
) AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimhour`
--

CREATE TABLE "dimhour" (
  "ID" int(11) NOT NULL,
  "Hour" varchar(2) NOT NULL,
  "Description" varchar(45) NOT NULL,
  "StartTime" datetime NOT NULL,
  "EndTime" datetime NOT NULL,
  PRIMARY KEY ("ID")
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimlandingpagepath`
--
CREATE TABLE `dimlandingpagepath` (
`ID` int(11)
,`LandingPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimmobile`
--

CREATE TABLE "dimmobile" (
  "ID" int(11) NOT NULL,
  "IsMobile" varchar(45) NOT NULL,
  "MobileDeviceBranding" varchar(45) NOT NULL,
  "MobileDeviceModel" varchar(45) NOT NULL,
  "MobileInputSelector" varchar(45) NOT NULL,
  "MobileDeviceInfo" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimnetwork`
--

CREATE TABLE "dimnetwork" (
  "ID" int(11) NOT NULL,
  "NetworkDomain" varchar(45) NOT NULL,
  "NetworkLocation" varchar(512) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimNetwork" ("NetworkDomain","NetworkLocation")
) AUTO_INCREMENT=285 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimnextpagepath`
--
CREATE TABLE `dimnextpagepath` (
`ID` int(11)
,`NextPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimpagedepth`
--

CREATE TABLE "dimpagedepth" (
  "ID" int(11) NOT NULL,
  "PageDepth" int(11) DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "PageDepth_UNIQUE" ("PageDepth")
);

-- --------------------------------------------------------

--
-- Table structure for table `dimpagepath`
--

CREATE TABLE "dimpagepath" (
  "ID" int(11) NOT NULL,
  "PagePath" varchar(4096) NOT NULL,
  "PageType" varchar(45) NOT NULL DEFAULT 'Unknown',
  "HasShortcode" int(11) NOT NULL DEFAULT '0',
  "Shortcode" varchar(1024) DEFAULT NULL,
  "hasURN" int(11) NOT NULL DEFAULT '0',
  "URN" varchar(24) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=1711 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimpagepathlevel1`
--
CREATE TABLE `dimpagepathlevel1` (
`ID` int(11)
,`PagePathLevel1` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimpagepathlevel2`
--
CREATE TABLE `dimpagepathlevel2` (
`ID` int(11)
,`PagePathLevel2` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimpagepathlevel3`
--
CREATE TABLE `dimpagepathlevel3` (
`ID` int(11)
,`PagePathLevel3` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimpagepathlevel4`
--
CREATE TABLE `dimpagepathlevel4` (
`ID` int(11)
,`PagePathLevel4` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimplatform`
--

CREATE TABLE "dimplatform" (
  "ID" int(11) NOT NULL,
  "Browser" varchar(45) NOT NULL,
  "BrowserVersion" varchar(45) NOT NULL,
  "OperatingSystem" varchar(45) NOT NULL,
  "OperatingSystemVersion" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=86 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimpreviouspagepath`
--
CREATE TABLE `dimpreviouspagepath` (
`ID` int(11)
,`PreviousPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `dimproduct`
--
CREATE TABLE `dimproduct` (
`ID` int(11)
,`TransactionId` varchar(70)
,`ProductSku` varchar(70)
,`ProductName` varchar(70)
,`ProductCategory` varchar(70)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimprofile`
--

CREATE TABLE "dimprofile" (
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
-- Stand-in structure for view `dimsecondpagepath`
--
CREATE TABLE `dimsecondpagepath` (
`ID` int(11)
,`SecondPagePath` varchar(4096)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimsession`
--

CREATE TABLE "dimsession" (
  "ID" int(11) NOT NULL,
  "VisitLength" int(11) NOT NULL,
  PRIMARY KEY ("ID")
);

-- --------------------------------------------------------

--
-- Table structure for table `dimsocialtraffic`
--

CREATE TABLE "dimsocialtraffic" (
  "ID" int(11) NOT NULL,
  "SocialNetwork" varchar(45) DEFAULT NULL,
  "HasSocialSourceReferral" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimsystem`
--

CREATE TABLE "dimsystem" (
  "ID" int(11) NOT NULL,
  "FlashVersion" varchar(45) NOT NULL,
  "JavaEnabled" varchar(45) NOT NULL,
  "Language" varchar(45) NOT NULL,
  "ScreenColors" varchar(45) NOT NULL,
  "ScreenResolution" varchar(45) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimSystem" ("FlashVersion","JavaEnabled","Language","ScreenColors","ScreenResolution")
) AUTO_INCREMENT=198 ;

-- --------------------------------------------------------

--
-- Table structure for table `dimtraffic`
--

CREATE TABLE "dimtraffic" (
  "ID" int(11) NOT NULL,
  "Campaign" varchar(45) DEFAULT NULL,
  "Source" varchar(45) DEFAULT NULL,
  "Keyword" varchar(512) DEFAULT NULL,
  PRIMARY KEY ("ID")
) AUTO_INCREMENT=693 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dimtransaction`
--
CREATE TABLE `dimtransaction` (
`ID` int(11)
,`TransactionId` varchar(70)
,`Affiliation` varchar(70)
,`VisitsToTransaction` int(11)
,`DaysToTransaction` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `dimvisitor`
--

CREATE TABLE "dimvisitor" (
  "ID" int(11) NOT NULL,
  "VisitCount" int(11) DEFAULT NULL,
  "VisitorType" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_VisitCount" ("VisitCount")
);

-- --------------------------------------------------------

--
-- Table structure for table `fctadwords_one`
--

CREATE TABLE "fctadwords_one" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimAdwords_one" int(11) NOT NULL,
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
  PRIMARY KEY ("ID"),
  KEY "fk_fctAdwords_one_dimDate_idx" ("dimDate"),
  KEY "fk_fctAdwords_one_dimAdwords_one_idx" ("dimAdwords_one")
) AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctadwords_two`
--

CREATE TABLE "fctadwords_two" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimAdwords_two" int(11) NOT NULL,
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
  PRIMARY KEY ("ID"),
  KEY "fk_fctAdwords_two_dimDate_idx" ("dimDate"),
  KEY "fk_fctAdwords_two_dimAdwords_two_idx" ("dimAdwords_two")
) AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctcustomvar`
--

CREATE TABLE "fctcustomvar" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimCustomVar1" int(11) NOT NULL,
  "dimCustomVar2" int(11) NOT NULL,
  "dimCustomVar3" int(11) NOT NULL,
  "dimCustomVar4" int(11) NOT NULL,
  "dimCustomVar5" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimCustomVar" ("dimDate","dimProfile","dimCustomVar1","dimCustomVar2","dimCustomVar3","dimCustomVar4","dimCustomVar5"),
  KEY "fk_dimCustomVar_dimDate_idx" ("dimDate"),
  KEY "fk_dimCustomVar_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctdimCustomVar_dimCustomVar1_idx" ("dimCustomVar1"),
  KEY "fk_fctdimCustomVar_dimCustomVar2_idx" ("dimCustomVar2"),
  KEY "fk_fctdimCustomVar_dimCustomVar3_idx" ("dimCustomVar3"),
  KEY "fk_fctdimCustomVar_dimCustomVar4_idx" ("dimCustomVar4"),
  KEY "fk_fctdimCustomVar_dimCustomVar5_idx" ("dimCustomVar5")
) AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctdate`
--

CREATE TABLE "fctdate" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  "Impressions" int(11) NOT NULL DEFAULT '0',
  "AdClicks" int(11) NOT NULL DEFAULT '0',
  "AdCost" float NOT NULL DEFAULT '0',
  "Goal1Completions" int(11) NOT NULL DEFAULT '0',
  "Goal2Completions" int(11) NOT NULL DEFAULT '0',
  "Goal3Completions" int(11) NOT NULL DEFAULT '0',
  "Goal4Completions" int(11) NOT NULL DEFAULT '0',
  "Goal5Completions" int(11) NOT NULL DEFAULT '0',
  "Goal6Completions" int(11) NOT NULL DEFAULT '0',
  "Goal7Completions" int(11) NOT NULL DEFAULT '0',
  "Goal8Completions" int(11) NOT NULL DEFAULT '0',
  "Goal9Completions" int(11) NOT NULL DEFAULT '0',
  "Goal10Completions" int(11) NOT NULL DEFAULT '0',
  "Goal11Completions" int(11) NOT NULL DEFAULT '0',
  "Goal12Completions" int(11) NOT NULL DEFAULT '0',
  "Goal13Completions" int(11) NOT NULL DEFAULT '0',
  "Goal14Completions" int(11) NOT NULL DEFAULT '0',
  "Goal15Completions" int(11) NOT NULL DEFAULT '0',
  "Goal16Completions" int(11) NOT NULL DEFAULT '0',
  "Goal17Completions" int(11) NOT NULL DEFAULT '0',
  "Goal18Completions" int(11) NOT NULL DEFAULT '0',
  "Goal19Completions" int(11) NOT NULL DEFAULT '0',
  "Goal20Completions" int(11) NOT NULL DEFAULT '0',
  "Goal1Starts" int(11) NOT NULL DEFAULT '0',
  "Goal2Starts" int(11) NOT NULL DEFAULT '0',
  "Goal3Starts" int(11) NOT NULL DEFAULT '0',
  "Goal4Starts" int(11) NOT NULL DEFAULT '0',
  "Goal5Starts" int(11) NOT NULL DEFAULT '0',
  "Goal6Starts" int(11) NOT NULL DEFAULT '0',
  "Goal7Starts" int(11) NOT NULL DEFAULT '0',
  "Goal8Starts" int(11) NOT NULL DEFAULT '0',
  "Goal9Starts" int(11) NOT NULL DEFAULT '0',
  "Goal10Starts" int(11) NOT NULL DEFAULT '0',
  "Goal11Starts" int(11) NOT NULL DEFAULT '0',
  "Goal12Starts" int(11) NOT NULL DEFAULT '0',
  "Goal13Starts" int(11) NOT NULL DEFAULT '0',
  "Goal14Starts" int(11) NOT NULL DEFAULT '0',
  "Goal15Starts" int(11) NOT NULL DEFAULT '0',
  "Goal16Starts" int(11) NOT NULL DEFAULT '0',
  "Goal17Starts" int(11) NOT NULL DEFAULT '0',
  "Goal18Starts" int(11) NOT NULL DEFAULT '0',
  "Goal19Starts" int(11) NOT NULL DEFAULT '0',
  "Goal20Starts" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimDate" ("dimDate","dimProfile"),
  KEY "fk_fctDate_dimDate_idx" ("dimDate"),
  KEY "fk_fctDate_dimProfile_idx" ("dimProfile")
) AUTO_INCREMENT=4473 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctdevice`
--

CREATE TABLE "fctdevice" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimHour" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimGeo" int(11) NOT NULL,
  "dimPlatform" int(11) NOT NULL,
  "dimSystem" int(11) NOT NULL,
  "dimNetwork" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fctDevice_dimDate_idx" ("dimDate"),
  KEY "fk_fctDevice_dimHour_idx" ("dimHour"),
  KEY "fk_fctDevice_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctDevice_dimGeo_idx" ("dimGeo"),
  KEY "fk_fctDevice_dimPlatform_idx" ("dimPlatform"),
  KEY "fk_fctDevice_dimSystem_idx" ("dimSystem"),
  KEY "fk_fctDevice_dim_idx" ("dimNetwork"),
  KEY "fk_fctDevice_dimVisitor_idx" ("dimVisitor")
) AUTO_INCREMENT=199 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctecommerce`
--

CREATE TABLE "fctecommerce" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimEcommerce" int(11) NOT NULL,
  "ItemQuantity" int(11) NOT NULL,
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_fctEcommerce" ("dimDate","dimProfile","dimEcommerce"),
  KEY "fk_fctEcommerce_dimDate_idx" ("dimDate"),
  KEY "fk_fctEcommerce_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctEcommerce_dimTransaction_idx" ("dimEcommerce")
) AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctevent`
--

CREATE TABLE "fctevent" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimEvent" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  "totalEvents" int(11) NOT NULL DEFAULT '0',
  "uniqueEvents" int(11) NOT NULL DEFAULT '0',
  "eventValue" int(11) NOT NULL DEFAULT '0',
  "visitsWithEvent" int(11) NOT NULL DEFAULT '0',
  "eventsPerVisitWithEvent" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimEvent" ("dimDate","dimProfile","dimEvent"),
  KEY "fk_dimEvent_dimDate_idx" ("dimDate"),
  KEY "fk_dimEvent_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctdimEvent_dimEvent_idx" ("dimEvent")
) AUTO_INCREMENT=194 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctexitpagepath`
--

CREATE TABLE "fctexitpagepath" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimLandingPagePath" int(11) NOT NULL,
  "dimExitPagePath" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "dimDaysSinceLastVisit" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimExitPagePath" ("dimDate","dimProfile","dimExitPagePath","dimLandingPagePath","dimVisitor","dimDaysSinceLastVisit"),
  KEY "fk_fctExitPagePath_dimDate_idx" ("dimDate"),
  KEY "fk_fctExitPagePath_dimDaysSinceLastVisit_idx" ("dimDaysSinceLastVisit"),
  KEY "fk_fctExitPagePath_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctExitPagePath_dimVisitor_idx" ("dimVisitor"),
  KEY "fk_fctExitPagePath_dimLandingPagePath_idx" ("dimLandingPagePath"),
  KEY "fk_fctExitPagePath_dimExitPagePath_idx" ("dimExitPagePath")
) AUTO_INCREMENT=291 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctform`
--

CREATE TABLE "fctform" (
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

CREATE TABLE "fctgeo" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimGeo" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimGeo" ("dimDate","dimProfile","dimGeo"),
  KEY "fk_fctGeo_dimDate_idx" ("dimDate"),
  KEY "fk_fctGeo_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctGeo_dimGeo_idx" ("dimGeo")
) AUTO_INCREMENT=74 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctgoaltraffic`
--

CREATE TABLE "fctgoaltraffic" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimTraffic" int(11) NOT NULL,
  "dimGoal" int(11) NOT NULL,
  "GoalCompletions" int(11) NOT NULL DEFAULT '0',
  "GoalStarts" int(11) NOT NULL DEFAULT '0',
  "GoalAbandons" int(11) NOT NULL DEFAULT '0',
  "GoalValue" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fctGoalTraffic_dimDate" ("dimDate"),
  KEY "fk_fctGoalTraffic_dimGoal" ("dimGoal"),
  KEY "fk_fctGoalTraffic_dimProfile" ("dimProfile"),
  KEY "fk_fctGoalTraffic_dimTraffic" ("dimTraffic")
) AUTO_INCREMENT=109 ;

-- --------------------------------------------------------

--
-- Table structure for table `fcthostname`
--

CREATE TABLE "fcthostname" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimHostname" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimHostname" ("dimDate","dimProfile","dimHostname"),
  KEY "fk_fctHostname_dimDate_idx" ("dimDate"),
  KEY "fk_fctHostname_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctHostname_dimHostname_idx" ("dimHostname")
) AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctlandingpagepath`
--

CREATE TABLE "fctlandingpagepath" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimLandingPagePath" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimLandingPagePath" ("dimDate","dimProfile","dimLandingPagePath"),
  KEY "fk_fctLandingPagePath_dimDate_idx" ("dimDate"),
  KEY "fk_fctLandingPagePath_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctLandingPagePath_dimLandingPagePath_idx" ("dimLandingPagePath")
) AUTO_INCREMENT=237 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctloanhistory`
--

CREATE TABLE "fctloanhistory" (
  "ID" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimHostName" int(11) NOT NULL,
  "dimNetwork" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "dimSession" int(11) NOT NULL,
  "dimGeo" int(11) NOT NULL,
  "dimSystem" int(11) NOT NULL,
  "dimPlatform" int(11) NOT NULL,
  "dimLandingPagePath" int(11) NOT NULL,
  "dimMobile" int(11) NOT NULL,
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
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Goal1Starts" int(11) NOT NULL DEFAULT '0',
  "Goal1Completions" int(11) NOT NULL DEFAULT '0',
  "Goal1Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal1Value" float NOT NULL DEFAULT '0',
  "Goal2Starts" int(11) NOT NULL DEFAULT '0',
  "Goal2Completions" int(11) NOT NULL DEFAULT '0',
  "Goal2Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal2Value" float NOT NULL DEFAULT '0',
  "Goal3Starts" int(11) NOT NULL DEFAULT '0',
  "Goal3Completions" int(11) NOT NULL DEFAULT '0',
  "Goal3Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal3Value" float NOT NULL DEFAULT '0',
  "Goal4Starts" int(11) NOT NULL DEFAULT '0',
  "Goal4Completions" int(11) NOT NULL DEFAULT '0',
  "Goal4Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal4Value" float NOT NULL DEFAULT '0',
  "Goal5Starts" int(11) NOT NULL DEFAULT '0',
  "Goal5Completions" int(11) NOT NULL DEFAULT '0',
  "Goal5Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal5Value" float NOT NULL DEFAULT '0',
  "Goal6Starts" int(11) NOT NULL DEFAULT '0',
  "Goal6Completions" int(11) NOT NULL DEFAULT '0',
  "Goal6Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal6Value" float NOT NULL DEFAULT '0',
  "Goal7Starts" int(11) NOT NULL DEFAULT '0',
  "Goal7Completions" int(11) NOT NULL DEFAULT '0',
  "Goal7Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal7Value" float NOT NULL DEFAULT '0',
  "Goal8Starts" int(11) NOT NULL DEFAULT '0',
  "Goal8Completions" int(11) NOT NULL DEFAULT '0',
  "Goal8Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal8Value" float NOT NULL DEFAULT '0',
  "Goal9Starts" int(11) NOT NULL DEFAULT '0',
  "Goal9Completions" int(11) NOT NULL DEFAULT '0',
  "Goal9Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal9Value" float NOT NULL DEFAULT '0',
  "Goal10Starts" int(11) NOT NULL DEFAULT '0',
  "Goal10Completions" int(11) NOT NULL DEFAULT '0',
  "Goal10Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal10Value" float NOT NULL DEFAULT '0',
  "Goal11Starts" int(11) NOT NULL DEFAULT '0',
  "Goal11Completions" int(11) NOT NULL DEFAULT '0',
  "Goal11Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal11Value" float NOT NULL DEFAULT '0',
  "Goal12Starts" int(11) NOT NULL DEFAULT '0',
  "Goal12Completions" int(11) NOT NULL DEFAULT '0',
  "Goal12Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal12Value" float NOT NULL DEFAULT '0',
  "Goal13Starts" int(11) NOT NULL DEFAULT '0',
  "Goal13Completions" int(11) NOT NULL DEFAULT '0',
  "Goal13Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal13Value" float NOT NULL DEFAULT '0',
  "Goal14Starts" int(11) NOT NULL DEFAULT '0',
  "Goal14Completions" int(11) NOT NULL DEFAULT '0',
  "Goal14Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal14Value" float NOT NULL DEFAULT '0',
  "Goal15Starts" int(11) NOT NULL DEFAULT '0',
  "Goal15Completions" int(11) NOT NULL DEFAULT '0',
  "Goal15Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal15Value" float NOT NULL DEFAULT '0',
  "Goal16Starts" int(11) NOT NULL DEFAULT '0',
  "Goal16Completions" int(11) NOT NULL DEFAULT '0',
  "Goal16Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal16Value" float NOT NULL DEFAULT '0',
  "Goal17Starts" int(11) NOT NULL DEFAULT '0',
  "Goal17Completions" int(11) NOT NULL DEFAULT '0',
  "Goal17Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal17Value" float NOT NULL DEFAULT '0',
  "Goal18Starts" int(11) NOT NULL DEFAULT '0',
  "Goal18Completions" int(11) NOT NULL DEFAULT '0',
  "Goal18Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal18Value" float NOT NULL DEFAULT '0',
  "Goal19Starts" int(11) NOT NULL DEFAULT '0',
  "Goal19Completions" int(11) NOT NULL DEFAULT '0',
  "Goal19Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal19Value" float NOT NULL DEFAULT '0',
  "Goal20Starts" int(11) NOT NULL DEFAULT '0',
  "Goal20Completions" int(11) NOT NULL DEFAULT '0',
  "Goal20Abandons" int(11) NOT NULL DEFAULT '0',
  "Goal20Value" float NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fkt_idx" ("dimDate"),
  KEY "fctloanhistory_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctloanhistory_dimLandingPagePath_idx" ("dimLandingPagePath"),
  KEY "fk_fctloanhistory_dimVisitors_idx" ("dimVisitor"),
  KEY "fk_fctloanhistory_dimSession_idx" ("dimSession"),
  KEY "fk_fctloanhistory_dimNetwork_idx" ("dimNetwork"),
  KEY "fk_fctloanhistory_dimHostname_idx" ("dimHostName"),
  KEY "fk_fctloanhistory_dimSystem_idx" ("dimSystem"),
  KEY "fk_fctloanhistory_dimPlatform_idx" ("dimPlatform"),
  KEY "fk_fctloanhistory_dimGeo_idx" ("dimGeo"),
  KEY "fk_fctloanhistory_dimMobile_idx" ("dimMobile")
) AUTO_INCREMENT=597 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctmobile`
--

CREATE TABLE "fctmobile" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimMobile" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimMobile" ("dimDate","dimProfile","dimMobile"),
  KEY "fk_fctMobile_dimDate_idx" ("dimDate"),
  KEY "fk_fctMobile_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctMobile_dimMobile_idx" ("dimMobile")
) AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctnetwork`
--

CREATE TABLE "fctnetwork" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimNetwork" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimNetwork" ("dimDate","dimProfile","dimNetwork"),
  KEY "fk_fctNetwork_dimDate_idx" ("dimDate"),
  KEY "fk_fctNetwork_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctNetwork_dimNetwork_idx" ("dimNetwork")
) AUTO_INCREMENT=82 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctpagetracking`
--

CREATE TABLE "fctpagetracking" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimHostname" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "dimPageDepth" int(11) NOT NULL,
  "dimLandingPagePath" int(11) NOT NULL,
  "dimSecondPagePath" int(11) NOT NULL,
  "dimPagePath" int(11) NOT NULL,
  "dimNextPagePath" int(11) NOT NULL,
  "dimPreviousPagePath" int(11) NOT NULL,
  "dimExitPagePath" int(11) NOT NULL,
  "Entrances" int(11) NOT NULL,
  "Pageviews" int(11) NOT NULL,
  "UniquePageviews" int(11) NOT NULL,
  "TimeOnPage" int(11) NOT NULL,
  "Exits" int(11) NOT NULL,
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "Goal1Completions" int(11) NOT NULL DEFAULT '0',
  "Goal2Completions" int(11) NOT NULL DEFAULT '0',
  "Goal3Completions" int(11) NOT NULL DEFAULT '0',
  "Goal4Completions" int(11) NOT NULL DEFAULT '0',
  "Goal5Completions" int(11) NOT NULL DEFAULT '0',
  "Goal6Completions" int(11) NOT NULL DEFAULT '0',
  "Goal7Completions" int(11) NOT NULL DEFAULT '0',
  "Goal8Completions" int(11) NOT NULL DEFAULT '0',
  "Goal9Completions" int(11) NOT NULL DEFAULT '0',
  "Goal10Completions" int(11) NOT NULL DEFAULT '0',
  "Goal11Completions" int(11) NOT NULL DEFAULT '0',
  "Goal12Completions" int(11) NOT NULL DEFAULT '0',
  "Goal13Completions" int(11) NOT NULL DEFAULT '0',
  "Goal14Completions" int(11) NOT NULL DEFAULT '0',
  "Goal15Completions" int(11) NOT NULL DEFAULT '0',
  "Goal16Completions" int(11) NOT NULL DEFAULT '0',
  "Goal17Completions" int(11) NOT NULL DEFAULT '0',
  "Goal18Completions" int(11) NOT NULL DEFAULT '0',
  "Goal19Completions" int(11) NOT NULL DEFAULT '0',
  "Goal20Completions" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fctPageTracking_dimDate" ("dimDate"),
  KEY "fk_fctPageTracking_dimProfile" ("dimProfile"),
  KEY "fk_fctPageTracking_dimHostname" ("dimHostname"),
  KEY "fk_fctPageTracking_dimVisitor" ("dimVisitor"),
  KEY "fk_fctPageTracking_dimPageDepth" ("dimPageDepth"),
  KEY "fk_fctPageTracking_dimLandingPagePath" ("dimLandingPagePath"),
  KEY "fk_fctPageTracking_dimSecondPagePath" ("dimSecondPagePath"),
  KEY "fk_fctPageTracking_dimPagePath" ("dimPagePath"),
  KEY "fk_fctPageTracking_dimNextPagePath" ("dimNextPagePath"),
  KEY "fk_fctPageTracking_dimPreviousPagePath" ("dimPreviousPagePath"),
  KEY "fk_fctPageTracking_dimExitPagePath" ("dimExitPagePath")
) AUTO_INCREMENT=3143 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctplatform`
--

CREATE TABLE "fctplatform" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimPlatform" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimPlatform" ("dimDate","dimProfile","dimPlatform"),
  KEY "fk_fctPlatform_dimDate_idx" ("dimDate"),
  KEY "fk_fctPlatform_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctPlatform_dimPlatform_idx" ("dimPlatform")
) AUTO_INCREMENT=108 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctsession`
--

CREATE TABLE "fctsession" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimSession" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimSession" ("dimDate","dimProfile","dimSession"),
  KEY "fk_fctSession_dimDate_idx" ("dimDate"),
  KEY "fk_fctSession_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctSession_dimSession_idx" ("dimSession")
) AUTO_INCREMENT=390 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctsystem`
--

CREATE TABLE "fctsystem" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimSystem" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimSystem" ("dimDate","dimProfile","dimSystem"),
  KEY "fk_fctSystem_dimDate_idx" ("dimDate"),
  KEY "fk_fctSystem_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctSystem_dimSystem_idx" ("dimSystem")
) AUTO_INCREMENT=195 ;

-- --------------------------------------------------------

--
-- Table structure for table `fcttraffic`
--

CREATE TABLE "fcttraffic" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimTraffic" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" int(11) NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "Impressions" int(11) NOT NULL DEFAULT '0',
  "AdClicks" int(11) NOT NULL DEFAULT '0',
  "AdCost" float NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" int(11) NOT NULL DEFAULT '0',
  "Goal1Completions" int(11) NOT NULL DEFAULT '0',
  "Goal1Starts" int(11) NOT NULL DEFAULT '0',
  "Goal2Completions" int(11) NOT NULL DEFAULT '0',
  "Goal2Starts" int(11) NOT NULL DEFAULT '0',
  "Goal3Completions" int(11) NOT NULL DEFAULT '0',
  "Goal3Starts" int(11) NOT NULL DEFAULT '0',
  "Goal4Completions" int(11) NOT NULL DEFAULT '0',
  "Goal4Starts" int(11) NOT NULL DEFAULT '0',
  "Goal6Completions" int(11) NOT NULL DEFAULT '0',
  "Goal6Starts" int(11) NOT NULL DEFAULT '0',
  "Goal7Completions" int(11) NOT NULL DEFAULT '0',
  "Goal7Starts" int(11) NOT NULL DEFAULT '0',
  "Goal8Completions" int(11) NOT NULL DEFAULT '0',
  "Goal8Starts" int(11) NOT NULL DEFAULT '0',
  "Goal9Completions" int(11) NOT NULL DEFAULT '0',
  "Goal9Starts" int(11) NOT NULL DEFAULT '0',
  "Goal10Completions" int(11) NOT NULL DEFAULT '0',
  "Goal10Starts" int(11) NOT NULL DEFAULT '0',
  "Goal11Completions" int(11) NOT NULL DEFAULT '0',
  "Goal11Starts" int(11) NOT NULL DEFAULT '0',
  "Goal12Completions" int(11) NOT NULL DEFAULT '0',
  "Goal12Starts" int(11) NOT NULL DEFAULT '0',
  "Goal13Completions" int(11) NOT NULL DEFAULT '0',
  "Goal13Starts" int(11) NOT NULL DEFAULT '0',
  "Goal14Completions" int(11) NOT NULL DEFAULT '0',
  "Goal14Starts" int(11) NOT NULL DEFAULT '0',
  "Goal15Completions" int(11) NOT NULL DEFAULT '0',
  "Goal15Starts" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  KEY "fk_fctTraffic_dimDate" ("dimDate"),
  KEY "fk_fctTraffic_dimProfile" ("dimProfile"),
  KEY "fk_fctTraffic_dimTraffic" ("dimTraffic")
) AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for table `fctvisitor`
--

CREATE TABLE "fctvisitor" (
  "ID" int(11) NOT NULL,
  "dimDate" int(11) NOT NULL,
  "dimProfile" int(11) NOT NULL,
  "dimVisitor" int(11) NOT NULL,
  "Visits" int(11) NOT NULL DEFAULT '0',
  "Visitors" int(11) NOT NULL DEFAULT '0',
  "NewVisits" int(11) NOT NULL DEFAULT '0',
  "Bounces" int(11) NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int(11) NOT NULL DEFAULT '0',
  "GoalStartsAll" int(11) NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int(11) NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int(11) NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int(11) NOT NULL DEFAULT '0',
  "Pageviews" int(11) NOT NULL DEFAULT '0',
  "UniquePageviews" int(11) NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "indx_dimDate" ("dimDate","dimProfile","dimVisitor"),
  KEY "fk_fctVisitor_dimDate_idx" ("dimDate"),
  KEY "fk_fctVisitor_dimProfile_idx" ("dimProfile"),
  KEY "fk_fctVisitor_dimVisitor_idx" ("dimVisitor")
) AUTO_INCREMENT=223 ;

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar1`
--
DROP TABLE IF EXISTS `dimcustomvar1`;

CREATE VIEW "workcommer"."dimcustomvar1" AS select "workcommer"."dimcustomvar"."ID" AS "ID","workcommer"."dimcustomvar"."customVarName" AS "CustomVarName1","workcommer"."dimcustomvar"."customVarValue" AS "CustomVarValue1" from "workcommer"."dimcustomvar";

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar2`
--
DROP TABLE IF EXISTS `dimcustomvar2`;

CREATE VIEW "workcommer"."dimcustomvar2" AS select "workcommer"."dimcustomvar"."ID" AS "ID","workcommer"."dimcustomvar"."customVarName" AS "CustomVarName2","workcommer"."dimcustomvar"."customVarValue" AS "CustomVarValue2" from "workcommer"."dimcustomvar";

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar3`
--
DROP TABLE IF EXISTS `dimcustomvar3`;

CREATE VIEW "workcommer"."dimcustomvar3" AS select "workcommer"."dimcustomvar"."ID" AS "ID","workcommer"."dimcustomvar"."customVarName" AS "CustomVarName3","workcommer"."dimcustomvar"."customVarValue" AS "CustomVarValue3" from "workcommer"."dimcustomvar";

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar4`
--
DROP TABLE IF EXISTS `dimcustomvar4`;

CREATE VIEW "workcommer"."dimcustomvar4" AS select "workcommer"."dimcustomvar"."ID" AS "ID","workcommer"."dimcustomvar"."customVarName" AS "CustomVarName4","workcommer"."dimcustomvar"."customVarValue" AS "CustomVarValue4" from "workcommer"."dimcustomvar";

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar5`
--
DROP TABLE IF EXISTS `dimcustomvar5`;

CREATE VIEW "workcommer"."dimcustomvar5" AS select "workcommer"."dimcustomvar"."ID" AS "ID","workcommer"."dimcustomvar"."customVarName" AS "CustomVarName5","workcommer"."dimcustomvar"."customVarValue" AS "CustomVarValue5" from "workcommer"."dimcustomvar";

-- --------------------------------------------------------

--
-- Structure for view `dimdayssincelastvisit`
--
DROP TABLE IF EXISTS `dimdayssincelastvisit`;

CREATE VIEW "workcommer"."dimdayssincelastvisit" AS select "workcommer"."dimdaysince"."ID" AS "ID","workcommer"."dimdaysince"."Days" AS "DaysSinceLastVisit","workcommer"."dimdaysince"."Description" AS "Description" from "workcommer"."dimdaysince";

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

-- --------------------------------------------------------

--
-- Structure for view `dimnextpagepath`
--
DROP TABLE IF EXISTS `dimnextpagepath`;

CREATE VIEW "workcommer"."dimnextpagepath" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "NextPagePath" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel1`
--
DROP TABLE IF EXISTS `dimpagepathlevel1`;

CREATE VIEW "workcommer"."dimpagepathlevel1" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "PagePathLevel1" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel2`
--
DROP TABLE IF EXISTS `dimpagepathlevel2`;

CREATE VIEW "workcommer"."dimpagepathlevel2" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "PagePathLevel2" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel3`
--
DROP TABLE IF EXISTS `dimpagepathlevel3`;

CREATE VIEW "workcommer"."dimpagepathlevel3" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "PagePathLevel3" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel4`
--
DROP TABLE IF EXISTS `dimpagepathlevel4`;

CREATE VIEW "workcommer"."dimpagepathlevel4" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "PagePathLevel4" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimpreviouspagepath`
--
DROP TABLE IF EXISTS `dimpreviouspagepath`;

CREATE VIEW "workcommer"."dimpreviouspagepath" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "PreviousPagePath" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimproduct`
--
DROP TABLE IF EXISTS `dimproduct`;

CREATE VIEW "workcommer"."dimproduct" AS select "workcommer"."dimecommerce"."ID" AS "ID","workcommer"."dimecommerce"."TransactionId" AS "TransactionId","workcommer"."dimecommerce"."ProductSku" AS "ProductSku","workcommer"."dimecommerce"."ProductName" AS "ProductName","workcommer"."dimecommerce"."ProductCategory" AS "ProductCategory" from "workcommer"."dimecommerce";

-- --------------------------------------------------------

--
-- Structure for view `dimsecondpagepath`
--
DROP TABLE IF EXISTS `dimsecondpagepath`;

CREATE VIEW "workcommer"."dimsecondpagepath" AS select "workcommer"."dimpagepath"."ID" AS "ID","workcommer"."dimpagepath"."PagePath" AS "SecondPagePath" from "workcommer"."dimpagepath";

-- --------------------------------------------------------

--
-- Structure for view `dimtransaction`
--
DROP TABLE IF EXISTS `dimtransaction`;

CREATE VIEW "workcommer"."dimtransaction" AS select "workcommer"."dimecommerce"."ID" AS "ID","workcommer"."dimecommerce"."TransactionId" AS "TransactionId","workcommer"."dimecommerce"."Affiliation" AS "Affiliation","workcommer"."dimecommerce"."VisitsToTransaction" AS "VisitsToTransaction","workcommer"."dimecommerce"."DaysToTransaction" AS "DaysToTransaction" from "workcommer"."dimecommerce";

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dimgoal`
--
ALTER TABLE `dimgoal`
  ADD CONSTRAINT "fk_dimGoal_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctadwords_one`
--
ALTER TABLE `fctadwords_one`
  ADD CONSTRAINT "fk_fctAdwords_one_dimAdwords_one" FOREIGN KEY ("dimAdwords_one") REFERENCES "dimadwords_one" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctAdwords_one_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctadwords_two`
--
ALTER TABLE `fctadwords_two`
  ADD CONSTRAINT "fk_fctAdwords_two_dimAdwords_two" FOREIGN KEY ("dimAdwords_two") REFERENCES "dimadwords_two" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctAdwords_two_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctcustomvar`
--
ALTER TABLE `fctcustomvar`
  ADD CONSTRAINT "fk_fctCustomVar_dimCustomVar1" FOREIGN KEY ("dimCustomVar1") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimCustomVar2" FOREIGN KEY ("dimCustomVar2") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimCustomVar3" FOREIGN KEY ("dimCustomVar3") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimCustomVar4" FOREIGN KEY ("dimCustomVar4") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimCustomVar5" FOREIGN KEY ("dimCustomVar5") REFERENCES "dimcustomvar" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctCustomVar_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctdate`
--
ALTER TABLE `fctdate`
  ADD CONSTRAINT "fk_fctDate_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDate_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctdevice`
--
ALTER TABLE `fctdevice`
  ADD CONSTRAINT "fk_fctDevice_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimGeo" FOREIGN KEY ("dimGeo") REFERENCES "dimgeo" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimHour" FOREIGN KEY ("dimHour") REFERENCES "dimhour" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimNetwork" FOREIGN KEY ("dimNetwork") REFERENCES "dimnetwork" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimPlatform" FOREIGN KEY ("dimPlatform") REFERENCES "dimplatform" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimSystem" FOREIGN KEY ("dimSystem") REFERENCES "dimsystem" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctDevice_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctecommerce`
--
ALTER TABLE `fctecommerce`
  ADD CONSTRAINT "fk_fctEcommerce_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctEcommerce_dimEcommerce" FOREIGN KEY ("dimEcommerce") REFERENCES "dimecommerce" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctEcommerce_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctevent`
--
ALTER TABLE `fctevent`
  ADD CONSTRAINT "fk_fctEvent_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctEvent_dimEvent" FOREIGN KEY ("dimEvent") REFERENCES "dimevent" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctEvent_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctexitpagepath`
--
ALTER TABLE `fctexitpagepath`
  ADD CONSTRAINT "fk_fctExitPagePath_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctExitPagePath_dimDaysSinceLastVisit" FOREIGN KEY ("dimDaysSinceLastVisit") REFERENCES "dimdaysince" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctExitPagePath_dimExitPagePath" FOREIGN KEY ("dimExitPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctExitPagePath_dimLandingPagePath" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctExitPagePath_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctExitPagePath_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctform`
--
ALTER TABLE `fctform`
  ADD CONSTRAINT "fk_fctForm_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimHostName" FOREIGN KEY ("dimHostName") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimSession" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctForm_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctgeo`
--
ALTER TABLE `fctgeo`
  ADD CONSTRAINT "fk_fctGeo_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGeo_dimGeo" FOREIGN KEY ("dimGeo") REFERENCES "dimgeo" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGeo_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctgoaltraffic`
--
ALTER TABLE `fctgoaltraffic`
  ADD CONSTRAINT "fk_fctGoalTraffic_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGoalTraffic_dimGoal" FOREIGN KEY ("dimGoal") REFERENCES "dimgoal" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGoalTraffic_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctGoalTraffic_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fcthostname`
--
ALTER TABLE `fcthostname`
  ADD CONSTRAINT "fk_fctHostname_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctHostname_dimHostname" FOREIGN KEY ("dimHostname") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctHostname_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctlandingpagepath`
--
ALTER TABLE `fctlandingpagepath`
  ADD CONSTRAINT "fk_fctLandingPagePath_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctLandingPagePath_dimLandingPagePath" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctLandingPagePath_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctloanhistory`
--
ALTER TABLE `fctloanhistory`
  ADD CONSTRAINT "fk_fctloanhistory_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimGeo" FOREIGN KEY ("dimGeo") REFERENCES "dimgeo" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimHostname" FOREIGN KEY ("dimHostName") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimLandingPage" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimMobile" FOREIGN KEY ("dimMobile") REFERENCES "dimmobile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimNetwork" FOREIGN KEY ("dimNetwork") REFERENCES "dimnetwork" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimPlatform" FOREIGN KEY ("dimPlatform") REFERENCES "dimplatform" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimSession" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimSystem" FOREIGN KEY ("dimSystem") REFERENCES "dimsystem" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctloanhistory_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctmobile`
--
ALTER TABLE `fctmobile`
  ADD CONSTRAINT "fk_fctMobile_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctMobile_dimMobile" FOREIGN KEY ("dimMobile") REFERENCES "dimmobile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctMobile_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctnetwork`
--
ALTER TABLE `fctnetwork`
  ADD CONSTRAINT "fk_fctNetwork_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctNetwork_dimNetwork" FOREIGN KEY ("dimNetwork") REFERENCES "dimnetwork" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctNetwork_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctpagetracking`
--
ALTER TABLE `fctpagetracking`
  ADD CONSTRAINT "fk_fctPageTracking_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimExitPagePath" FOREIGN KEY ("dimExitPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimHostname" FOREIGN KEY ("dimHostname") REFERENCES "dimhostname" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimLandingPagePath" FOREIGN KEY ("dimLandingPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimNextPagePath" FOREIGN KEY ("dimNextPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimPageDepth" FOREIGN KEY ("dimPageDepth") REFERENCES "dimpagedepth" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimPagePath" FOREIGN KEY ("dimPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimPreviousPagePath" FOREIGN KEY ("dimPreviousPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimSecondPagePath" FOREIGN KEY ("dimSecondPagePath") REFERENCES "dimpagepath" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPageTracking_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctplatform`
--
ALTER TABLE `fctplatform`
  ADD CONSTRAINT "fk_fctPlatform_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPlatform_dimPlatform" FOREIGN KEY ("dimPlatform") REFERENCES "dimplatform" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctPlatform_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsession`
--
ALTER TABLE `fctsession`
  ADD CONSTRAINT "fk_fctSession_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctSession_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctSession_dimVisitor" FOREIGN KEY ("dimSession") REFERENCES "dimsession" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctsystem`
--
ALTER TABLE `fctsystem`
  ADD CONSTRAINT "fk_fctSystem_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctSystem_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctSystem_dimSystem" FOREIGN KEY ("dimSystem") REFERENCES "dimsystem" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fcttraffic`
--
ALTER TABLE `fcttraffic`
  ADD CONSTRAINT "fk_fctTraffic_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctTraffic_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctTraffic_dimTraffic" FOREIGN KEY ("dimTraffic") REFERENCES "dimtraffic" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fctvisitor`
--
ALTER TABLE `fctvisitor`
  ADD CONSTRAINT "fk_fctVisitor_dimDate" FOREIGN KEY ("dimDate") REFERENCES "dimdate" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctVisitor_dimProfile" FOREIGN KEY ("dimProfile") REFERENCES "dimprofile" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_fctVisitor_dimVisitor" FOREIGN KEY ("dimVisitor") REFERENCES "dimvisitor" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
