<?php
/**
 * Table Definition for fctload_cashmax_baseii
 */
require_once 'dbRoot.php';

class doFctload_cashmax_baseii extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctload_cashmax_baseii';    // table name
    public $ID;                              // int(4)   not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // float   not_null
    public $Exits;                           // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    //As this is a View we need to do the work here!
    function keys(){
    	return array("ID");
    }
 
 	function links(){
 		return array("dimDate"=>"dimDate:ID","dimProfile"=>"dimProfile:ID","dimVanquisSession"=>"dimCustomVar:ID");
 	}
	   
	function keyDimensions(){
 		return array("ga:Date","ga:Profile","ga:VanquisSession");
 	}
}
?>