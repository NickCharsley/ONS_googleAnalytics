<?php
/**
 * Table Definition for fctdevice
 */
require_once 'dbRoot.php';

class doFctdevice extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctdevice';           // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimHour;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimGeo;                          // int(4)   not_null
    public $dimPlatform;                     // int(4)   not_null
    public $dimSystem;                       // int(4)   not_null
    public $dimNetwork;                      // int(4)   not_null
    public $dimVisitor;                      // int(4)   not_null
    public $Visits;                          // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctdevice',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
