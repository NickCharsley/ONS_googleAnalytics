<?php
/**
 * Table Definition for dimpagepath
 */
require_once 'dbRoot.php';

class doDimpagepath extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagepath';         // table name
    public $ID;                              // int(4)  primary_key not_null
    public $PagePath;                        // varchar(4096)   not_null
    public $PageType;                        // varchar(45)   not_null default_Unknown
    public $HasShortcode;                    // int(4)   not_null
    public $Shortcode;                       // varchar(1024)  
    public $hasURN;                          // int(4)   not_null
    public $URN;                             // varchar(24)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimpagepath',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    public $fb_linkDisplayFields=array('PagePath');
    
    function keyDimensions(){
    	return array("ga:PagePath");
    }
}
?>