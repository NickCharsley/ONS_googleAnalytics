<?php
/**
 * Table Definition for dimprofile
 */
require_once 'dbRoot.php';

class doDimprofile extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimprofile';          // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $ProfileName;                     // varchar(45)   not_null default_Unknown
    protected $WebPropertyID;                   // varchar(45)   not_null
    protected $Currency;                        // varchar(45)   not_null
    protected $WebsiteURL;                      // varchar(45)   not_null
    protected $Type;                            // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimprofile',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('ProfileName');
    
    function saveGoogleResults($results){
    	if (is_a($results, "googleGAResultsWrapper")) return;
    	foreach ($results->items as $row){
    		$fact=safe_DataObject_factory($this->__table);
    		$fact->ID=$row->id;
    		$action=($fact->find(true))?"update":"insert";
    		$fact->ProfileName=$row->name;
    		$fact->WebPropertyID=$row->webPropertyId;
    		$fact->Currency=$row->currency;
    		$fact->WebsiteURL=$row->websiteUrl;
    		$fact->Type=$row->type;
    		$fact->$action();    			
    	}
    }
}
