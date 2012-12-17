declare @date int=20120816



select 'fctVisitor',sum(visits) Visits,sum(newvisits) NewVisits,sum(bounces) Bounces,SUM(timeonsite) TimeOnSite,sum(OrganicSearches) OrganicSearches, sum(GoalStartsAll) GoalStartsAll from fctVisitor where dimdate=@date
union
select 'fctDate',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll) from fctDate where dimdate=@date
union
select 'fctSession',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctSession where dimdate=@date
union
select 'fctHostname',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctHostname where dimdate=@date
union
select 'fctLandingPagePath',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctLandingPagePath where dimdate=@date
union
select 'fctNetwork',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctnetwork where dimdate=@date
union
select 'fctGeo',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctGeo where dimdate=@date
union
select 'fctSystem',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctSystem where dimdate=@date
union
select 'fctPlatform',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctPlatform where dimdate=@date
union
select 'fctMobile',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctMobile where dimdate=@date
union
select 'fctLoanHistory',sum(visits),sum(newvisits),sum(bounces),SUM(timeonsite),sum(OrganicSearches),sum(GoalStartsAll)  from fctLoanhistory where dimdate=@date;
