<?php
/**
 * Table Definition for dimadwords_one
 */
require_once 'dbRoot.php';

class doDimadwords_one extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimadwords_one';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $AdGroup;                         // varchar(45)  
    public $AdSlot;                          // varchar(45)  
    public $AdSlotPosition;                  // varchar(45)  
    public $AdPlacementDomain;               // varchar(45)  
    public $AdPlacementUrl;                  // varchar(2048)  
    public $AdTargetingOption;               // varchar(45)  
    public $AdDestinationUrl;                // varchar(2048)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimadwords_one',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
