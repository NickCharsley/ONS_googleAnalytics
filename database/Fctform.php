<?php
/**
 * Table Definition for fctform
 */
require_once 'dbRoot.php';

class doFctform extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctform';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimProfile;                      // int(4)  unique_key not_null
    public $dimDate;                         // int(4)  unique_key not_null
    public $dimVisitor;                      // int(4)  unique_key not_null
    public $dimSession;                      // int(4)  unique_key not_null
    public $dimPagePath;                     // int(4)  unique_key not_null
    public $dimHostName;                     // int(4)  unique_key not_null
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
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctform',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
