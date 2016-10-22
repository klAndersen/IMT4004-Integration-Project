// JavaScript Document

function getScreenWidth(screenPercentage) {
	//set width equal to passed percentage
	var reductionWidth = (screen.width * screenPercentage) / 100;
	var width = screen.width - reductionWidth;
	return width;
} //getScreenWidth

function getScreenHeight(screenPercentage) {
	//set height equal to passed percentage
	var reductionHeight = (screen.height * screenPercentage) / 100;
	var height = screen.height - reductionHeight;
	return height;
} //getScreenHeight

function setIframeSize() {
	var widthPercentage = 5;
	var heightPercentage = 40;
	document.getElementById("gamewindow").width = getScreenWidth(widthPercentage) + "px";
	document.getElementById("gamewindow").height = getScreenHeight(heightPercentage) + "px";
	//debugging
	//alert("width: " + getScreenWidth(widthPercentage) + " " + " height: " + getScreenHeight(heightPercentage));
} //setIframeSize