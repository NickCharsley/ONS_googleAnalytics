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
    protected $ID;                              // int(4)  primary_key not_null
    protected $Campaign;                        // varchar(45)  
    protected $Source;                          // varchar(45)  
    protected $Keyword;                         // varchar(512)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimtraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('Campaign','Source','Keyword');
    
    function keyDimensions(){
    	return array("ga:Campaign","ga:Source","ga:Keyword");
    }    
}
?>