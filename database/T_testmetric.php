<?php
/**
 * Table Definition for t_testmetric
 */
require_once 'dbRoot.php';

$met_names=array();
$met_g=array();

class doT_testmetric extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_testmetric';        // table name
    public $ID;                              // int(4)  primary_key not_null
    public $parentID;                        // int(4)  unique_key
    public $metricID;                        // int(4)  unique_key not_null
    public $level;                           // int(4)  unique_key not_null
    public $valid;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_testmetric',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    private function metric(){
    	global $met_names;
    	if (!isset($met_names[$this->metricID])){
    		$met=safe_DataObject_factory('t_metric');
    		$met->get($this->metricID);
    		$met_names[$this->metricID]=$met->name;
    	}
    	return "ga:".$met_names[$this->metricID];
    }
    
    protected function metrics(){
    	global $met_ga;
    	$ret="";
    	if ($this->parentID>0){
    		if (!isset($met_ga[$this->parentID])){
    			$p=$this->staticGet($this->parentID);
    			$met_ga[$this->parentID]=$p->metrics().",";
    		}
    		$ret=$met_ga[$this->parentID];
    	}
    	$ret.=$this->metric();
    	return $ret;
    }
        
    function doTest($date,$service,&$profile,$dims="ga:date"){
    	global $dim_ga;
    	global $dim_names;
    	 
    	//;$this->dimensions();
    	$metrics=$this->metrics();
    	$optParams = array(
    			'dimensions' => $dims,
    			'max-results' => '25');
    		
    	try {
    		$results=googleHelper::getResults($date,$service,$profile,$optParams,$metrics);
    		//We have 'results' so it's ok
    		print $results->getRowsTable();
    		print_line($this->ID." Valid Request $dims returns ".count($results->rows). " row(s)");
    		$this->valid=count($results->rows);
    		$this->update();
    		die(__FILE__.":".__LINE__);
    		return $results;
    	} catch (Exception $e) {
    		$error=$e->getMessage();
    		//Has failed
    		if (!(strpos(strtolower($error),"selected dimensions and metrics cannot be queried together.")===false)){
    			print_line($this->ID." Invalid Request $dims");
    			$this->valid=-1;
    			$this->update();
    			return new googleResultsWrapper();
    		}
    		if (!(strpos(strtolower($error),"invalid value")===false)){
    			print_line($this->ID." Invalid Value $dims");
    			$this->valid=-2;
    			$this->update();
    			return new googleResultsWrapper();
    		}
    		print_line($this->ID." Caught exception: $error" );
    		die(__FILE__.":".__LINE__);
    	}
    }
    
    
}
