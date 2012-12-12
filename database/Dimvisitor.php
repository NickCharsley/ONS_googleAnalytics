<?php
/**
 * Table Definition for dimvisitor
 */
require_once 'dbRoot.php';

class doDimvisitor extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimvisitor';          // table name
    public $ID;                              // int(4)  primary_key not_null
    public $VisitCount;                      // int(4)  unique_key
    public $VisitorType;                     // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimvisitor',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keyDimensions(){
    	return array("ga:VisitCount");
    }
    
    function insert(){
    	$this->filldata();
    	return parent::insert();
    }
    
    function update($do=false){
    	$this->filldata();
    	return parent::update($do);
    }
    
    function filldata(){
    	$date=null;
    	if (isset($this->ID) and !isset($this->VisitCount)){    		
    		$this->VisitCount=$this->ID;
    	} else if (!isset($this->ID) and isset($this->VisitCount)){
    		$this->ID=$this->VisitCount;
    	}
    }
}
?>