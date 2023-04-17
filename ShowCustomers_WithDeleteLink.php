<html>
<head><title>Customer list</title></head>
<body>
<H1>Following customers are in the database:</H1>
<TABLE border="1" align="center">
<TR bgcolor="lightgrey"><TD>ID</TD><TD>Name</TD><TD>Address</TD><TD>Delete</TD></TR>
<?php
	$mysqli = new mysqli("localhost","root","","demowebshop");
	if($mysqli->connect_errno)
	{
		echo "MySQL error: " . $mysqli->connect_error . "<BR/>";
	}

	/* change character set to utf8 */
	if (!$mysqli->set_charset("utf8")) {
		printf("Error loading character set utf8: %s\n", $mysqli->error);
	} else {
		printf("Current character set: %s\n", $mysqli->character_set_name());
	}

	$query = "SELECT ID,Nev,Cim FROM Vevo";
    $statement = $mysqli->prepare($query);
    $statement->execute();

	$statement->bind_result($id,$nev,$cim);
	$i = 0;
	while ($statement->fetch()) {
		$i++;
		if ($i % 2 == 0)
		{
			$bgcolor = "lightblue";
		}
		else
		{
			$bgcolor = "white";
		}
		$DeleteURL=sprintf("<A href=\"DeleteCustomer.php?VevoID=%s\">Delete</A>",$id);
		printf("<TR bgcolor=\"%s\"><TD>%s</TD><TD>%s</TD><TD>%s</TD><TD>%s</TD></TR>\n",
			$bgcolor, $id, $nev, $cim,$DeleteURL);   
	} 
	
	$statement->close();
	$mysqli->close(); 
	?>
</TABLE>
</body>
</html>
