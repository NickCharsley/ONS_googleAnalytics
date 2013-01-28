<?php
/**
 * Table Definition for dimnetwork
 */
require_once 'dbRoot.php';

class doDimnetwork extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimnetwork';          // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $NetworkDomain;                   // varchar(45)  unique_key not_null
    protected $NetworkLocation;                 // varchar(512)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimnetwork',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array("NetworkDomain");
    
    function keyDimensions(){
    	return array("ga:NetworkDomain","ga:NetworkLocation");
    }
}
