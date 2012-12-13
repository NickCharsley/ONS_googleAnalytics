<?php
/*
 * Created on 11 Oct 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 
 include_once 'ons_common.php';
 
 class googleResultsWrapper {

 		public $matrix=array();
 		public $filter=array();
 		public $rowCount=0;
		public $dimProfile;
 		
 		
 		function __construct($results=null){
 			if (isset($results)){
 				$rows=$results->getRows();
 				$columnHeaders=$results->getColumnHeaders();
 				$basefilter=str_replace(";",",", $results->query->filters);
 				
 				$this->rowCount=count($rows);
				for($i=0;$i<count($rows);$i++){					 
					$filter=($basefilter==""?"":"$basefilter,").googleHelper::getFilter($columnHeaders,$rows,$i);
					$this->filter[$i]=$filter;
					$this->matrix[$filter]['Metrics']   =googleHelper::getMetrics($columnHeaders, $rows, $i);
					$this->matrix[$filter]['Dimensions']=googleHelper::getDimensions($columnHeaders, $rows, $i,$basefilter);
				}
				$this->rowCount=count($this->matrix);
				
//				krumo($results);							
 			} 			
 		}
 	   
 		function saveDateDimension(){
 			foreach ($this->matrix as $row){
 				$dimDate=safe_DataObject_factory("dimDate");
 				$dimDate->ID=$row['Dimensions']['ga:date'];	
 				if (!$dimDate->find(true)){
 					$date=new DateTime($row['Dimensions']['ga:date']);
 					$dimDate->Date=$date->format('Ymd');      					// date  unique_key
 					$dimDate->Description=$date->format('Y-m-d');				// varchar(45)
 					$dimDate->Year=$row['Dimensions']['ga:year'];				// char(4)
 					$dimDate->Month=$row['Dimensions']['ga:month'];				// char(2)
 					$dimDate->Week=$row['Dimensions']['ga:week'];				// char(2)
 					$dimDate->Day=$row['Dimensions']['ga:day'];					// char(2)
 					$dimDate->DayOfWeek=$row['Dimensions']['ga:dayOfWeek'];		// char(2)
 					
 					$dimDate->MonthName=$date->format('F');						// varchar(15)
 					$dimDate->DayOfWeekName=$date->format('l');					// varchar(15)
 					
 					$dimDate->insert();
 				}
 			}	
 		}
 		
 		function saveVisitorDimension(){
 			foreach ($this->matrix as $row){
 				$dimVisitor=safe_DataObject_factory("dimVisitor");
 				$dimVisitor->ID=$row['Dimensions']['ga:visitCount'];
 				if (!$dimVisitor->find(true)){
 					$dimVisitor->VisitNumber=$row['Dimensions']['ga:visitCount'];
 					$dimVisitor->VisitorType=$row['Dimensions']['ga:visitorType'];
 					
 					$dimVisitor->insert();
 				} 				
 			}
 		}
 		
 		function saveGeoDimension(){
 			foreach ($this->matrix as $row){
 				$dimGeo=safe_DataObject_factory("dimGeo");
 				$dimGeo->Latitude=$row['Dimensions']['ga:latitude'];
				$dimGeo->Longitude=$row['Dimensions']['ga:longitude'];
				$dimGeo->City=$row['Dimensions']['ga:city'];
				$dimGeo->Country=$row['Dimensions']['ga:country'];
				if(!$dimGeo->find(true)){					
					$dimGeo->Continent=$row['Dimensions']['ga:continent'];
					$dimGeo->SubContinent=$row['Dimensions']['ga:subContinent'];
					$dimGeo->Metro=$row['Dimensions']['ga:metro'];
					
					$dimGeo->insert();
				}
 			}
 		}
 		
 		function saveNetworkDimension(){
 			foreach ($this->matrix as $row){
 				$dimNet=safe_DataObject_factory("dimNetwork");
 				$dimNet->NetworkLocation=$row['Dimensions']['ga:networkLocation'];
 				$dimNet->NetworkDomain=$row['Dimensions']['ga:networkDomain']; 
 				if (!$dimNet->find(true)) $dimNet->insert(); 					
 			}
 		}

 		function saveSystemDimension(){
 			foreach ($this->matrix as $row){
 				$dimSystem=safe_DataObject_factory("dimSystem");
 				$dimSystem->FlashVersion=$row['Dimensions']['ga:flashVersion'];
 				$dimSystem->JavaEnabled=$row['Dimensions']['ga:javaEnabled'];
 				$dimSystem->Language=$row['Dimensions']['ga:language'];
 				$dimSystem->ScreenColors=$row['Dimensions']['ga:screenColors'];
 				$dimSystem->ScreenResolution=$row['Dimensions']['ga:screenResolution'];
 				if (!$dimSystem->find(true)) $dimSystem->insert();
 			}
 		}
 		 		
 		function savePageTrackingDimension(){
 			krumo($this); 		
 			foreach ($this->matrix as $row){
 				$dimPage=safe_DataObject_factory("dimPageTracking");
 				$dimPage->Hostname=$row['Dimensions']['ga:hostname'];
 				$dimPage->PagePath=$row['Dimensions']['ga:pagePath'];
 				$dimPage->LandingPagePath=$row['Dimensions']['ga:landingPagePath'];
 				$dimPage->SecondPagePath=$row['Dimensions']['ga:secondPagePath'];
 				$dimPage->ExitPagePath=$row['Dimensions']['ga:exitPagePath'];
 				$dimPage->PreviousPagePath=$row['Dimensions']['ga:previousPagePath'];
 				$dimPage->NextPagePath=$row['Dimensions']['ga:nextPagePath'];
 				if (!$dimPage->find(true)) $dimPage->insert();
 			}
 		} 		 			 		

 		function saveTrafficDimensionOne(){
 			krumo($this);
 			foreach ($this->matrix as $row){
 				$dimTraffic=safe_DataObject_factory("dimTraffic");
 				$dimTraffic->ReferralPath=$row['Dimensions']['ga:referralPath'];
 				$dimTraffic->Campaign=$row['Dimensions']['ga:campaign'];
 				$dimTraffic->Source=$row['Dimensions']['ga:source'];
 				$dimTraffic->Medium=$row['Dimensions']['ga:medium'];
 				$dimTraffic->Keyword=$row['Dimensions']['ga:keyword'];
 				$dimTraffic->AdContent=$row['Dimensions']['ga:adContent'];
 				if (!$dimTraffic->find(true)) $dimTraffic->insert(); 				
 			}
 		} 	
 				
 		function saveTrafficDimensionTwo(){
 			krumo($this);
 			foreach ($this->matrix as $row){
 				$dimTraffic=safe_DataObject_factory("dimSocialTraffic");
 				$dimTraffic->HasSocialSourceReferral=$row['Dimensions']['ga:hasSocialSourceReferral'];
 				$dimTraffic->SocialNetwork=$row['Dimensions']['ga:socialNetwork'];
 				if (!$dimTraffic->find(true)) $dimTraffic->insert();
 			}
 		} 		

 		function saveAdWordsDimension(){
 			krumo($this);
 			foreach ($this->matrix as $row){
 				$dim=safe_DataObject_factory("dimAdwords");
 				foreach($row['Dimensions'] as $dimName=>$dimValue){ 					
 					$dimName=ucfirst(str_replace("ga:", "", $dimName));
 					$dim->$dimName=$dimValue;	
 				} 	
 				if (!$dim->find(true)) $dim->insert();
 			}
 		}
 		function saveEventDimension(){
 			krumo($this);
 			foreach ($this->matrix as $row){
 			}
 		}
 		
 		function saveAdwordFact(){
 			$this->saveFact("fctAdwords");
 		} 		
 		/*
 		function saveFact($table){
 			krumo($this);
 			DB_DataObject::debugLevel(5);
 			foreach ($this->matrix as $row){
 				$fact=safe_DataObject_factory($table);
 				foreach($row['Dimensions'] as $dimName=>$dimValue){
 					$dimName=ucfirst(str_replace("ga:", "", $dimName));
 					$fact->$dimName=$dimValue;	
 				}
 				//krumo($fact); 			
 				$action=($fact->find(true))?"update":"insert";
 				
 				foreach($row['Metrics'] as $metName=>$metValue){
 					$metName=ucfirst(str_replace("ga:", "", $metName));
 					$fact->$metName=$metValue;
 				} 					
 				$fact->$action();
 				//krumo($fact);
 				//die;
 			}
 		}
 		*/
 		
 		function mergeResults($results){
 			if (is_a($results, 'googleResultsWrapper')){
 				$gaResults=$results;
 			} 				
 			else	
 			{ 				 			
 				$gaResults=new googleResultsWrapper($results);
 			}
 			
 			//krumo($gaResults);
 			for($i=0;$i<$gaResults->rowCount;$i++){
 				$filter=$gaResults->getFilter($i);
 				if (isset($this->matrix[$filter])){
 					$this->matrix[$filter]['Metrics']   =array_merge($this->matrix[$filter]['Metrics']   ,$gaResults->getMetrics($filter)   );
 					$this->matrix[$filter]['Dimensions']=array_merge($this->matrix[$filter]['Dimensions'],$gaResults->getDimensions($filter));
 				}
 				else {
	 				$this->matrix[$filter]['Metrics']   =$gaResults->getMetrics($filter);	
	 				$this->matrix[$filter]['Dimensions']=$gaResults->getDimensions($filter);
 				}
 			}
 			$this->filter=array_keys($this->matrix);
 			$this->rowCount=count($this->matrix); 			
 		}

 		function getRows($index=null){
 			krumo($this);
 			die("Bad Die".__FILE__.":".__LINE__);
 			
 			return (isset($index))?$this->rows[$index]:$this->rows;
 		}
 		
 		function getColumnHeaders(){
 			return $this->columnHeaders;
 		}

 		function getMetrics($filter){
 			return$this->matrix[$filter]['Metrics'];
 		}
 		
 		function getDimensions($filter){ 			
 			return $this->matrix[$filter]['Dimensions'];
 		}
 		
 		function getFilter($index){
 			if (count($this->filter)<>$this->rowCount){
 				$this->filter=array_keys($this->matrix);
 			}
 			return $this->filter[$index];
 		} 		
 		
 		function getRowsTable() {
 			krumo($this);
 			die("Bad Die".__FILE__.":".__LINE__);
 			$table = '<h3>Rows Of Data</h3>';
 			 
 			if (count($this->getRows()) > 0) {
 				$table .= '<table>';
 				 
 				// Print headers.
 				$table .= '<tr>';
 				 
 				foreach ($this->getColumnHeaders() as $header) {
 					$table .= '<th>' . $header->name . '</th>';
 				}
 				$table .= '</tr>';
 				 
 				// Print table rows.
 				foreach ($this->getRows() as $row) {
 					$table .= '<tr>';
 					foreach ($row as $cell) {
 						$table .= '<td>'
 						. htmlspecialchars($cell, ENT_NOQUOTES)
 						. '</td>';
 					}
 					$table .= '</tr>';
 				}
 				$table .= '</table>';
 				 
 			} else {
 				$table .= '<p>No results found.</p>';
 			}
 			 
 			return $table;
 		}
 }
?>
