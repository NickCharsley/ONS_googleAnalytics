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
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimProfile;                      // int(4)  unique_key not_null
    protected $dimDate;                         // int(4)  unique_key not_null
    protected $dimVisitor;                      // int(4)  unique_key not_null
    protected $dimSession;                      // int(4)  unique_key not_null
    protected $dimPagePath;                     // int(4)  unique_key not_null
    protected $dimHostName;                     // int(4)  unique_key not_null
    protected $Visitors;                        // int(4)   not_null
    protected $NewVisits;                       // int(4)   not_null
    protected $Bounces;                         // int(4)   not_null
    protected $OrganicSearches;                 // int(4)   not_null
    protected $Entrances;                       // int(4)   not_null
    protected $Pageviews;                       // int(4)   not_null
    protected $UniquePageviews;                 // int(4)   not_null
    protected $TimeOnPage;                      // float   not_null
    protected $Exits;                           // int(4)   not_null
    protected $TimeOnSite;                      // int(4)   not_null
    protected $Visits;                          // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctform',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
