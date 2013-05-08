<?php
/**
 * Table Definition for dimtraffic
 */
require_once 'dbRoot.php';

class doDimtraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimtraffic';          // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Campaign;                        // varchar(45)  
    public $Source;                          // varchar(45)  
    public $Keyword;                         // varchar(512)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('Campaign','Source','Keyword');
    
    function keyDimensions(){
    	return array("ga:Campaign","ga:Source","ga:Keyword");
    }    
}
?>