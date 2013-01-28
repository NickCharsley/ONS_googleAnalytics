<?php
/**
 * Table Definition for fctvsecommerce
 */
require_once 'dbRoot.php';

class doFctvsecommerce extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'fctvsecommerce';      // table name
    protected $ID;                              // int(4)  primary_key not_null
    protected $dimDate;                         // int(4)   not_null
    protected $dimProfile;                      // int(4)   not_null
    protected $dimEcommerce;                    // int(4)   not_null
    protected $dimVanquisSession;               // int(4)   not_null
    protected $ItemQuantity;                    // int(4)   not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doFctvsecommerce',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
