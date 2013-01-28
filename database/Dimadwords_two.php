<?php
/**
 * Table Definition for dimadwords_two
 */
require_once 'dbRoot.php';

class doDimadwords_two extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimadwords_two';      // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $AdGroup;                         // varchar(45)  
    protected $AdDistributionNetwork;           // varchar(45)  
    protected $AdMatchType;                     // varchar(45)  
    protected $AdDestinationUrl;                // varchar(2048)  
    protected $AdwordsCustomerID;               // varchar(45)  
    protected $AdwordsCampaignID;               // varchar(45)  
    protected $AdwordsAdGroupID;                // varchar(45)  
    protected $AdwordsCreativeID;               // varchar(45)  
    protected $AdwordsCriteriaID;               // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimadwords_two',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
