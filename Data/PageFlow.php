<?php
	include_once("ons_common.php");

$profile=55368687;
	
	$f="digraph {\nnode [shape=\"record\"]\n";
	
	// Proceed with getting some Edges...
	$tsql =	"select dimpreviouspagepath,dimpagepath,sum(pageviews) from 
(
SELECT
	case when dimPreviousPagePath.pagetype='Unknown' then 'A'+dimPreviousPagePath else dimPreviousPagePath.pagetype end dimpreviouspagepath,
	case when dimPagePath.pagetype='Unknown' then 'A'+dimPagePath else dimPagePath.pagetype end dimpagepath
	,Pageviews
FROM fctpagetracking fpt
join dimPagepath dimPreviousPagePath on dimPreviousPagePath.id=dimPreviousPagePath
join dimPagepath on dimPagePath.id=dimPagePath
where dimProfile=$profile ) a
where dimpagepath!=dimpreviouspagepath
group by dimPreviousPagePath,dimPagePath
";
	
	$res = $db->query($tsql);
	
	// Get each row of data on each iteration until
	// there are no more rows
	while (($row = $res->fetchRow())) {    
	    $f.= "A{$row[0]} -> A{$row[1]} [label=\"{$row[2]}\"];\n";
		if (is_numeric($row[0])){
			$sql="select PagePath,sum(UniquePageviews)
FROM fctpagetracking  fpt
join dimpagepath on dimpagepath.id=dimpagepath
where dimpagepath={$row[0]}
and dimProfile=$profile";
			
		}
		else {
			$sql="select Pagetype,sum(UniquePageviews)
FROM fctpagetracking  fpt
join dimpagepath on dimpagepath.id=dimpagepath
where pagetype='{$row[0]}'
and dimProfile=$profile";
			
		}
			$res1=$db->query($sql);
			
			$row1=$res1->fetchRow();
			if ($row1[1]=='')
				$f.= "A{$row[0]} [label=\"{$row1[0]}\"];\n";
			else
				$f.= "A{$row[0]} [label=\"{{$row1[0]}|Visits={$row1[1]}}\"];\n";
	}
	
	
	
	$f.="}";
	/** /	
	print("<pre>");
	print_r($f);
	print("</pre>");
	
	die;
	/**/	

$descriptorspec = array(
   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
   2 => array("file", dirname(__FILE__)."\\error-output.txt", "a") // stderr is a file to write to
);

$cwd = dirname(__FILE__);
$env = array();

$type="pdf";

$process = proc_open('"c:\Program Files (x86)\Graphviz 2.28\bin\dot.exe" -T'.$type, $descriptorspec, $pipes, $cwd, $env);

if (is_resource($process)) {
    // $pipes now looks like this:
    // 0 => writeable handle connected to child stdin
    // 1 => readable handle connected to child stdout
    // Any error output will be appended to /tmp/error-output.txt

    fwrite($pipes[0], "$f");
    fclose($pipes[0]);

if ($type=='pdf' or $type=='ps2')
	header("Content-type: application/pdf");
else
	header("Content-type: image/$type");
    echo stream_get_contents($pipes[1]);
    fclose($pipes[1]);

    // It is important that you close any pipes before calling
    // proc_close in order to avoid a deadlock
    $return_value = proc_close($process);

    //echo "command returned $return_value\n";
}
   
   
?>