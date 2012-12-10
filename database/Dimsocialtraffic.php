<?php
/**
 * Table Definition for dimsocialtraffic
 */
require_once 'dbRoot.php';

class doDimsocialtraffic extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimsocialtraffic';    // table name
    public $ID;                              // int(4)  primary_key not_null
    public $SocialNetwork;                   // varchar(45)  
    public $HasSocialSourceReferral;         // varchar(45)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimsocialtraffic',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
