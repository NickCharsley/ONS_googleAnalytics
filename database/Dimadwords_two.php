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
    public $ID;                              // int(4)  primary_key not_null
    public $AdGroup;                         // varchar(45)  
    public $AdDistributionNetwork;           // varchar(45)  
    public $AdMatchType;                     // varchar(45)  
    public $AdDestinationUrl;                // varchar(2048)  
    public $AdwordsCustomerID;               // varchar(45)  
    public $AdwordsCampaignID;               // varchar(45)  
    public $AdwordsAdGroupID;                // varchar(45)  
    public $AdwordsCreativeID;               // varchar(45)  
    public $AdwordsCriteriaID;               // varchar(45)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
