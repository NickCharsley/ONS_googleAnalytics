<?php
/**
 * Table Definition for dimdayssincelastvisit
 */
require_once 'dbRoot.php';

class doDimdayssincelastvisit extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimdayssincelastvisit';    // table name
    public $ID;                              // int(4)   not_null
    public $DaysSinceLastVisit;              // int(4)  
    public $Description;                     // varchar(45)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keys(){
    	return array("ID");
    }
    
	function keyDimensions(){
    	return array("ga:DaysSinceLastVisit");
    }
    
    function filldata(){
    	$date=null;
    	if (isset($this->ID)){
	    	$this->DaysSinceLastVisit=$this->ID;
    	} else { 
	    	$this->ID=$this->DaysSinceLastVisit;
	    }	    
	    $this->Description=$this->DaysSinceLastVisit;
    }
}
?>