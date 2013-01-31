<?php
	include_once 'ons_common.php';

	$opts=PEAR::getStaticProperty('DB_DataObject','options');
	$ini=buildpath($opts['schema_location'],safe_DataObject_factory("dimDate")->database().'.ini');
	$config = parse_ini_file($ini,true);
	$ini=buildpath($opts['schema_location'],safe_DataObject_factory("dimDate")->database().'.links.ini');
	$links = parse_ini_file($ini,true);
	
	$parse_cls=substr($opts['database'],0,strpos($opts['database'],":"))."_database";
	

	$parser=new $parse_cls();

	class table {
		public $table;
		function __construct($table){
			$this->table=$table;
		}
		
		function mapTo($outputAs){
			print_line(get_class($this)." Output as $outputAs"."_".get_class());
			krumo($this);
			die(__FILE__.":".__LINE__);			
		}		
	}

	class mysqli_table extends table{
		function mapTo($outputAs){
			$sql=$this->table[0]['create table'];
			//This is a mysql format create table function :)
			switch ($outputAs) {
				case 'sqlsrv':
					/**/
					//replace ` with "
					$sql=str_replace('`', '"', $sql);
					//replace int(11) with int
					$sql=str_replace('int(11)', 'int', $sql);
					//replace AUTO_INCREMENT with IDENTITY
					$sql=str_replace('AUTO_INCREMENT', 'IDENTITY', $sql);
					// strip from ENGINE=
					$sql=substr($sql, 0,strpos($sql,'ENGINE'));
					//will force it onto DBO
					$sql=str_replace('TABLE "', 'TABLE "DBO"."', $sql);
										
					$sql.="\nGO\n";
					//Have some complex issues with Unique constrains
					$unique=""; 
					while (strpos($sql,"UNIQUE KEY")>0){
						$key=substr($sql,strpos($sql,"UNIQUE KEY"));
						$sql=substr($sql,0,strpos($sql,"UNIQUE KEY"));
						
						$sql.=substr($key,strpos($key,")")+2);
						$key=substr($key,0,strpos($key,")")+1);
						$unique.="$key\n";
					}														
					//Replace UNIQUE KEY with CREATE UNIQUE INDEX
					$unique=str_replace("UNIQUE KEY", "CREATE UNIQUE INDEX", $unique);
					//Add ON {Table} before (   
					$unique=str_replace("(", "ON [dbo].[".$this->table[0]['table']."] (", $unique); 
					$sql.="\n$unique\nGO\n";
					//Just remove KEYs
					while (strpos($sql,"  KEY")>0){
						$key=substr($sql,strpos($sql,"  KEY"));
						$sql=substr($sql,0,strpos($sql,"  KEY"));
						
						$sql.=substr($key,strpos($key,")")+2);
					}																								
					break;				
				default:
					
					break;
			}
			return $sql;			
		}					
	}

	class sqlsrv_table extends table{
	}


	class view {
		public $view;
		function __construct($view){
			$this->view=$view;
		}
		
		function mapTo($outputAs){
			print_line(get_class($this)." Output as $outputAs"."_".get_class());
			krumo($this);			
			die(__FILE__.":".__LINE__);			
		}		
	}

	class mysqli_view extends view{
/**/		
		function mapTo($outputAs){
			$sql=$this->view[0]['create view'];
			//This is a mysql format create table function :)
			switch ($outputAs) {
				case 'sqlsrv':
					//truncate everything before the VIEW keyword
					$sql="CREATE ".substr($sql,strpos($sql,"VIEW"));
					//replace ` with "
					$sql=str_replace('`', '"', $sql);
					//will force it onto DBO
					$sql=str_replace('VIEW "', 'VIEW "DBO"."', $sql);
					
										
					break;				
				default:
					
					break;
			}
			return $sql;			
		} 
		
	}

	class sqlsrv_view extends view{
	}


	class database {
		function parseDatabase(){
			global $db;
			
			$db->loadModule('Manager');
	        $db->loadModule('Reverse');
	        
	        //$this->sequences = $db->manager->listSequences();
			
			foreach ($db->manager->listTables() as $table)			
				database::saveTable($table,$this->showCreateTable($table));
			foreach ($db->manager->listViews() as $view)			
				database::saveView($view,$this->showCreateView($view));
		}

		static function saveTable($table,$description){
			mysqli_database::saveTable($table, $description);
			sqlsrv_database::saveTable($table, $description);

		}

		static function saveView($view,$description){
			mysqli_database::saveView($view, $description);
			sqlsrv_database::saveView($view, $description);

		}


		function validateTable($table,$fields){
			$table_data=$this->describeTable($table);
			print_line("Validating $table");
			if (count($table_data)==0){
				print('<b>Table not there so Create</b><br/>');
				$this->createTable($table);
			}
			else {
				print_line('Table there so check fields');
				
				$missing=array_values(array_diff(array_map('strtolower',array_keys($fields)), array_map('strtolower',array_keys($table_data))));
				if (count($missing)>0){
					print("<b>{$missing[0]} missing from Table $table</b><br/>");
					$this->addFields($table, $missing);
				}
				$extras=array_values(array_diff(array_map('strtolower',array_keys($table_data)),array_map('strtolower',array_keys($fields))));
				foreach ($extras as $extra){
					print("<b>$extra extra in Table $table</b><br/>");
					//$this->addFields($table, $missing);
				}				
			}
								
			//krumo($table_data);
			//die(__FILE__.":".__LINE__);
		}

		function addFields($table,$fields){
			global $db;
			$sqls=$this->ammendTableSQL($table,$fields);

			foreach($sqls as $sql){
				if (trim($sql)!="")
					$db->exec($sql);
			}
		}
		
		function createTable($table){
			global $db;
			$sqls=$this->createTableSQL($table);
						
			foreach($sqls as $sql){
				if (trim($sql)!="")
					$db->exec($sql);
			}
				
		}			
		
	}

	class mysqli_database extends database {
		
		function showCreateTable($table){
			global $db;			
			$res = $db->queryAll('SHOW CREATE TABLE ' . $table);
			return new mysqli_table($res);			
		}

		function showCreateView($view){
			global $db;			
			$res = $db->queryAll('SHOW CREATE TABLE ' . $view);
			return new mysqli_view($res);			
		}


		function describeTable($table){
			global $db;			
			return $db->queryAll("DESCRIBE $table");
		}

		static function saveView($view,$description){
			$sql="";
			if (is_a($description, 'mysqli_view')){
				$sql=$description->view[0]['create view'];
			}
			else 
				$sql=$description->mapTo('mysqli');
			
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"msqli",$description->view[0]['view'].".sql");
			@mkdir(dirname($file));
			if (!file_exists($file) or file_get_contents($file)!=$sql)
				file_put_contents($file, $sql);			
			print_line("Saved $file");
		}

		static function saveTable($table,$description){
			$sql="";
			if (is_a($description, 'mysqli_table')){
				$sql=$description->table[0]['create table'];
			}
			else 
				$sql=$description->mapTo('mysqli');
			
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"msqli",$description->table[0]['table'].".sql");
			@mkdir(dirname($file));
			if (!file_exists($file) or file_get_contents($file)!=$sql)
				file_put_contents($file, $sql);			
			print_line("Saved $file");
		}			

		function createTableSQL($table){
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"msqli",$table.".sql");
			return file_get_contents($file);
		}
	}
	
	class sqlsrv_database extends database {
		function showCreateTable($table){
			die (__FILE__.":".__LINE__." function not appropriate: ".__FUNCTION__);		
		}
		
		function describeTable($table){
			global $db;			
			
			$sql="Select SC.name AS 'Field', ISC.DATA_TYPE AS 'Type', ISC.CHARACTER_MAXIMUM_LENGTH AS 'Length', SC.IS_NULLABLE AS 'Null', I.is_primary_key AS 'Key', SC.is_identity AS 'Identity'
From sys.columns AS SC 
LEFT JOIN sys.index_columns AS IC
ON IC.object_id = OBJECT_ID('dbo.$table') AND 
IC.column_id = SC.column_id
LEFT JOIN sys.indexes AS I 
ON I.object_id = OBJECT_ID('dbo.$table') AND 
IC.index_id = I.index_id
LEFT JOIN information_schema.columns ISC
ON ISC.TABLE_NAME = 'Expenses'
AND ISC.COLUMN_NAME = SC.name
WHERE SC.object_id = OBJECT_ID('dbo.$table')";

			$ret=array();
			foreach ($db->queryAll($sql) as $row)
			{
				$ret[$row['field']]=$row;
			}
			return $ret;
		}

		static function saveView($view,$description){
			$sql="";
			if (is_a($description, 'sqlsrv_view')){
				$sql=$description->view[0]['create view'];
			}
			else 
				$sql=$description->mapTo('sqlsrv');
			
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"sqlsrv",$description->view[0]['view'].".sql");
			@mkdir(dirname($file));
			if (!file_exists($file) or file_get_contents($file)!=$sql)
				file_put_contents($file, $sql);			
			print_line("Saved $file");						
		}

		static function saveTable($table,$description){
			$sql="";
			if (is_a($description, 'sqlsrv_table')){
				$sql=$description->table[0]['create table'];
			}
			else 
				$sql=$description->mapTo('sqlsrv');
			
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"sqlsrv",$description->table[0]['table'].".sql");
			@mkdir(dirname($file));
			if (!file_exists($file) or file_get_contents($file)!=$sql)
				file_put_contents($file, $sql);			
			print_line("Saved $file");
		}			
		
		function createTableSQL($table){
			$opts=PEAR::getStaticProperty('DB_DataObject','options');
			$file=buildpath($opts['schema_location'],"sqlsrv",$table.".sql");
			return split("\nGO",file_get_contents($file));
		}
		
		function ammendTableSQL($table,$fields){
			$sqls=$this->createTableSQL($table);
			$ret=array();
			//First find Create table Block
			foreach($sqls as $sql){
				if (!(strpos($sql,"CREATE TABLE")===false)){
					foreach ($fields as $field) {
						$field=substr($sql,strpos(strtolower($sql),strtolower("\"$field\"")));
						$field="ALTER TABLE $table ADD ".substr($field,0,strpos($field,","));
						$ret[]=$field;
					}
				} 	
			}
			if (count($ret)==0){
				//Haven't found the field so probably is a view!
				foreach($sqls as $sql){
					if (!(strpos($sql,"CREATE VIEW")===false)){
						$ret[]="DROP VIEW [DBO].[$table]";
						$ret[]=$sql;
					}
				}
			}
			return $ret;
		}
	}

	Krumo::enable();	

	if (isset($_GET['parseme'])){
		$parser->parseDatabase();		
	}
	else {
		//Need to order tables so dependency tables are created first
		//Thankfully Views naturally sink to the bottom so should be created after tables!
		$tables=array();	
		foreach($config as $table=>$fields){
			if (strpos($table,"__keys")===false){
				if (!key_exists($table, $tables)){
					if (key_exists($table,$links)){
						foreach($links[$table] as $link){
							if (strpos($link,":")>0) $link=substr($link,0,strpos($link,":"));
							$tables[$link]=$config[$link];
						}
					}				
					$tables[$table]=$fields;	
				}				
			}
		}
		
		foreach($tables as $table=>$fields){
			$parser->validateTable($table,$fields);										
		}							
	}
	pageTime();    
?>