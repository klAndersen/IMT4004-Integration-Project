<?php    
  include "include_pagesetup/include_top.inc.php";
?>
<body onload="setIframeSize();">
	<!--[if lt IE 10]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. 
	  Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

	<header>
	<h1>Play Game: &lt;game_title&gt;</h1>       
	<?php
		include "include_pagesetup/include_header_navigation.inc.php";
	?>
	</header>
  
  <iframe id="gamewindow" src="gamewindow.php">
  <p>Your browser does not support iFrames.</p>
  </iframe>
  
</body>
<?php
  include "include_pagesetup/include_footer.inc.php";
?>