<!DOCTYPE html> 
<html> 
    <head><title>New Customer (post method)</title></head> 
    <body> 
<?php 
    if( isset( $_POST[ 'Nev' ] ) ) { 
        $CustomerName = $_POST[ 'Nev' ]; 
        $CustomerAddress = $_POST[ 'Cim' ]; 
 
		$mysqli = new mysqli("localhost","root","","demowebshop");
		if($mysqli->connect_errno)
		{
			echo "MySQL error: " . $mysqli->connect_error . "<BR/>";
		}
 
        $query="INSERT INTO Vevo(Nev, Cim) VALUES(?,?)";
        echo "SQL command: ".$query."<BR/>Name=".$CustomerName." Address=".$CustomerAddress."<BR/>";
        $statement = $mysqli->prepare($query);
        $statement->bind_param("ss", $CustomerName,$CustomerAddress);
        
        if(!$statement->execute())
        {
            echo "Could not execute...<BR/>";
        }
        else
        {
            echo "Successful :)<BR/>";
        }
        $statement->close();
        $mysqli->close();

		echo('Customer added (received via POST method)');
    } 
?>
        <form method="POST" accept-charset="utf-8"> 
            Name: <input type="text" name="Nev" /> <br /> 
            Cím: <input type="text" name="Cim" /> <br /> 
            <input type="submit"/> 
        </form>

		<A href="ShowCustomers_WithDeleteLink.php">Jump to the list</A>
    </body> 
</html> 
