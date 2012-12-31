<?php

 include_once 'ons_common.php';
 
 class googleMCFResultsWrapper extends googleResultsWrapper {

	function __construct($results=null){
		if (isset($results)){
			krumo($results);
			$rows=$results->getRows();
			 
			$columnHeaders=$results->getColumnHeaders();
			$basefilter=str_replace(";",",", $results->query->filters);
			krumo($columnHeaders);
			$this->rowCount=count($rows);
			for($i=0;$i<count($rows);$i++){					 
				$filter=($basefilter==""?"":"$basefilter,").googleHelper::getFilter($columnHeaders,$rows,$i);
				$this->filter[$i]=$filter;
				krumo($filter);
				$this->matrix[$filter]['Metrics']   =googleHelper::getMetrics($columnHeaders, $rows, $i);
				$this->matrix[$filter]['Dimensions']=googleHelper::getDimensions($columnHeaders, $rows, $i,$basefilter);
			}
			$this->rowCount=count($this->matrix);
		} 			
	}
 }
?>