<?php session_start(); ?>
<HTML>
<HEAD><TITLE>Session demo (Show message)</TITLE></HEAD>
<BODY>
Session demo, page 2, show...<BR/>
<?php 
	if (isset($_SESSION['Message']))
	{
		echo "Session Message: ".$_SESSION['Message']."<BR/>";
	}
	else
	{
		echo "No session found... :(<BR/>";
	}
?>
<A href="session_start.php">Jump to Start</A><BR/>
<A href="session_start_HttpsOnly.php">Jump to secure Start</A><BR/>
<A href="session_kill.php">Jump to close the session</A>
</BODY>
</HTML>
