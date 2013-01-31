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
 		
		private function __construct(){} 		
 		
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

		function globalAddDimension($key,$value,$where=""){
			foreach ($this->filter as $filter) {
				if (!(strpos($filter,$where)===false))
					$this->matrix[$filter]['Dimensions'][$key]=$value;
			}
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
/* 		
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
 */
 }
?>
