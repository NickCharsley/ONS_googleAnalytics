<?php
/**
 * Table Definition for fctloanhistory
 */
require_once 'dbRoot.php';

class doFctloanhistory extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctloanhistory';      // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimDate;                         // int(4)   not_null
    public $dimLandingPagePath;              // int(4)   not_null
    public $dimVisitor;                      // int(4)   not_null
    public $dimSession;                      // int(4)   not_null
    public $dimNetwork;                      // int(4)   not_null
    public $dimHostName;                     // int(4)   not_null
    public $dimSystem;                       // int(4)   not_null
    public $dimGeo;                          // int(4)   not_null
    public $dimPlatform;                     // int(4)   not_null
    public $Visitors;                        // int(4)   not_null
    public $NewVisits;                       // int(4)   not_null
    public $Bounces;                         // int(4)   not_null
    public $OrganicSearches;                 // int(4)   not_null
    public $Entrances;                       // int(4)   not_null
    public $Pageviews;                       // int(4)   not_null
    public $UniquePageviews;                 // int(4)   not_null
    public $TimeOnPage;                      // float   not_null
    public $Exits;                           // int(4)   not_null
    public $TimeOnSite;                      // int(4)   not_null
    public $Visits;                          // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctloanhistory',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
