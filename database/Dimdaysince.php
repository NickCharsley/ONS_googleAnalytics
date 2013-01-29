<?php
/**
 * Table Definition for dimdaysince
 */
require_once 'dbRoot.php';

class doDimdaysince extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimdaysince';         // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Days;                            // int(4)  unique_key
    public $Description;                     // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimdaysince',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE

    function filldata(){
    	$date=null;
    	if (isset($this->ID)){
	    	$this->Days=$this->ID;
    	} else { 
	    	$this->ID=$this->Days;
	    }	    
	    $this->Description=$this->Day;	    
    }

}
?>