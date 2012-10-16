<?php
/**
 * Table Definition for t_testdimension
 */
require_once 'dbRoot.php';

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
    	$dim=safe_DataObject_factory('t_Dimension');
    	$dim->get($this->dimensionID);
    	return "ga:".$dim->name;
    }
    
    private function dimensions(){
    	$ret="";
    	if ($this->parentID>0){
    		$p=$this->staticGet($this->parentID);
    		$ret=$p->dimensions().",";
    	}
    	$ret.=$this->dimension();
    	return $ret;
    }    
    
    function doTest($service,$profile){
    	$dims=$this->dimensions();   	
    	$optParams = array(
    			'dimensions' => $dims,
    			'max-results' => '1');
    	try {
    		$results=$service->data_ga->get("ga:$profile",'2012-01-01','2012-10-10','ga:visits',$optParams);
    		//We have 'results' so it's ok
    		$this->valid=1;
    		$this->update();
    	} catch (Exception $e) {
    		$error=$e->getMessage();
    		//Has failed
    		if (!(strpos($error,"Invalid request: selected dimensions and metrics cannot be queried together.")===false)){
    			print_line($this->ID." Invalid Request $dims");    			
    			$this->valid=-1;
    			$this->update();
    			return; 
    		}     		
    		if (!(strpos($error,"Invalid Value")===false)){
    			print_line($this->ID." Invalid Value $dims");
    			$this->valid=-2;
    			$this->update();
    			return; 
    		}     		
    		print_line($this->ID." Caught exception: $error" );
    		die("In test $dims");
    	}
    	 
    }
}
