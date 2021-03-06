<?php
/**
 * Table Definition for fctadwords_one
 */
require_once 'dbRoot.php';

class doFctadwords_one extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctadwords_one';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimAdwords_one;                  // int(4)   not_null
    public $Impressions;                     // varchar(45)  
    public $AdClicks;                        // varchar(45)  
    public $AdCost;                          // varchar(45)  
    public $CPM;                             // varchar(45)  
    public $CPC;                             // varchar(45)  
    public $CTR;                             // varchar(45)  
    public $CostPerTransaction;              // varchar(45)  
    public $CostPerGoalConversion;           // varchar(45)  
    public $CostPerConversion;               // varchar(45)  
    public $RPC;                             // varchar(45)  
    public $ROI;                             // varchar(45)  
    public $Margin;                          // varchar(45)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
