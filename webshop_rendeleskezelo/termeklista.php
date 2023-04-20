<html>
<head><link rel="stylesheet" href="style.css"/><title>Termékek listája</title></head>
<body>
<H1>Az adatbázisban az alábbi termékek szerepelnek:</H1>
<TABLE border="1" align="center">
<TR class="termeklistasor"><TH>Név</TH><TH>Rendelések száma</TH><TH>Részletek</TH></TR>
<?php
	$mysqli = new mysqli("localhost","root","","demowebshop");
	if($mysqli->connect_errno)
	{
		echo "MySQL hiba: " . $mysqli->connect_error . "<BR/>";
        die;
	}

	$query = "SELECT ID,Nev,count(*) FROM Termek T join MegrendelesTetel MT on T.ID=MT.TermekID group by T.ID,T.Nev";
    $statement = $mysqli->prepare($query);
    $statement->execute();

	$statement->bind_result($id,$nev,$db);
	while ($statement->fetch()) {
        $ordersURL = "<A href=\"termekrendelesei.php?TermekID=$id\">Rendelések</A>";
		echo "<TR class='termeklistasor'><TD>$nev</TD><TD>$db</TD><TD>$ordersURL</TD></TR>\n"; 
	}
	
	$statement->close();
	$mysqli->close();
	?>

</TABLE>
</body>
</html>