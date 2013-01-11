---- --------------------------------------------------------

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctadwords_one]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctadwords_one]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimadwords_one]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimadwords_one]
go

CREATE TABLE "dbo"."dimadwords_one" (
  "ID" int NOT NULL identity,
  "AdGroup" varchar(45) DEFAULT NULL,
  "AdSlot" varchar(45) DEFAULT NULL,
  "AdSlotPosition" varchar(45) DEFAULT NULL,
  "AdPlacementDomain" varchar(45) DEFAULT NULL,
  "AdPlacementUrl" varchar(2048) DEFAULT NULL,
  "AdTargetingOption" varchar(45) DEFAULT NULL,
  "AdDestinationUrl" varchar(2048) DEFAULT NULL,
  PRIMARY KEY ("ID")
);

CREATE TABLE dbo."fctadwords_one" (
  "ID" int NOT NULL identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimAdwords_one" int NOT NULL,
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
);

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctadwords_two]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctadwords_two]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimadwords_two]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimadwords_two]
go

CREATE TABLE dbo."dimadwords_two" (
  "ID" int NOT NULL identity,
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
);

CREATE TABLE dbo."fctadwords_two" (
  "ID" int NOT NULL identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimAdwords_two" int NOT NULL,
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
  PRIMARY KEY ("ID")
);

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimconversionpathnodes]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimconversionpathnodes]
go
CREATE TABLE dbo."dimconversionpathnodes" (
  "ID" int NOT NULL identity,
  "NodeName" varchar(45) NOT NULL,
  PRIMARY KEY ("ID")
) ;

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctcustomvar]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctcustomvar]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimcustomvar]
go

CREATE TABLE dbo."dimcustomvar" (
  "ID" int NOT NULL identity,
  "customVarName" varchar(70) NOT NULL,
  "customVarValue" varchar(70) NOT NULL,
  PRIMARY KEY ("ID")
  
) ;

CREATE TABLE dbo."fctcustomvar" (
  "ID" int NOT NULL identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimCustomVar1" int NOT NULL,
  "dimCustomVar2" int NOT NULL,
  "dimCustomVar3" int NOT NULL,
  "dimCustomVar4" int NOT NULL,
  "dimCustomVar5" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID")
) ;

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctpagetracking]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctpagetracking]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctexitpagepath]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctexitpagepath]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimdaysince]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimdaysince]
go
CREATE TABLE dbo."dimdaysince" (
  "ID" int NOT NULL,
  "Days" int DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID")
);

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctecommerce]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctecommerce]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimecommerce]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimecommerce]
go
CREATE TABLE dbo."dimecommerce" (
  "ID" int NOT NULL identity,
  "TransactionId" varchar(70) NOT NULL,
  "Affiliation" varchar(70) DEFAULT NULL,
  "VisitsToTransaction" int DEFAULT NULL,
  "DaysToTransaction" int DEFAULT NULL,
  "ProductSku" varchar(70) DEFAULT NULL,
  "ProductName" varchar(70) DEFAULT NULL,
  "ProductCategory" varchar(70) DEFAULT NULL,
  PRIMARY KEY ("ID")
);


CREATE TABLE dbo."fctecommerce" (
  "ID" int NOT NULL identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimEcommerce" int NOT NULL,
  "ItemQuantity" int NOT NULL,
  PRIMARY KEY ("ID"),
  
);


go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[fctevent]') 
	AND type in (N'U'))
DROP TABLE [dbo].[fctevent]
go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimevent]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimevent]
go
CREATE table dbo."dimevent" (
  "ID" int NOT NULL identity,
  "EventCategory" varchar(70) NOT NULL,
  "EventAction" varchar(70) NOT NULL,
  "EventLabel" varchar(70) NOT NULL,
  PRIMARY KEY ("ID"),
);

CREATE TABLE  dbo."fctevent" (
  "ID" int identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimEvent" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  "totalEvents" int NOT NULL DEFAULT '0',
  "uniqueEvents" int NOT NULL DEFAULT '0',
  "eventValue" int NOT NULL DEFAULT '0',
  "visitsWithEvent" int NOT NULL DEFAULT '0',
  "eventsPerVisitWithEvent" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID")  
);

go
IF  EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[dimpagedepth]') 
	AND type in (N'U'))
DROP TABLE [dbo].[dimpagedepth]
go
CREATE TABLE dbo."dimpagedepth" (
  "ID" int NOT NULL,
  "PageDepth" int DEFAULT NULL,
  "Description" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("ID"),
);

CREATE TABLE dbo."fctexitpagepath" (
  "ID" int NOT NULL,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimLandingPagePath" int NOT NULL,
  "dimExitPagePath" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "dimDaysSinceLastVisit" int NOT NULL,
  "Visits" int NOT NULL DEFAULT '0',
  "Visitors" int NOT NULL DEFAULT '0',
  "NewVisits" int NOT NULL DEFAULT '0',
  "Bounces" int NOT NULL DEFAULT '0',
  "TimeOnSite" float NOT NULL DEFAULT '0',
  "OrganicSearches" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "GoalValueAll" float NOT NULL DEFAULT '0',
  "Entrances" int NOT NULL DEFAULT '0',
  "Pageviews" int NOT NULL DEFAULT '0',
  "UniquePageviews" int NOT NULL DEFAULT '0',
  "TimeOnPage" float NOT NULL DEFAULT '0',
  "Exits" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID")
);

go

CREATE TABLE dbo."fctpagetracking" (
  "ID" int NOT NULL identity,
  "dimDate" int NOT NULL,
  "dimProfile" int NOT NULL,
  "dimHostname" int NOT NULL,
  "dimVisitor" int NOT NULL,
  "dimPageDepth" int NOT NULL,
  "dimLandingPagePath" int NOT NULL,
  "dimSecondPagePath" int NOT NULL,
  "dimPagePath" int NOT NULL,
  "dimNextPagePath" int NOT NULL,
  "dimPreviousPagePath" int NOT NULL,
  "dimExitPagePath" int NOT NULL,
  "Entrances" int NOT NULL,
  "Pageviews" int NOT NULL,
  "UniquePageviews" int NOT NULL,
  "TimeOnPage" int NOT NULL,
  "Exits" int NOT NULL,
  "GoalCompletionsAll" int NOT NULL DEFAULT '0',
  "GoalStartsAll" int NOT NULL DEFAULT '0',
  "GoalAbandonsAll" int NOT NULL DEFAULT '0',
  "Goal1Completions" int NOT NULL DEFAULT '0',
  "Goal2Completions" int NOT NULL DEFAULT '0',
  "Goal3Completions" int NOT NULL DEFAULT '0',
  "Goal4Completions" int NOT NULL DEFAULT '0',
  "Goal5Completions" int NOT NULL DEFAULT '0',
  "Goal6Completions" int NOT NULL DEFAULT '0',
  "Goal7Completions" int NOT NULL DEFAULT '0',
  "Goal8Completions" int NOT NULL DEFAULT '0',
  "Goal9Completions" int NOT NULL DEFAULT '0',
  "Goal10Completions" int NOT NULL DEFAULT '0',
  "Goal11Completions" int NOT NULL DEFAULT '0',
  "Goal12Completions" int NOT NULL DEFAULT '0',
  "Goal13Completions" int NOT NULL DEFAULT '0',
  "Goal14Completions" int NOT NULL DEFAULT '0',
  "Goal15Completions" int NOT NULL DEFAULT '0',
  "Goal16Completions" int NOT NULL DEFAULT '0',
  "Goal17Completions" int NOT NULL DEFAULT '0',
  "Goal18Completions" int NOT NULL DEFAULT '0',
  "Goal19Completions" int NOT NULL DEFAULT '0',
  "Goal20Completions" int NOT NULL DEFAULT '0',
  PRIMARY KEY ("ID")
) ;




----
---- table dbo.structure for table dbo.'fctadwords'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fctadwords]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fctadwords]
--GO
--CREATE table dbo.fctadwords (
--  ID int NOT NULL identity,
--  "Date" int DEFAULT NULL,
--  "Hour" varchar(45) DEFAULT NULL,
--  AdGroup varchar(45) DEFAULT NULL,
--  AdDistributionNetwork varchar(45) DEFAULT NULL,
--  AdMatchType varchar(45) DEFAULT NULL,
--  AdDestinationUrl varchar(2048) DEFAULT NULL,
--  AdwordsCustomerID varchar(45) DEFAULT NULL,
--  AdwordsCampaignID varchar(45) DEFAULT NULL,
--  AdwordsAdGroupID varchar(45) DEFAULT NULL,
--  AdwordsCreativeID varchar(45) DEFAULT NULL,
--  AdwordsCriteriaID varchar(45) DEFAULT NULL,
--  Impressions varchar(45) DEFAULT NULL,
--  AdClicks varchar(45) DEFAULT NULL,
--  AdCost varchar(45) DEFAULT NULL,
--  CPM varchar(45) DEFAULT NULL,
--  CPC varchar(45) DEFAULT NULL,
--  CTR varchar(45) DEFAULT NULL,
--  CostPerTransaction varchar(45) DEFAULT NULL,
--  CostPerGoalConversion varchar(45) DEFAULT NULL,
--  CostPerConversion varchar(45) DEFAULT NULL,
--  RPC varchar(45) DEFAULT NULL,
--  ROI varchar(45) DEFAULT NULL,
--  Margin varchar(45) DEFAULT NULL,
--  Goal1Starts varchar(45) DEFAULT NULL,
--  Goal1Completions varchar(45) DEFAULT NULL,
--  Goal1Value varchar(45) DEFAULT NULL,
--  Goal1ConversionRate varchar(45) DEFAULT NULL,
--  Goal1Abandons varchar(45) DEFAULT NULL,
--  Goal1AbandonRate varchar(45) DEFAULT NULL,
--  Goal2Starts varchar(45) DEFAULT NULL,
--  Goal2Completions varchar(45) DEFAULT NULL,
--  Goal2Value varchar(45) DEFAULT NULL,
--  Goal2ConversionRate varchar(45) DEFAULT NULL,
--  Goal2Abandons varchar(45) DEFAULT NULL,
--  Goal2AbandonRate varchar(45) DEFAULT NULL,
--  Goal3Starts varchar(45) DEFAULT NULL,
--  Goal3Completions varchar(45) DEFAULT NULL,
--  Goal3Value varchar(45) DEFAULT NULL,
--  Goal3ConversionRate varchar(45) DEFAULT NULL,
--  Goal3Abandons varchar(45) DEFAULT NULL,
--  Goal3AbandonRate varchar(45) DEFAULT NULL,
--  GoalStartsAll varchar(45) DEFAULT NULL,
--  GoalCompletionsAll varchar(45) DEFAULT NULL,
--  GoalValueAll varchar(45) DEFAULT NULL,
--  GoalValuePerVisit varchar(45) DEFAULT NULL,
--  GoalConversionRateAll varchar(45) DEFAULT NULL,
--  GoalAbandonsAll varchar(45) DEFAULT NULL,
--  GoalAbandonRateAll varchar(45) DEFAULT NULL,
--  NewVisits varchar(45) DEFAULT NULL,
--  PercentNewVisits varchar(45) DEFAULT NULL,
--  Visits varchar(45) DEFAULT NULL,
--  Bounces varchar(45) DEFAULT NULL,
--  EntranceBounceRate varchar(45) DEFAULT NULL,
--  VisitBounceRate varchar(45) DEFAULT NULL,
--  TimeOnSite varchar(45) DEFAULT NULL,
--  AvgTimeOnSite varchar(45) DEFAULT NULL,
--  OrganicSearches varchar(45) DEFAULT NULL,
--  Entrances varchar(45) DEFAULT NULL,
--  EntranceRate varchar(45) DEFAULT NULL,
--  Pageviews varchar(45) DEFAULT NULL,
--  PageviewsPerVisit varchar(45) DEFAULT NULL,
--  UniquePageviews varchar(45) DEFAULT NULL,
--  TimeOnPage varchar(45) DEFAULT NULL,
--  AvgTimeOnPage varchar(45) DEFAULT NULL,
--  Exits varchar(45) DEFAULT NULL,
--  ExitRate varchar(45) DEFAULT NULL,
--  PageLoadTime varchar(45) DEFAULT NULL,
--  PageLoadSample varchar(45) DEFAULT NULL,
--  AvgPageLoadTime varchar(45) DEFAULT NULL,
--  DomainLookupTime varchar(45) DEFAULT NULL,
--  AvgDomainLookupTime varchar(45) DEFAULT NULL,
--  PageDownloadTime varchar(45) DEFAULT NULL,
--  AvgPageDownloadTime varchar(45) DEFAULT NULL,
--  RedirectionTime varchar(45) DEFAULT NULL,
--  AvgRedirectionTime varchar(45) DEFAULT NULL,
--  ServerConnectionTime varchar(45) DEFAULT NULL,
--  AvgServerConnectionTime varchar(45) DEFAULT NULL,
--  ServerResponseTime varchar(45) DEFAULT NULL,
--  AvgServerResponseTime varchar(45) DEFAULT NULL,
--  SpeedMetricsSample varchar(45) DEFAULT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctdate'
----
---- Creation: Dec 14, 2012 at 07:43 AM
----

--DROP table dbo.fctdate;
--CREATE table dbo.fctdate (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctdevice'
----
---- Creation: Dec 13, 2012 at 07:21 PM
----
--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fctdevice]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fctdevice]
--GO
--CREATE table dbo.fctdevice (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimHour int NOT NULL,
--  dimProfile int NOT NULL,
--  dimGeo int NOT NULL,
--  dimPlatform int NOT NULL,
--  dimSystem int NOT NULL,
--  dimNetwork int NOT NULL,
--  dimVisitor int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctform'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----
--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fctform]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fctform]
--GO

--CREATE table dbo.fctform (
--  ID int NOT NULL identity,
--  dimProfile int NOT NULL,
--  dimDate int NOT NULL,
--  dimVisitor int NOT NULL,
--  dimSession int NOT NULL,
--  dimPagePath int NOT NULL,
--  dimHostName int NOT NULL,
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  TimeOnSite int NOT NULL DEFAULT '0',
--  Visits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctgeo'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----
--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fctgeo]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fctgeo]
--GO

--CREATE table dbo.fctgeo (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimGeo int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctgeo:
----   dimDate
----       dimdate -> ID
----   dimGeo
----       dimgeo -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fcthostname'
----
---- Creation: Dec 14, 2012 at 03:09 PM
----
--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fcthostname]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fcthostname]
--GO
--CREATE table dbo.fcthostname (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimHostname int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fcthostname:
----   dimDate
----       dimdate -> ID
----   dimHostname
----       dimhostname -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctlandingpagepath'
----
---- Creation: Dec 14, 2012 at 03:15 PM
----
--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[fctlandingpagepath]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[fctlandingpagepath]
--GO
--CREATE table dbo.fctlandingpagepath (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimLandingPagePath int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctlandingpagepath:
----   dimDate
----       dimdate -> ID
----   dimLandingPagePath
----       dimpagepath -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctloanhistory'
----
---- Creation: Dec 12, 2012 at 06:16 PM
----

--DROP table dbo.fctloanhistory;
--CREATE table dbo.fctloanhistory (
--  ID int NOT NULL identity,
--  dimProfile int NOT NULL,
--  dimDate int NOT NULL,
--  dimHostName int NOT NULL,
--  dimNetwork int NOT NULL,
--  dimVisitor int NOT NULL,
--  dimSession int NOT NULL,
--  dimGeo int NOT NULL,
--  dimSystem int NOT NULL,
--  dimPlatform int NOT NULL,
--  dimLandingPagePath int NOT NULL,
--  dimMobile int NOT NULL,
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  TimeOnSite int NOT NULL DEFAULT '0',
--  Visits int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Goal1Starts int NOT NULL DEFAULT '0',
--  Goal1Completions int NOT NULL DEFAULT '0',
--  Goal1Abandons int NOT NULL DEFAULT '0',
--  Goal1Value float NOT NULL DEFAULT '0',
--  Goal2Starts int NOT NULL DEFAULT '0',
--  Goal2Completions int NOT NULL DEFAULT '0',
--  Goal2Abandons int NOT NULL DEFAULT '0',
--  Goal2Value float NOT NULL DEFAULT '0',
--  Goal3Starts int NOT NULL DEFAULT '0',
--  Goal3Completions int NOT NULL DEFAULT '0',
--  Goal3Abandons int NOT NULL DEFAULT '0',
--  Goal3Value float NOT NULL DEFAULT '0',
--  Goal4Starts int NOT NULL DEFAULT '0',
--  Goal4Completions int NOT NULL DEFAULT '0',
--  Goal4Abandons int NOT NULL DEFAULT '0',
--  Goal4Value float NOT NULL DEFAULT '0',
--  Goal5Starts int NOT NULL DEFAULT '0',
--  Goal5Completions int NOT NULL DEFAULT '0',
--  Goal5Abandons int NOT NULL DEFAULT '0',
--  Goal5Value float NOT NULL DEFAULT '0',
--  Goal6Starts int NOT NULL DEFAULT '0',
--  Goal6Completions int NOT NULL DEFAULT '0',
--  Goal6Abandons int NOT NULL DEFAULT '0',
--  Goal6Value float NOT NULL DEFAULT '0',
--  Goal7Starts int NOT NULL DEFAULT '0',
--  Goal7Completions int NOT NULL DEFAULT '0',
--  Goal7Abandons int NOT NULL DEFAULT '0',
--  Goal7Value float NOT NULL DEFAULT '0',
--  Goal8Starts int NOT NULL DEFAULT '0',
--  Goal8Completions int NOT NULL DEFAULT '0',
--  Goal8Abandons int NOT NULL DEFAULT '0',
--  Goal8Value float NOT NULL DEFAULT '0',
--  Goal9Starts int NOT NULL DEFAULT '0',
--  Goal9Completions int NOT NULL DEFAULT '0',
--  Goal9Abandons int NOT NULL DEFAULT '0',
--  Goal9Value float NOT NULL DEFAULT '0',
--  Goal10Starts int NOT NULL DEFAULT '0',
--  Goal10Completions int NOT NULL DEFAULT '0',
--  Goal10Abandons int NOT NULL DEFAULT '0',
--  Goal10Value float NOT NULL DEFAULT '0',
--  Goal11Starts int NOT NULL DEFAULT '0',
--  Goal11Completions int NOT NULL DEFAULT '0',
--  Goal11Abandons int NOT NULL DEFAULT '0',
--  Goal11Value float NOT NULL DEFAULT '0',
--  Goal12Starts int NOT NULL DEFAULT '0',
--  Goal12Completions int NOT NULL DEFAULT '0',
--  Goal12Abandons int NOT NULL DEFAULT '0',
--  Goal12Value float NOT NULL DEFAULT '0',
--  Goal13Starts int NOT NULL DEFAULT '0',
--  Goal13Completions int NOT NULL DEFAULT '0',
--  Goal13Abandons int NOT NULL DEFAULT '0',
--  Goal13Value float NOT NULL DEFAULT '0',
--  Goal14Starts int NOT NULL DEFAULT '0',
--  Goal14Completions int NOT NULL DEFAULT '0',
--  Goal14Abandons int NOT NULL DEFAULT '0',
--  Goal14Value float NOT NULL DEFAULT '0',
--  Goal15Starts int NOT NULL DEFAULT '0',
--  Goal15Completions int NOT NULL DEFAULT '0',
--  Goal15Abandons int NOT NULL DEFAULT '0',
--  Goal15Value float NOT NULL DEFAULT '0',
--  Goal16Starts int NOT NULL DEFAULT '0',
--  Goal16Completions int NOT NULL DEFAULT '0',
--  Goal16Abandons int NOT NULL DEFAULT '0',
--  Goal16Value float NOT NULL DEFAULT '0',
--  Goal17Starts int NOT NULL DEFAULT '0',
--  Goal17Completions int NOT NULL DEFAULT '0',
--  Goal17Abandons int NOT NULL DEFAULT '0',
--  Goal17Value float NOT NULL DEFAULT '0',
--  Goal18Starts int NOT NULL DEFAULT '0',
--  Goal18Completions int NOT NULL DEFAULT '0',
--  Goal18Abandons int NOT NULL DEFAULT '0',
--  Goal18Value float NOT NULL DEFAULT '0',
--  Goal19Starts int NOT NULL DEFAULT '0',
--  Goal19Completions int NOT NULL DEFAULT '0',
--  Goal19Abandons int NOT NULL DEFAULT '0',
--  Goal19Value float NOT NULL DEFAULT '0',
--  Goal20Starts int NOT NULL DEFAULT '0',
--  Goal20Completions int NOT NULL DEFAULT '0',
--  Goal20Abandons int NOT NULL DEFAULT '0',
--  Goal20Value float NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctloanhistory:
----   dimDate
----       dimdate -> ID
----   dimGeo
----       dimgeo -> ID
----   dimHostName
----       dimhostname -> ID
----   dimLandingPagePath
----       dimpagepath -> ID
----   dimMobile
----       dimmobile -> ID
----   dimNetwork
----       dimnetwork -> ID
----   dimPlatform
----       dimplatform -> ID
----   dimProfile
----       dimprofile -> ID
----   dimSession
----       dimsession -> ID
----   dimSystem
----       dimsystem -> ID
----   dimVisitor
----       dimvisitor -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctmobile'
----
---- Creation: Dec 14, 2012 at 06:40 PM
----

--DROP table dbo.fctmobile;
--CREATE table dbo.fctmobile (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimMobile int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctmobile:
----   dimDate
----       dimdate -> ID
----   dimMobile
----       dimmobile -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctnetwork'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.fctnetwork;
--CREATE table dbo.fctnetwork (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimNetwork int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctnetwork:
----   dimDate
----       dimdate -> ID
----   dimNetwork
----       dimnetwork -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctplatform'
----
---- Creation: Dec 14, 2012 at 04:35 PM
----

--DROP table dbo.fctplatform;
--CREATE table dbo.fctplatform (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimPlatform int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctplatform:
----   dimDate
----       dimdate -> ID
----   dimPlatform
----       dimplatform -> ID
----   dimProfile
----       dimprofile -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctsession'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.fctsession;
--CREATE table dbo.fctsession (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimSession int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctsession:
----   dimDate
----       dimdate -> ID
----   dimProfile
----       dimprofile -> ID
----   dimSession
----       dimsession -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctsystem'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.fctsystem;
--CREATE table dbo.fctsystem (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimSystem int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctsystem:
----   dimDate
----       dimdate -> ID
----   dimProfile
----       dimprofile -> ID
----   dimSystem
----       dimsystem -> ID
----

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'fctvisitor'
----
---- Creation: Dec 14, 2012 at 10:58 AM
----

--DROP table dbo.fctvisitor;
--CREATE table dbo.fctvisitor (
--  ID int NOT NULL identity,
--  dimDate int NOT NULL,
--  dimProfile int NOT NULL,
--  dimVisitor int NOT NULL,
--  Visits int NOT NULL DEFAULT '0',
--  Visitors int NOT NULL DEFAULT '0',
--  NewVisits int NOT NULL DEFAULT '0',
--  Bounces int NOT NULL DEFAULT '0',
--  TimeOnSite float NOT NULL DEFAULT '0',
--  OrganicSearches int NOT NULL DEFAULT '0',
--  GoalStartsAll int NOT NULL DEFAULT '0',
--  GoalCompletionsAll int NOT NULL DEFAULT '0',
--  GoalAbandonsAll int NOT NULL DEFAULT '0',
--  GoalValueAll float NOT NULL DEFAULT '0',
--  Entrances int NOT NULL DEFAULT '0',
--  Pageviews int NOT NULL DEFAULT '0',
--  UniquePageviews int NOT NULL DEFAULT '0',
--  TimeOnPage float NOT NULL DEFAULT '0',
--  Exits int NOT NULL DEFAULT '0',
--  PRIMARY KEY (ID)
--) ;

----
---- RELATIONS FOR table dbo.fctvisitor:
----   dimDate
----       dimdate -> ID
----   dimProfile
----       dimprofile -> ID
----   dimVisitor
----       dimvisitor -> ID
----

---- --------------------------------------------------------

----
---- Structure for view 'dimexitpagepath'
----
--GO

--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimexitpagepath]'))
--DROP VIEW [dbo].[dimexitpagepath]
--GO
--create VIEW dbo.dimexitpagepath 
--AS 
--select ID AS ID,PagePath AS ExitPagePath 
--from dbo.dimpagepath;

---- --------------------------------------------------------

----
---- Structure for view 'dimlandingpagepath'
----
--GO

--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimlandingpagepath]'))
--DROP VIEW [dbo].[dimlandingpagepath]
--GO

--go
--create VIEW dbo.dimlandingpagepath 
--AS 
--select ID AS ID,PagePath AS LandingPagePath 
--from dbo.dimpagepath;
--go

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimadwords'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--USE [WorkCommer]

--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[dimadwords]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[dimadwords]
--GO
--CREATE table dbo.dimadwords (
--  ID int NOT NULL identity,
--  AdGroup varchar(45) DEFAULT NULL,
--  AdSlot varchar(45) DEFAULT NULL,
--  AdSlotPosition varchar(45) DEFAULT NULL,
--  AdDistributionNetwork varchar(45) DEFAULT NULL,
--  AdMatchType varchar(45) DEFAULT NULL,
--  AdMatchedQuery varchar(45) DEFAULT NULL,
--  AdPlacementDomain varchar(45) DEFAULT NULL,
--  AdPlacementUrl varchar(2048) DEFAULT NULL,
--  AdFormat varchar(45) DEFAULT NULL,
--  AdTargetingType varchar(45) DEFAULT NULL,
--  AdTargetingOption varchar(45) DEFAULT NULL,
--  AdDisplayUrl varchar(2048) DEFAULT NULL,
--  AdDestinationUrl varchar(2048) DEFAULT NULL,
--  AdwordsCustomerID varchar(45) DEFAULT NULL,
--  AdwordsCampaignID varchar(45) DEFAULT NULL,
--  AdwordsAdGroupID varchar(45) DEFAULT NULL,
--  AdwordsCreativeID varchar(45) DEFAULT NULL,
--  AdwordsCriteriaID varchar(45) DEFAULT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimdate'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--GO
--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[dimdate]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[dimdate]
--GO
--CREATE table dbo.dimdate (
--  ID int NOT NULL,
--  "Date" date DEFAULT NULL,
--  "Description" varchar(45) DEFAULT NULL,
--  "Year" char(4) DEFAULT NULL,
--  "Month" char(2) DEFAULT NULL,
--  "Week" char(2) DEFAULT NULL,
--  "Day" char(2) DEFAULT NULL,
--  "DayOfWeek" char(2) DEFAULT NULL,
--  "MonthName" varchar(15) DEFAULT NULL,
--  "DayOfWeekName" varchar(15) DEFAULT NULL,
--  PRIMARY KEY (ID)  
--) ;

--insert into dimdate(ID,Description) values (-1,'Unknown Date');
---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimgeo'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimgeo;
--CREATE table dbo.dimgeo (
--  ID int NOT NULL identity,
--  Latitude decimal(9,6) NOT NULL,
--  Longitude decimal(9,6) NOT NULL,
--  City varchar(45) NOT NULL,
--  Country varchar(45) NOT NULL,
--  Continent varchar(45) NOT NULL,
--  SubContinent varchar(45) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimhostname'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimhostname;
--CREATE table dbo.dimhostname (
--  ID int NOT NULL identity,
--  Hostname varchar(512) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimhour'
----
---- Creation: Dec 13, 2012 at 07:25 PM
----

--IF  EXISTS (
--	SELECT * 
--	FROM sys.objects 
--	WHERE object_id = OBJECT_ID(N'[dbo].[dimhour]') 
--	AND type in (N'U'))
--DROP TABLE [dbo].[dimhour]
--GO
--CREATE table dbo.dimhour (
--  ID int NOT NULL,
--  "Hour" varchar(2) NOT NULL,
--  Description varchar(45) NOT NULL,
--  StartTime datetime NOT NULL,
--  EndTime datetime NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimmobile'
----
---- Creation: Dec 14, 2012 at 06:30 PM
----

--DROP table dbo.dimmobile;
--CREATE table dbo.dimmobile (
--  ID int NOT NULL identity,
--  IsMobile varchar(45) NOT NULL,
--  MobileDeviceBranding varchar(45) NOT NULL,
--  MobileDeviceModel varchar(45) NOT NULL,
--  MobileInputSelector varchar(45) NOT NULL,
--  MobileDeviceInfo varchar(45) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimnetwork'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimnetwork;
--CREATE table dbo.dimnetwork (
--  ID int NOT NULL identity,
--  NetworkDomain varchar(45) NOT NULL,
--  NetworkLocation varchar(512) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimpagepath'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimpagepath;
--CREATE table dbo.dimpagepath (
--  ID int NOT NULL identity,
--  PagePath varchar(4096) NOT NULL,
--  PageType varchar(45) NOT NULL DEFAULT 'Unknown',
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimpagetracking'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimpagetracking;
--CREATE table dbo.dimpagetracking (
--  ID int NOT NULL identity,
--  Hostname varchar(45) NOT NULL,
--  PagePath varchar(45) NOT NULL,
--  LandingPagePath varchar(45) NOT NULL,
--  SecondPagePath varchar(45) NOT NULL,
--  ExitPagePath varchar(45) NOT NULL,
--  PreviousPagePath varchar(45) NOT NULL,
--  NextPagePath varchar(45) NOT NULL,
--  PRIMARY KEY (ID)

--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimplatform'
----
---- Creation: Dec 13, 2012 at 07:55 AM
----

--DROP table dbo.dimplatform;
--CREATE table dbo.dimplatform (
--  ID int NOT NULL identity,
--  Browser varchar(45) NOT NULL,
--  BrowserVersion varchar(45) NOT NULL,
--  OperatingSystem varchar(45) NOT NULL,
--  OperatingSystemVersion varchar(45) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimprofile'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimprofile;
--CREATE table dbo.dimprofile (
--  ID int NOT NULL,
--  ProfileName varchar(45) NOT NULL DEFAULT 'Unknown',
--  WebPropertyID varchar(45) NOT NULL,
--  Currency varchar(45) NOT NULL,
--  WebsiteURL varchar(45) NOT NULL,
--  "Type" varchar(45) NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimsession'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimsession;
--CREATE table dbo.dimsession (
--  ID int NOT NULL,
--  VisitLength int NOT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimsocialtraffic'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimsocialtraffic;
--CREATE table dbo.dimsocialtraffic (
--  ID int NOT NULL identity,
--  SocialNetwork varchar(45) DEFAULT NULL,
--  HasSocialSourceReferral varchar(45) DEFAULT NULL,
--  PRIMARY KEY (ID)
--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimsystem'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimsystem;
--CREATE table dbo.dimsystem (
--  ID int NOT NULL identity,
--  FlashVersion varchar(45) NOT NULL,
--  JavaEnabled varchar(45) NOT NULL,
--  "Language" varchar(45) NOT NULL,
--  ScreenColors varchar(45) NOT NULL,
--  ScreenResolution varchar(45) NOT NULL,
--  PRIMARY KEY (ID)

--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimtraffic'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimtraffic;
--CREATE table dbo.dimtraffic (
--  ID int NOT NULL identity,
--  ReferralPath varchar(45) DEFAULT NULL,
--  Campaign varchar(45) DEFAULT NULL,
--  "Source" varchar(45) DEFAULT NULL,
--  "Medium" varchar(45) DEFAULT NULL,
--  Keyword varchar(45) DEFAULT NULL,
--  AdContent varchar(45) DEFAULT NULL,
--  PRIMARY KEY (ID)

--) ;

---- --------------------------------------------------------

----
---- table dbo.structure for table dbo.'dimvisitor'
----
---- Creation: Dec 12, 2012 at 01:50 PM
----

--DROP table dbo.dimvisitor;
--CREATE table dbo.dimvisitor (
--  ID int NOT NULL,
--  VisitCount int DEFAULT NULL,
--  VisitorType varchar(45) DEFAULT NULL,
--  PRIMARY KEY (ID)
  
--) ;


-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar1`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar1]'))
DROP VIEW [dbo].[dimcustomvar1]
GO

CREATE VIEW "dbo"."dimcustomvar1" 
AS 
select "ID","customVarName" AS "CustomVarName1","customVarValue" AS "CustomVarValue1" 
from "dbo"."dimcustomvar";
go
-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar2`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar2]'))
DROP VIEW [dbo].[dimcustomvar2]
GO

CREATE VIEW "dbo"."dimcustomvar2" 
AS 
select "ID","customVarName" AS "CustomVarName2","customVarValue" AS "CustomVarValue2" 
from "dbo"."dimcustomvar";
go

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar3`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar3]'))
DROP VIEW [dbo].[dimcustomvar3]
GO

CREATE VIEW "dbo"."dimcustomvar3" 
AS 
select "ID","customVarName" AS "CustomVarName3","customVarValue" AS "CustomVarValue3" 
from "dbo"."dimcustomvar";
go

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar4`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar4]'))
DROP VIEW [dbo].[dimcustomvar4]
GO

CREATE VIEW "dbo"."dimcustomvar4" 
AS 
select "ID","customVarName" AS "CustomVarName1","customVarValue" AS "CustomVarValue4" 
from "dbo"."dimcustomvar";
go

-- --------------------------------------------------------

--
-- Structure for view `dimcustomvar5`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimcustomvar5]'))
DROP VIEW [dbo].[dimcustomvar5]
GO

CREATE VIEW "dbo"."dimcustomvar5" 
AS 
select "ID","customVarName" AS "CustomVarName5","customVarValue" AS "CustomVarValue5" 
from "dbo"."dimcustomvar";
go

-- --------------------------------------------------------

--
-- Structure for view `dimdayssincelastvisit`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimdayssincelastvisit]'))
DROP VIEW [dbo].[dimdayssincelastvisit]
GO

CREATE VIEW dbo."dimdayssincelastvisit" AS 
select "ID","Days" AS "DaysSinceLastVisit","Description" from dbo."dimdaysince";

go
-- --------------------------------------------------------

--
-- Structure for view `dimexitpagepath`
--
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimexitpagepath]'))
DROP VIEW [dbo].[dimexitpagepath]
GO

CREATE VIEW dbo."dimexitpagepath" AS 
select "ID","PagePath" AS "ExitPagePath" 
from dbo."dimpagepath";
go
-- --------------------------------------------------------

--
-- Structure for view `dimlandingpagepath`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimlandingpagepath]'))
DROP VIEW [dbo].[dimlandingpagepath]
GO

CREATE VIEW dbo."dimlandingpagepath" AS 
select "ID","PagePath" AS "LandingPagePath" 
from dbo."dimpagepath";
go
-- --------------------------------------------------------

--
-- Structure for view `dimnextpagepath`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimnextpagepath]'))
DROP VIEW [dbo].[dimnextpagepath]
GO

CREATE VIEW dbo."dimnextpagepath" AS 
select "ID","PagePath" AS "NextPagePath" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel1`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimpagepathlevel1]'))
DROP VIEW [dbo].[dimpagepathlevel1]
GO

CREATE VIEW dbo."dimpagepathlevel1" AS 
select "ID","PagePath" AS "PagePathLevel1" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel2`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimpagepathlevel2]'))
DROP VIEW [dbo].[dimpagepathlevel2]
GO

CREATE VIEW dbo."dimpagepathlevel2" AS 
select "ID","PagePath" AS "PagePathLevel2" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel3`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimpagepathlevel3]'))
DROP VIEW [dbo].[dimpagepathlevel3]
GO

CREATE VIEW dbo."dimpagepathlevel3" AS 
select "ID","PagePath" AS "PagePathLevel3" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimpagepathlevel4`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimpagepathlevel4]'))
DROP VIEW [dbo].[dimpagepathlevel4]
GO

CREATE VIEW dbo."dimpagepathlevel4" AS 
select "ID","PagePath" AS "PagePathLevel4" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimpreviouspagepath`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimpreviouspagepath]'))
DROP VIEW [dbo].[dimpreviouspagepath]
GO

CREATE VIEW dbo."dimpreviouspagepath" AS 
select "ID","PagePath" AS "PreviousPagePath" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimproduct`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimproduct]'))
DROP VIEW [dbo].[dimproduct]
GO

CREATE VIEW dbo."dimproduct" AS 
select "ID","TransactionId" ,"ProductSku" ,"ProductName","ProductCategory" 
AS "ProductCategory" from dbo."dimecommerce";
go
-- --------------------------------------------------------

--
-- Structure for view `dimsecondpagepath`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimsecondpagepath]'))
DROP VIEW [dbo].[dimsecondpagepath]
GO

CREATE VIEW dbo."dimsecondpagepath" AS 
select "ID","PagePath" AS "SecondPagePath" 
from dbo."dimpagepath";
go

-- --------------------------------------------------------

--
-- Structure for view `dimtransaction`
--
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[dimtransaction]'))
DROP VIEW [dbo].[dimtransaction]
GO

CREATE VIEW dbo."dimtransaction" AS 
select "ID","TransactionId", "Affiliation", "VisitsToTransaction", "DaysToTransaction" 
from dbo."dimecommerce";
go



----
---- Constraints for dumped tables
----

----
---- Constraints for table dbo."fctdate"
----
--ALTER table dbo."fctdate"  ADD CONSTRAINT fk_fctDate_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID);
--ALTER table dbo."fctdate"  ADD CONSTRAINT fk_fctDate_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctdevice"
----

--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimHour FOREIGN KEY (dimHour) REFERENCES dimhour (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ;
--ALTER table dbo."fctdevice"  ADD CONSTRAINT fk_fctDevice_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID);

----
---- Constraints for table dbo."fctform"
----

--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimHostName FOREIGN KEY (dimHostName) REFERENCES dimhostname (ID) ;
--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimpagepath (ID) ;
--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimSession FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ;
--ALTER table dbo."fctform"  ADD CONSTRAINT fk_fctForm_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID);

----
---- Constraints for table dbo."fctgeo"
----

--ALTER table dbo."fctgeo"  ADD CONSTRAINT fk_fctGeo_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctgeo"  ADD CONSTRAINT fk_fctGeo_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ;
--ALTER table dbo."fctgeo"  ADD CONSTRAINT fk_fctGeo_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fcthostname"
----
--ALTER table dbo."fcthostname"  ADD CONSTRAINT fk_fctHostname_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fcthostname"  ADD CONSTRAINT fk_fctHostname_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimhostname (ID) ;
--ALTER table dbo."fcthostname"  ADD CONSTRAINT fk_fctHostname_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctlandingpagepath"
----

--ALTER table dbo."fctlandingpagepath"  ADD CONSTRAINT fk_fctLandingPagePath_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctlandingpagepath"  ADD CONSTRAINT fk_fctLandingPagePath_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ;
--ALTER table dbo."fctlandingpagepath"  ADD CONSTRAINT fk_fctLandingPagePath_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctloanhistory"
----

--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimGeo FOREIGN KEY (dimGeo) REFERENCES dimgeo (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimHostname FOREIGN KEY (dimHostName) REFERENCES dimhostname (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimLandingPage FOREIGN KEY (dimLandingPagePath) REFERENCES dimpagepath (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimMobile FOREIGN KEY (dimMobile) REFERENCES dimmobile (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimSession FOREIGN KEY (dimSession) REFERENCES dimsession (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID) ;
--ALTER table dbo."fctloanhistory"  ADD CONSTRAINT fk_fctloanhistory_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID);

----
---- Constraints for table dbo."fctmobile"
----

--ALTER table dbo."fctmobile"  ADD CONSTRAINT fk_fctMobile_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctmobile"  ADD CONSTRAINT fk_fctMobile_dimMobile FOREIGN KEY (dimMobile) REFERENCES dimmobile (ID) ;
--ALTER table dbo."fctmobile"  ADD CONSTRAINT fk_fctMobile_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctnetwork"
----

--ALTER table dbo."fctnetwork"  ADD CONSTRAINT fk_fctNetwork_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctnetwork"  ADD CONSTRAINT fk_fctNetwork_dimNetwork FOREIGN KEY (dimNetwork) REFERENCES dimnetwork (ID) ;
--ALTER table dbo."fctnetwork"  ADD CONSTRAINT fk_fctNetwork_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctplatform"
----

--ALTER table dbo."fctplatform"  ADD CONSTRAINT fk_fctPlatform_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctplatform"  ADD CONSTRAINT fk_fctPlatform_dimPlatform FOREIGN KEY (dimPlatform) REFERENCES dimplatform (ID) ;
--ALTER table dbo."fctplatform"  ADD CONSTRAINT fk_fctPlatform_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID);

----
---- Constraints for table dbo."fctsession"
----

--ALTER table dbo."fctsession"  ADD CONSTRAINT fk_fctSession_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctsession"  ADD CONSTRAINT fk_fctSession_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctsession"  ADD CONSTRAINT fk_fctSession_dimVisitor FOREIGN KEY (dimSession) REFERENCES dimsession (ID);

----
---- Constraints for table dbo."fctsystem"
----

--ALTER table dbo."fctsystem"  ADD CONSTRAINT fk_fctSystem_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctsystem"  ADD CONSTRAINT fk_fctSystem_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctsystem"  ADD CONSTRAINT fk_fctSystem_dimSystem FOREIGN KEY (dimSystem) REFERENCES dimsystem (ID);

----
---- Constraints for table dbo."fctvisitor"
----

--ALTER table dbo."fctvisitor"  ADD CONSTRAINT fk_fctVisitor_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
--ALTER table dbo."fctvisitor"  ADD CONSTRAINT fk_fctVisitor_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
--ALTER table dbo."fctvisitor"  ADD CONSTRAINT fk_fctVisitor_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimvisitor (ID);

go
ALTER table dbo."fctadwords_one"  ADD CONSTRAINT fk_fctadwords_one_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctadwords_one"  ADD CONSTRAINT fk_fctadwords_one_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctadwords_one"  ADD CONSTRAINT fk_fctadwords_one_dimAdwords_one FOREIGN KEY (dimAdwords_one) REFERENCES dimadwords_one (ID) ;

go
ALTER table dbo."fctadwords_two"  ADD CONSTRAINT fk_fctadwords_two_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctadwords_two"  ADD CONSTRAINT fk_fctadwords_two_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctadwords_two"  ADD CONSTRAINT fk_fctadwords_two_dimAdwords_two FOREIGN KEY (dimAdwords_two) REFERENCES dimadwords_two (ID) ;

go
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar1 FOREIGN KEY (dimCustomVar1) REFERENCES dimCustomVar (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar2 FOREIGN KEY (dimCustomVar2) REFERENCES dimCustomVar (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar3 FOREIGN KEY (dimCustomVar3) REFERENCES dimCustomVar (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar4 FOREIGN KEY (dimCustomVar4) REFERENCES dimCustomVar (ID) ;
ALTER table dbo."fctCustomVar"  ADD CONSTRAINT fk_fctCustomVar_dimCustomVar5 FOREIGN KEY (dimCustomVar5) REFERENCES dimCustomVar (ID) ;

go
ALTER table dbo."fctEcommerce"  ADD CONSTRAINT fk_fctEcommerce_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctEcommerce"  ADD CONSTRAINT fk_fctEcommerce_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctEcommerce"  ADD CONSTRAINT fk_fctEcommerce_dimEcommerce FOREIGN KEY (dimEcommerce) REFERENCES dimEcommerce (ID) ;

go
ALTER table dbo."fctEvent"  ADD CONSTRAINT fk_fctEvent_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctEvent"  ADD CONSTRAINT fk_fctEvent_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctEvent"  ADD CONSTRAINT fk_fctEvent_dimEvent FOREIGN KEY (dimEvent) REFERENCES dimEvent (ID) ;

go
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimVisitor (ID) ;
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimExitPagePath FOREIGN KEY (dimExitPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctExitPagePath"  ADD CONSTRAINT fk_fctExitPagePath_dimDaysSinceLastVisit FOREIGN KEY (dimDaysSinceLastVisit) REFERENCES dimDaySince (ID) ;
  
go
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimDate FOREIGN KEY (dimDate) REFERENCES dimdate (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimProfile FOREIGN KEY (dimProfile) REFERENCES dimprofile (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimVisitor FOREIGN KEY (dimVisitor) REFERENCES dimVisitor (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimLandingPagePath FOREIGN KEY (dimLandingPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimExitPagePath FOREIGN KEY (dimExitPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimSecondPagePath FOREIGN KEY (dimSecondPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimPagePath FOREIGN KEY (dimPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimPreviousPagePath FOREIGN KEY (dimPreviousPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimNextPagePath FOREIGN KEY (dimNextPagePath) REFERENCES dimPagePath (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimHostname FOREIGN KEY (dimHostname) REFERENCES dimHostname (ID) ;
ALTER table dbo."fctPageTracking"  ADD CONSTRAINT fk_fctPageTracking_dimPageDepth FOREIGN KEY (dimPageDepth) REFERENCES dimPageDepth (ID) ;
