<?php session_start();
$_SESSION['Message']="Hello";
?>
<HTML>
<HEAD><TITLE>Session demo (Start)</TITLE></HEAD>
<BODY>
Session demo, page 1<BR/>
<?php 
	echo "Session Message: ".$_SESSION['Message']."<BR/>";
?>
<A href="session_show.php">Jump to show session status</A><BR/>
<A href="session_kill.php">Jump to close the session</A>
</BODY>
</HTML>
