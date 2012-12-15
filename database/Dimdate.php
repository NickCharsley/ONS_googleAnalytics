<?php
/**
 * Table Definition for dimdate
 */
require_once 'dbRoot.php';

class doDimdate extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimdate';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Date;                            // date  unique_key
    public $Description;                     // varchar(45)  
    public $Year;                            // char(4)  
    public $Month;                           // char(2)  
    public $Week;                            // char(2)  
    public $Day;                             // char(2)  
    public $DayOfWeek;                       // char(2)  
    public $MonthName;                       // varchar(15)  
    public $DayOfWeekName;                   // varchar(15)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimdate',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function keyDimensions(){
    	return array("ga:Date");
    }    
          
    function filldata(){
    	$date=null;
    	if (isset($this->ID)){
	    	$date=new DateTime($this->ID);
	    	$this->Date=$date->format('Ymd');      				// date  unique_key
    	} else { 
	    	$date=new DateTime($this->Date);
	    	$this->ID=$date->format('Ymd');      				// date  unique_key
	    }	    
	    $this->Description=$date->format('Y-m-d');				// varchar(45)	    
	    $this->MonthName=$date->format('F');						// varchar(15)
    	$this->DayOfWeekName=$date->format('l');					// varchar(15)    	
    }
    
    
}
?>