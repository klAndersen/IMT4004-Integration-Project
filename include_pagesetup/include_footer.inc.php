<?php
  //page owner/administrator
  $owner = "Knut Lucas Andersen"; 
  $contactOwner = "<tr><td>$owner, All rights reserved &copy; 2015.</td></tr>";  
  //contact e-mail to page adminstrator
  $mail = "knut.andersen@hig.no";    
  $mailTo = '<tr><td>Contact: <a href="mailto:'.$mail.'">'.$mail.'</a></td></tr>'; 
  
  echo "<!-- footer -->
  <footer>
  <table>
  $contactOwner
  $mailTo
  </table>
  </footer>
	</body>
  </html>";
?>