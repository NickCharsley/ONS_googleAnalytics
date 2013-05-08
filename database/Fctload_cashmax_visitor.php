<?php
/**
 * Table Definition for fctload_cashmax_visitor
 */
require_once 'dbRoot.php';

class doFctload_cashmax_visitor extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctload_cashmax_visitor';    // table name
    public $ID;                              // int(4)   not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $dimVisitor;                      // int(4)  
    public $Visitors;                        // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function keys(){
    	return array("ID");
    }
 
 	function links(){
 		return array("dimDate"=>"dimDate:ID","dimProfile"=>"dimProfile:ID","dimVanquisSession"=>"dimCustomVar:ID","dimVisitor"=>"dimVisitor:ID");
 	}   

	function keyDimensions(){
 		return array("ga:Date","ga:Profile","ga:VanquisSession");
 	}    
}
