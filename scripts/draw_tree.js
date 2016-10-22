/**
 JavaScript file for creating a tree diagram with interaction.
 This code is mainly based on examples from: 
 - http://bl.ocks.org/d3noob/8323795
 - http://bl.ocks.org/mbostock/4339083
 - "D3 Tips and tricks", p. 286-315 (https://leanpub.com/D3-Tips-and-Tricks)
 
 The notable changes made to the original code is re-naming some variables, 
 adding extra comments and functions for better readability.
*/

/**** CONSTANT VALUES - VALUE TO BE CHANGED HERE ONLY! ****/
//JSON data types constants
var json_normal = 0;
var json_flat = 1;
var json_external = 2;
var json_csv = 3;
//expansion factor, used for spacing of nodes
var	expansion_factor = 100;

/**** GLOBAL VARIABLES ***/
//default width/height
var defWidth = 960, 
	defHeight = 500;

//margin and size parameters for the tree diagram
var margin = {top: 40, right: 120, bottom: 20, left: 120},
	width = defWidth - margin.right - margin.left,
	height = defHeight - margin.top - margin.bottom;

//the root node for the tree, pre-incrementer for nodes without id and 
//the animation duration for collapsing/expanding nodes
var rootNode,
	preInc_ID = 0,	
	duration = 750;    

//variable for the tree where height and width is set
var tree = d3.layout.tree()
	.size([height, width]);
	
//set the diagonal direction for the tree (here: vertical)
var diagonal = d3.svg.diagonal()
	.projection(function(d) { return [d.x, d.y]; });

//create a container (<svg>) and group elements (<g>) within the HTML document <body>  
var svg = d3.select("body").append("svg")
	.attr("width", width + margin.right + margin.left)
	.attr("height", height + margin.top + margin.bottom)
	.append("g")
	.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

//TODO: maybe remove this or make it set to default onLoad
//temp variable for whether or not to collapse the grandchildren of the root node
var collapseChildren = true;

/**
This function draws the tree diagram. It takes two parameters, 
the first defining the data type (use constants described below), 
the second is the JSON data source. The dataType should be one 
of the following values:
 - json_normal: normal JSON data. expects locally declared variable with the 
	JSON data. expects dataSource to be the variable containing the JSON data.
 - json_external: read JSON data from file. expects dataSource to contain 
	path to the file with JSON data.
 - json_flat: read flat JSON data.  expects dataSource to be an array containing 
	the flat JSON data
 - json_csv: read JSON data from csv file. expects dataSource to contain 
	path to the csv file with JSON data.
--------------------------------------------------------------
@param dataType: the JSON datatype (e.g. csv, flat, external, etc.) 
@param dataSource: the JSON data; can be a  filepath (if external/csv), 
or array containing JSON data (normal/flat)
*/
function drawTreeDiagram(dataType, dataSource) {
	try {
		//what data format is the JSON in?
		switch(dataType) {
			case json_normal:
				rootNode = dataSource[0];
				initializeTree();
				break;
			case json_flat:
				var tempArray = readFlatJSON(dataSource);
				rootNode = tempArray[0];
				initializeTree();
				break;
			case json_external:
				readExternalJSON(dataSource);
				break;
			case json_csv:
				//NOTE! this is not implemented
				throw "Read JSON from CSV is not implemented";
				rootNode = readJSONFromCSV(dataSource);
				initializeTree();
				break;
		} //switch
	} catch (ex) {
		document.getElementById("errorMsg").innerHTML = ex;
	} //try/catch
} //drawTreeDiagram  

function initializeTree() {
	rootNode.x0 = height / 2;
	rootNode.y0 = 0;
	//should the grandchildren of the root node be collapsed?
	if (collapseChildren) {
		rootNode.children.forEach(onNodeCollapse);
	} //if
	updateTreeDiagram(rootNode);
} //initializeTree

function onNodeCollapse(node) {
	//if the node has children, collapse them
	if (node.children) {
	  node._children = node.children;
	  node._children.forEach(onNodeCollapse);
	  node.children = null;
	} //if
} //onNodeCollapse

function readFlatJSON(dataArray) {
	/** based on example from "D3 Tips and tricks", p. 308-310 **/
	//temporary array to be filled with JSON data
	var tempArray = [];	
	//iterate over the data by using array.reduce(...) to add an entry for each node.
	//see: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
	var dataMap = dataArray.reduce(function(map, node) {
		map[node.name] = node;
		return map;
	}, {});		
	/**
	For each node in the array, get the parent of the current node.
	If the current node has a parent, create an array containing the children.
	If the node doesn't have a parent, then this is the root node.
	*/	
	dataArray.forEach(function(node) {
		//set the parent for the current node
		var parent = dataMap[node.parent];
		//does this node have a parent?
		if (parent) {
			//create child array if it doesn't exist
			(parent.children || (parent.children = []))
			//add node to child array
			.push(node);
		} else {
			//parent is null or missing (could be root node)
			tempArray.push(node);
		} //if	
	});
	return tempArray;
} //readFlatJSON

function readExternalJSON(dataSource) {
	//TODO: move this link (here for referencing purposes)
	// http://stackoverflow.com/questions/12656580/returning-array-from-d3-json
	d3.json(dataSource, function(error, data) {
		try {
			rootNode = data[0];
			initializeTree();
		} catch (ex) {
			document.getElementById("errorMsg").innerHTML = ex;
		} //try/catch
	});
} //readExternalJSON

//TODO: Create this function
//for now, not a priority
function readJSONFromCSV(dataSource) {
	/** based on example from "D3 Tips and tricks", p. 313 **/
	//temporary array to be filled with JSON data
	var tempArray = [];	
	return tempArray;
} //readJSONFromCSV

function updateTreeDiagram(source) {
	//nodes: the children of the source
	//links: the branches between parent and children nodes
	var nodes = tree.nodes(rootNode).reverse(),
	links = tree.links(nodes);
	//normalization for fixed depth, where depth is the node levels
	//(e.g. root: 0, child: 1, grandChild: 2, ..., grandNChild: n)
	nodes.forEach(function(d) { 
		d.y = d.depth * expansion_factor; 
	});
	//select all the nodes from the group, this to know which node 
	//is called/referred later on (based on the nodes id)
	var node = svg.selectAll("g.node")
		.data(nodes, function(d) { 
			//return existing id or create a new one
			return d.id || (d.id = ++preInc_ID); 
	});
	//set event for when a node is entered
	onNodeEnter(source, node);
	//set event for when node is updated
	onNodeUpdate(node);
	//set event for when a node is exited
	onNodeExit(source, nodes, node, links);
} //updateTreeDiagram

function onNodeEnter(source, node) {
	//when entering a node, do the following:
	// - add the node to the group <g>
	// - add an attribute of type "class" with value "node"
	// - add an attribute of type transform, based on the translation
	//   function(d) (vertical or horizontal)
	var nodeEnter = node.enter().append("g")  
		.attr("class", "node")
		.attr("transform", function(d) { 
			return "translate(" + source.x0 + "," + source.y0 + ")"; 
		})
		.on("click", onNodeClick);
	
	//visualize the node as a SVG circle
	//see: http://www.w3schools.com/svg/svg_circle.asp
	nodeEnter.append("circle")
		//r: radius of the circle in pixels
		.attr("r", 10);
	
	//add text to the node, the text is positioned either to 
	//the left or right of the node
	// - left: the node has children
	// - right: node has no children || d._children
	nodeEnter.append("text")
		.attr("y", function(d) { 
			return d.children || d._children ? -18 : 18; 
		})
		.attr("dy", ".35em")	  
		.attr("text-anchor", "middle")
		.text(function(d) { 
			return d.name; 
		})
		.style("fill-opacity", 1);
} //onNodeEnter

function onNodeClick(node) {
	if (node.children) {
		node._children = node.children;
		node.children = null;
	} else {
		node.children = node._children;
		node._children = null;
	} //if
	//update the tree
	updateTreeDiagram(node);
} //onClick

function onNodeUpdate(node) {
	//set new transition for this node
	var nodeUpdate = node.transition()
		.duration(duration)
		.attr("transform", function(d) { 
			return "translate(" + d.x + "," + d.y + ")"; 
		});
	
	//update the nodes attribute values
	nodeUpdate.select("circle")
		.attr("r", 10)
		//set style based on if the node has children,
		//and if the children is displayed (if displayed, circle is white)
		.style("fill", function(d) { 
			return d._children ? "lightsteelblue" : "#fff"; 
		});

	//update the nodes text style
	nodeUpdate.select("text")
		.style("fill-opacity", 1);
} //onNodeUpdate

function onNodeExit(source, nodes, node, links) {
	//adjust the node to the parents position
	var nodeExit = node.exit().transition()
		.duration(duration)
		.attr("transform", function(d) { 
			return "translate(" + source.x + "," + source.y + ")"; 
		})
		.remove();

	//set radius to a low value to make it hidden
	nodeExit.select("circle")
		.attr("r", 1e-6);
	//set text to a low value to make it hidden
	nodeExit.select("text")
		.style("fill-opacity", 1e-6);
	  
	//update the node links/branches
	updateNodeLinks(source, links);

	//stash the old positions for transition
	nodes.forEach(function(d) {
		d.x0 = d.x;
		d.y0 = d.y;
	});
} //onNodeExit

function updateNodeLinks(source, links) {
	//select all the links
	var link = svg.selectAll("path.link")
		.data(links, function(d) { 
			return d.target.id; 
		});

	//add new links (e.g. if nodes are expanded, new nodes added, etc.)
	link.enter().insert("path", "g")
		.attr("class", "link")
		.attr("d", function(d) {
			var o = {
				x: source.x0, 
				y: source.y0
			};
			return diagonal({source: o, target: o});
		});

	//update the links position
	link.transition()
		.duration(duration)
		.attr("d", diagonal);

	//adjust the links to the parent nodes position
	link.exit().transition()
		.duration(duration)
		.attr("d", function(d) {
			var o = {
				x: source.x, 
				y: source.y
			};
			return diagonal({source: o, target: o});
		})
		.remove();
} //updateNodeLinks