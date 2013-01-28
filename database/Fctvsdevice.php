<?php
/**
 * Table Definition for fctvsdevice
 */
require_once 'dbRoot.php';

class doFctvsdevice extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvsdevice';         // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimHour;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimGeo;                          // int(4)   not_null
    protected $dimPlatform;                     // int(4)   not_null
    protected $dimSystem;                       // int(4)   not_null
    protected $dimNetwork;                      // int(4)   not_null
    protected $dimVisitor;                      // int(4)   not_null
    protected $dimVanquisSession;               // int(4)   not_null
    protected $Visits;                          // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvsdevice',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
}
