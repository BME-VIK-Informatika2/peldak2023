<?php
if ($_SERVER["HTTPS"] != "on")
{
	header("Location: https://".$_SERVER["HTTP_HOST"].
		$_SERVER["REQUEST_URI"]);
	exit();
}
session_start();
$_SESSION['Message']="Hello";
?>
<HTML>
<HEAD><TITLE>Session demo (Start https)</TITLE></HEAD>
<BODY>
Session demo, page 1<BR/>
<?php 
	echo "HTTPS Status: ".$_SERVER["HTTPS"]."<BR/>";
	echo "Session Message: ".$_SESSION['Message']."<BR/>";
?>
<A href="session_show.php">Jump to show message</A><BR/>
<A href="session_kill.php">Jump to close session</A>
</BODY>
</HTML>
