<?php
/**
 * Table Definition for dimpagedepth
 */
require_once 'dbRoot.php';

class doDimpagedepth extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagedepth';        // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $PageDepth;                       // int(4)  unique_key
    protected $Description;                     // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimpagedepth',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('Description');
    
    function filldata(){
    	$date=null;
    	if (isset($this->ID)){
	    	$this->PageDepth=$this->ID;
    	} else { 
	    	$this->ID=$this->PageDepth;
	    }	    
	    $this->Description=$this->PageDepth;	    
    }

	function keyDimensions(){
    	return array("ga:PageDepth");
    }
	
}
?>