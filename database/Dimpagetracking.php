<?php
/**
 * Table Definition for dimpagetracking
 */
require_once 'dbRoot.php';

class doDimpagetracking extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimpagetracking';     // table name
    public $ID;                              // int(4)  primary_key not_null
    public $Hostname;                        // varchar(45)  unique_key not_null
    public $PagePath;                        // varchar(45)  unique_key not_null
    public $LandingPagePath;                 // varchar(45)  unique_key not_null
    public $SecondPagePath;                  // varchar(45)  unique_key not_null
    public $ExitPagePath;                    // varchar(45)  unique_key not_null
    public $PreviousPagePath;                // varchar(45)  unique_key not_null
    public $NextPagePath;                    // varchar(45)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimpagetracking',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
