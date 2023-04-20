<html>
<head>
<link rel="stylesheet" href="style.css"/>
<title>Termékek rendelései és új rendelés felvétele</title>
</head>
<body>
<?php
    if( !isset( $_GET[ 'TermekID' ] ) ) { 
        echo "No TermekID received via querystring.";
        die;
    }

    $termekID = $_GET['TermekID']; 

    $mysqli = new mysqli("localhost","root","","demowebshop");
	if($mysqli->connect_errno)
	{
		echo "MySQL hiba: " . $mysqli->connect_error . "<BR/>";
        die;
	}

	$query = "SELECT Nev FROM Termek where ID=?";
    $statement = $mysqli->prepare($query);
    $statement->bind_param("i",$termekID);
    $statement->execute();
	$statement->bind_result($termekNev);
    $statement->fetch();
	$statement->close();
    echo "<H1>Az adatbázisban az alábbi rendelések szerepelnek a(z) $termekNev termékre:</H1>\n";

    echo "<TABLE border='1' align='center'>";
    echo "<TR class='rendeleslistasor'><TH>Vevő</TH><TH>Darabszám</TH></TR>\n";

	$query = "SELECT MT.db, V.Nev FROM MegrendelesTetel MT join Megrendeles M on MT.MegrendelesID=M.ID join Vevo V on M.VevoID=V.ID where MT.TermekID=?";
    $statement = $mysqli->prepare($query);
    $statement->bind_param("i",$termekID);
    $statement->execute();
	$statement->bind_result($db,$vevoNev);
	while ($statement->fetch()) {
		echo "<TR class='rendeleslistasor'><TD>$vevoNev</TD><TD>$db</TD></TR>\n"; 
	}
	$statement->close();
    echo "</TABLE>\n";

    echo "<form method='GET' action='ujrendeles.php' accept-charset='utf-8'>";
    echo "Vevő:";
    echo "<select name='VevoID'>";
	$query = "SELECT ID, Nev FROM Vevo";
    $statement = $mysqli->prepare($query);
    $statement->execute();
	$statement->bind_result($vevoID,$vevoNev);
	while ($statement->fetch()) {
		echo "<option value='$vevoID'>$vevoNev</option>\n"; 
	}
	$statement->close();
    echo "</select><BR/>";
    echo "Darabszám: <input type='text' name='db'/><br/>\n";
    echo "<input type='hidden' name='TermekID' value='$termekID'/>";
    echo "<input type='submit'/>\n";
    echo "</form>\n";

	$mysqli->close();
	?>

<A href="termeklista.php">Vissza a termékek listájához</A>
</body>
</html>
