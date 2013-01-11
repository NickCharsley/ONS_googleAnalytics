<?php

	$filename=dirname(__FILE__)."\\waterfall.gv";

	$f=file_get_contents($filename);
	
	$serverName = "ppsvr0080,5433";
	
	$connectionInfo = array(
		"Database"=>"NewBusiness"
	);
	
	/* Connect using Windows Authentication. */
	
	if (isset($_GET['ApplicationID'])) $root="select @caseid=caserowid from NewBusiness.dbo.vw_ApplicationIDLookup where ApplicationID='".$_GET['ApplicationID']."'";
	else if (isset($_GET['CaseID'])) $root="set @caseid=".$_GET['CaseID'];

	if (isset($_GET['summary'])) {
		$summary=true;
		$root='';
	}
	else $summary=false;

	
	$conn = sqlsrv_connect( $serverName, $connectionInfo);
	if( $conn === false )
	{
		 echo "Unable to connect to $serverName.</br><pre>";
		 print_r( sqlsrv_errors());
		 die;
	}

	/* Query SQL Server for the login of the user accessing the
	database. */
	
	$tsql = 
	"declare @caseid int;
	$root;
	select * from workcred.dbo.udf_WorkflowProcess(@caseID)";
	
	$stmt = sqlsrv_query( $conn, $tsql);
	if( $stmt === false )
	{	print("<pre>");
		 echo "Error in executing query on $serverName.</br>";
	 	 print "$tsql\n";
		 print_r( sqlsrv_errors());
		 die;
	}
	$f="";
	/* Retrieve and display the results of the query. */
	while ($row = sqlsrv_fetch_array($stmt)){
		$f.=$row[0]."\n";	
	}
	/** /	
	print("<pre>");
	print_r($f);
	print("</pre>");
	
	/* Free statement and connection resources. */
	sqlsrv_free_stmt( $stmt);
	sqlsrv_close( $conn);
	/** /	
	die;
	/**/	

$descriptorspec = array(
   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
   2 => array("file", dirname($filename)."\\error-output.txt", "a") // stderr is a file to write to
);

$cwd = dirname($filename);
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