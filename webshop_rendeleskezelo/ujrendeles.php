<!DOCTYPE html> 
<html> 
    <head><title>Új rendelés felvétele</title></head> 
    <body> 
<?php 
    // GET parameters: VevoID, db, TermekID
    if( !isset( $_GET[ 'VevoID' ] ) || !isset( $_GET[ 'db' ] ) || !isset( $_GET[ 'TermekID' ] ) ) { 
        echo "GET parameter missing. VevoID, db, TermekID needed.";
        die;
    }

    $vevoID = $_GET[ 'VevoID' ]; 
    $termekID = $_GET[ 'TermekID' ]; 
    $db = $_GET[ 'db' ]; 

    $mysqli = new mysqli("localhost","root","","demowebshop");
    if($mysqli->connect_errno)
    {
        echo "MySQL error: " . $mysqli->connect_error . "<BR/>";
        die;
    }

    $query="INSERT INTO Megrendeles(VevoID, Datum) VALUES(?,curdate())";
    echo "SQL command: ".$query."<BR/>VevoID=".$vevoID."<BR/>\n";
    $statement = $mysqli->prepare($query);
    $statement->bind_param("i", $vevoID);
    $statement->execute();
    $megrendelesID = $mysqli->insert_id;
    echo "New MegrendelesID is $megrendelesID.<BR/>\n";
    $statement->close();

    $query="INSERT INTO MegrendelesTetel(MegrendelesID, TermekID, db) VALUES(?,?,?)";
    echo "SQL command: $query<BR/>MegrendelesID=$megrendelesID, TermekID=$termekID, db=$db<BR/>\n";
    $statement = $mysqli->prepare($query);
    $statement->bind_param("iii", $megrendelesID,$termekID,$db);
    $statement->execute();
    $statement->close();

    $mysqli->close();

    echo "Az új megrendelést rögzítettük.<BR/>\n";
    echo "<A href='termekrendelesei.php?TermekID=$termekID'>Vissza a termék rendeléseihez</A>";
?>
</body> 
</html>
