<?php
/*
	//start sessions
	session_start();
	//include files 
	require_once("include_classes/db_class.php");	
	
	//default values just to simulate login
	$studPwd = "pwd";
	$studNo = "130533";
	$exceptionMessage = "";
	$caughtException = false;
	
	//check if sessions are initialized with player information
	if (empty($_SESSION['Player'])) {
		try {
			Database::getClassInstance()->retrievePlayerInformation($studNo, $studPwd);
			//these are needed for data to be displayed in the tree
			//these parameters must be changed IF one want something else (e.g. retrieved data from db)
			$_SESSION['Player']['parent'] = "null";
			$_SESSION['Player']['name'] = "parent";
		} catch (Exception $ex){
			$caughtException = true;
			$exceptionMessage = "An exception occurred: " . $ex->getMessage();
		} //try/catch
	} //if
	/ * / * */
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<!--CSS styling for the document -->
		<link rel="stylesheet" href="styles/gameworld.css"> 
		<!-- Javascript: ajax/jquery from google's api -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- Javascript: Data visualization tool -->
		<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
		<!-- Javascript: gameworld functions -->
		<script src="scripts/gameworld.js"></script>
		<script src="scripts/lisp_interpreter.js"></script>
		<!--
		<script src="scripts/draw_tree.js" ></script>
		-->
		<script>
		/*//convert php values to json
		 var data = [
		 <?php 
		 echo json_encode($_SESSION['Player']); 
		 echo ','; 
		 //manipulating data for testing
			$_SESSION['Player']['parent'] = "parent";
			$_SESSION['Player']['name'] = "child";
		 echo json_encode($_SESSION['Player']); 
		 ?>];
		//*/
		 
		 //note that the root is the second element, therefore the debug 
		 //output will show the ELSE statement as the second printout
		 
		var treeData = [
			{
				"name": "Top Level",
				"parent": "null",
				"children": [
					{
						"name": "Level 2: A",
						"parent": "Top Level",
						"children": [
							{
								"name": "Son of A",
								"parent": "Level 2: A"
							},
							{
								"name": "Daughter of A",
								"parent": "Level 2: A"
							}
						]
					},
					{
						"name": "Level 2: B",
						"parent": "Top Level"
					}
				]
			}
		];
		 
		 var data = [
			{ "name" : "Level 2: A", "parent":"Top Level" },
			{ "name" : "Top Level", "parent":"null" },
			{ "name" : "Son of A", "parent":"Level 2: A" },
			{ "name" : "Daughter of A", "parent":"Level 2: A" },
			{ "name" : "Level 2: B", "parent":"Top Level" }
			];
			//*/
		</script>
		<style>
		
		</style>
	</head>
	<body> 
	<?php
	/*
	//did an exception occur?
	if ($caughtException) {
		echo $exceptionMessage;
	} else { //no exceptions, display content
	*/
	?>
	<div id="errorMsg"></div>
		Textarea for debugging: 
		<textarea rows="4" cols="50" id="txtArea" ></textarea>
		
		
			
		<script src="scripts/draw_tree.js" ></script>
	
		<!--
		<script src="code snippets/draw_graph.js" ></script>
		-->
		
		<script>
		/**
		constants: for testing
		var json_normal = 0;
		var json_flat = 1;
		var json_external = 2;
		var json_csv = 3;
		*/
		
		var path = "scripts/math_map_compact.json";
		/*
		drawTreeDiagram(json_normal, treeData);
		
		drawTreeDiagram(json_flat, data);
		*/
		drawTreeDiagram(json_external, path);
		/*
		drawTreeDiagram(json_csv, path);
		*/
		</script>
	<?php
	/*
	} //if
	*/
	?>
	</body>
</html>