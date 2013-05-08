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
    public $ID;                              // int(4)  primary_key not_null
    public $dimDate;                         // int(4)   not_null
    public $dimProfile;                      // int(4)   not_null
    public $dimEcommerce;                    // int(4)   not_null
    public $dimVanquisSession;               // int(4)   not_null
    public $ItemQuantity;                    // int(4)   not_null

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
