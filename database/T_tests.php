<?php
/**
 * Table Definition for t_tests
 */
require_once 'dbRoot.php';

class doT_tests extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 't_tests';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $size;                            // int(4)   not_null
    public $valid;                           // int(4)   not_null
    public $d1ID;                            // int(4)   not_null
    public $d2ID;                            // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doT_tests',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    private function dimension($id){
    	$dim=safe_DataObject_factory('t_Dimension');
    	$dim->get($id);
    	return "ga:".$dim->name;
    }
    
    private function dimensions(){
    	$ret="";
    	for ($i=1;$i<=$this->size;$i++){
    		$dim="d{$i}ID";
    		if ($ret!="") $ret.=",";
    		$ret.=$this->dimension($this->$dim);
    	}
    	return $ret;
    }    
    
    function doTest($service,$profile){
    	
    	$optParams = array(
    			'dimensions' => $this->dimensions(),
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
    			print_line($this->ID." Invalid Request");
    			$this->valid=-1;
    			$this->update();
    			return; 
    		}     		
    		if (!(strpos($error,"Invalid Value")===false)){
    			print_line($this->ID." Invalid Value");
    			$this->valid=-2;
    			$this->update();
    			return; 
    		}     		
    		print_line($this->ID." Caught exception: $error" );
    		die("In test");
    	}
    	 
    }
    
}
