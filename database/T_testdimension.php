<?php
/**
 * Table Definition for t_testdimension
 */
require_once 'dbRoot.php';

$dim_names=array();
$dim_ga=array();

class doT_testdimension extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_testdimension';     // table name
    public $ID;                              // int(4)  primary_key not_null
    public $parentID;                        // int(4)  unique_key
    public $dimensionID;                     // int(4)  unique_key not_null
    public $level;                           // int(4)  unique_key not_null
    public $valid;                           // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_testdimension',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
 	private function dimension(){
    	global $dim_names;
    	if (!isset($dim_names[$this->dimensionID])){
    		$dim=safe_DataObject_factory('t_Dimension');
    		$dim->get($this->dimensionID);
    		$dim_names[$this->dimensionID]=$dim->name;
    	}
    	return "ga:".$dim_names[$this->dimensionID];
    }
    
    protected function dimensions(){
    	global $dim_ga;
    	$ret="";
    	if ($this->parentID>0){
    		if (!isset($dim_ga[$this->parentID])){
    			$p=$this->staticGet($this->parentID);
    			$dim_ga[$this->parentID]=$p->dimensions().",";
    		}
    		$ret=$dim_ga[$this->parentID];
    	}
    	$ret.=$this->dimension();
    	return $ret;
    }    
            
    private 
    
    function doTest($service,&$profile,$metrics="ga:visits,ga:goalStartsAll,ga:goalCompletionsAll,ga:goalValueAll,ga:goalValuePerVisit,ga:goalAbandonsAll"){
    	global $dim_ga;
    	global $dim_names;
    	
    	$dims=$this->dimensions();   	
    	$optParams = array(
    			'dimensions' => $dims,
    			'max-results' => '25');
    	//print_pre($dim_ga);
    	//print_pre($dim_names);
    	//print_pre($optParams);
    	//die(__FILE__.":".__LINE__);
    	   	
    	try {
    		$results=$this->getResults($service,$profile,$optParams,$metrics);
    		//We have 'results' so it's ok
    		print googleHelper::getRows($results);
    		print_line($this->ID." Valid Request $dims returns ".count($results->rows). " row(s)");
    		$this->valid=count($results->rows);
    		$this->update();
    	} catch (Exception $e) {
    		$error=$e->getMessage();
    		//Has failed
    		if (!(strpos(strtolower($error),"selected dimensions and metrics cannot be queried together.")===false)){
    			print_line($this->ID." Invalid Request $dims");    			
    			$this->valid=-1;
    			$this->update();
    			return; 
    		}     		
    		if (!(strpos(strtolower($error),"invalid value")===false)){
    			print_line($this->ID." Invalid Value $dims");
    			$this->valid=-2;
    			$this->update();
    			return; 
    		}     		
    		print_line($this->ID." Caught exception: $error" );
    		die(__FILE__.":".__LINE__);
    	}    	 
    }
}
