<?php
/**
 * Table Definition for fctadwords_two
 */
require_once 'dbRoot.php';

class doFctadwords_two extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctadwords_two';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimAdwords_two;                  // int(4)   not_null
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

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctadwords_two',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
