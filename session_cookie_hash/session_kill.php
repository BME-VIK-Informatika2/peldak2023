<?php session_start();
?>
<HTML>
<HEAD><TITLE>Session demo (close)</TITLE></HEAD>
<BODY>
<?php
	if (!isset($_SESSION['Message']))
	{
		echo "Nincs törölhető session...<BR/>";
	}
	else
	{
		unset($_SESSION['Message']);
		if (isset($_SESSION['Message']))
		{
			echo "Cannot destroy the session! :(";
		}
		else
		{
			echo "<H1>Muhahaha.... Session was annihilated!!! :)</H1><BR/>";
		}
	}
?>
<A href="session_start.php">Jump to Start</A><BR/>
<A href="session_start_HttpsOnly.php">Jump to secure Start</A><BR/>
<A href="session_show.php">Jump to show message</A><BR/>
</BODY>
</HTML>
