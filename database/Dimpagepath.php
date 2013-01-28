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
    protected $ID;                              // int(4)  primary_key not_null
    protected $PagePath;                        // varchar(4096)   not_null
    protected $PageType;                        // varchar(45)   not_null default_Unknown
    protected $HasShortcode;                    // int(4)   not_null
    protected $Shortcode;                       // varchar(1024)  
    protected $hasURN;                          // int(4)   not_null
    protected $URN;                             // varchar(24)  

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