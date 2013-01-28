<?php
/**
 * Table Definition for dimsession
 */
require_once 'dbRoot.php';

class doDimsession extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimsession';          // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $VisitLength;                     // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimsession',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    function keyDimensions(){
    	return array("ga:VisitLength");
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
    	if (isset($this->ID) and !isset($this->VisitLength)){
    		$this->VisitLength=$this->ID;
    	} else if (!isset($this->ID) and isset($this->VisitLength)){
    		$this->ID=$this->VisitLength;
    	}
    }
}
?>