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
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimAdwords_one;                  // int(4)   not_null
    protected $Impressions;                     // varchar(45)  
    protected $AdClicks;                        // varchar(45)  
    protected $AdCost;                          // varchar(45)  
    protected $CPM;                             // varchar(45)  
    protected $CPC;                             // varchar(45)  
    protected $CTR;                             // varchar(45)  
    protected $CostPerTransaction;              // varchar(45)  
    protected $CostPerGoalConversion;           // varchar(45)  
    protected $CostPerConversion;               // varchar(45)  
    protected $RPC;                             // varchar(45)  
    protected $ROI;                             // varchar(45)  
    protected $Margin;                          // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctadwords_one',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
