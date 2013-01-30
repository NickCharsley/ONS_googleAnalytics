<?php
/**
 * Table Definition for dimalltraffic
 */
require_once 'dbRoot.php';

class doDimalltraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimalltraffic';       // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Campaign;                        // varchar(45)  
    public $Source;                          // varchar(45)  
    public $Keyword;                         // varchar(512)  
    public $SocialNetwork;                   // varchar(45)  
    public $HasSocialSourceReferral;         // varchar(45)  
    public $ReferralPath;                    // varchar(512)  
    public $Medium;                          // varchar(45)  
    public $adContent;                       // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimalltraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    function  keyDimensions(){
    	return array("ga:Campaign","ga:Source","ga:Keyword","ga:SocialNetwork","ga:HasSocialSourceReferral","ga:ReferralPath","ga:Medium","ga:adContent");
    }
    
}
