<?php
/**
 * Table Definition for dimgoal
 */
require_once 'dbRoot.php';

class doDimgoal extends dbRoot 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'dimgoal';             // table name
    public $ID;                              // int(4)  primary_key not_null
    public $dimProfile;                      // int(4)  unique_key not_null
    public $GoalNumber;                      // int(4)  unique_key not_null
    public $GoalLabel;                       // varchar(70)  unique_key not_null

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('doDimgoal',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
    
    public $fb_linkDisplayFields=array('GoalLabel');
    function keyDimensions(){
    	return array("ga:Goal");
    }    
  
    	function findDimensionID($row){
		//krumo($row);
		$goal=false;		
		foreach($row['Dimensions'] as $dimName=>$dimValue){
			$dimName=ucfirst(str_replace("ga:", "", $dimName));
			if (!(strpos($dimName,"Goal")===false)){//Special	
				$dimValue=str_replace("Goal", "", str_replace("Start", "", $dimName));
				if ($goal){
					$dimValue=0;
				}						
				$dimName="GoalNumber";
				$goal=true;
			}			
			$this->$dimName=$dimValue;
		}
		$this->find(true);
		return $this->ID; 
	}
	
}
?>