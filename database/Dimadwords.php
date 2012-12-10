<?php
/**
 * Table Definition for dimadwords
 */
require_once 'dbRoot.php';

class doDimadwords extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimadwords';          // table name
    public $ID;                              // int(4)  primary_key not_null
    public $AdGroup;                         // varchar(45)  
    public $AdSlot;                          // varchar(45)  
    public $AdSlotPosition;                  // varchar(45)  
    public $AdDistributionNetwork;           // varchar(45)  
    public $AdMatchType;                     // varchar(45)  
    public $AdMatchedQuery;                  // varchar(45)  
    public $AdPlacementDomain;               // varchar(45)  
    public $AdPlacementUrl;                  // varchar(2048)  
    public $AdFormat;                        // varchar(45)  
    public $AdTargetingType;                 // varchar(45)  
    public $AdTargetingOption;               // varchar(45)  
    public $AdDisplayUrl;                    // varchar(2048)  
    public $AdDestinationUrl;                // varchar(2048)  
    public $AdwordsCustomerID;               // varchar(45)  
    public $AdwordsCampaignID;               // varchar(45)  
    public $AdwordsAdGroupID;                // varchar(45)  
    public $AdwordsCreativeID;               // varchar(45)  
    public $AdwordsCriteriaID;               // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimadwords',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
