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
    protected $ID;                              // int(4)  primary_key not_null
    protected $Date;                            // date  unique_key
    protected $Description;                     // varchar(45)  
    protected $Year;                            // char(4)  
    protected $Month;                           // char(2)  
    protected $Week;                            // char(2)  
    protected $Day;                             // char(2)  
    protected $DayOfWeek;                       // char(2)  
    protected $MonthName;                       // varchar(15)  
    protected $DayOfWeekName;                   // varchar(15)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimdate',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('Description');
    
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