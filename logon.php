<?php

	include_once("ons_common.php");
	$level=0;
	$index=0;
	
	PEARError($res =& $db->query('SELECT max(level) FROM t_testdimension'));	
	if (($level = $res->fetchOne())) {
	     print_line("Level=$level");
	}
	PEARError($res =& $db->query("SELECT max(dimensionID) FROM t_testdimension where valid=-4 and level=$level"));	
	if (($index = $res->fetchOne())) {
	     print_line("Last Dimension Processed=$index");
	}
	//Update Historic Failures
	$sql="
update
     t_testdimension d4 
join t_testdimension d3 on d4.parentid=d3.id
join t_testdimension d2 on d3.parentid=d2.id
join t_testdimension d1 on d2.parentid=d1.id
join (
	select d1.dimensionid d1id,d2.dimensionid d2id,d3.dimensionid d3id
	from t_testdimension d3 
	join t_testdimension d2 on d3.parentid=d2.id 
	join t_testdimension d1 on d2.parentid=d1.id 
	where d2.level=3 and d3.valid<0
) fail
on fail.d3id=d4.dimensionid and (
   (fail.d2id=d3.dimensionid and (fail.d1id=d2.dimensionid or fail.d1id=d1.dimensionid))
or (fail.d2id=d2.dimensionid and fail.d1id=d1.dimensionid)
)
	set d4.valid=-4
where d4.valid=0 and d4.dimensionid =";
	//$prep=$db->prepare($sql,array('integer'), MDB2_PREPARE_MANIP);
	
	$index++;
	PEARError($res =& $db->query("select count(*) from t_testdimension where valid=0"));
	if (($active = $res->fetchOne())) {
		print_line("Dimension Groups active=$active, before processing $index");
	}
	
		PEARError($db->query($sql.$index));
		
		PEARError($res =& $db->query("select count(*) from t_testdimension where valid=0"));
		if (($active = $res->fetchOne())) {
			print_line("Dimension Groups Still active=$active, after processing $index");
		}
	
	print_line("Updated");
	
	
?>