<?php
/**
 * Table Definition for dimtraffic
 */
require_once 'dbRoot.php';

class doDimtraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimtraffic';          // table name
    public $ID;                              // int(4)  primary_key not_null
    public $ReferralPath;                    // varchar(45)  unique_key
    public $Campaign;                        // varchar(45)  unique_key
    public $Source;                          // varchar(45)  unique_key
    public $Medium;                          // varchar(45)  unique_key
    public $Keyword;                         // varchar(45)  unique_key
    public $AdContent;                       // varchar(45)  unique_key

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimtraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
