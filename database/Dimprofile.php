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
    public $ID;                              // int(4)  primary_key not_null
    public $ProfileName;                     // varchar(45)   not_null default_Unknown
    public $WebPropertyID;                   // varchar(45)   not_null
    public $Currency;                        // varchar(45)   not_null
    public $WebsiteURL;                      // varchar(45)   not_null
    public $Type;                            // varchar(45)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimprofile',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function saveGoogleResults($results){
    	Krumo($results);
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
