<HTML>
<HEAD><TITLE>Delete customer - GET method</TITLE>
</HEAD>
<BODY>

<?php
if(isset($_GET['VevoID']))
{
	echo "VevoID=" . $_GET['VevoID'] . " will be deleted!!! :) <BR/>";
	$VevoID = $_GET['VevoID'];
	
	$mysqli = new mysqli("localhost","root","","demowebshop");
	if($mysqli->connect_errno)
	{
		echo "MySQL error: " . $mysqli->connect_error . "<BR/>";
	}

    $query="DELETE FROM Vevo WHERE ID=?";
	echo "SQL command: ".$query."<BR/>ID=".$VevoID."<BR/>";
    $statement = $mysqli->prepare($query);
    $statement->bind_param("i", $VevoID);
    
	if(!$statement->execute())
	{
		echo "Could not delete. Does customer have orders?<BR/>";
	}
	else
	{
		echo "Successful :)<BR/>";
	}
    $statement->close();
	$mysqli->close();
}
else
{
	echo "VevoID not set in connection string... :(";
}
?>

<A href="ShowCustomers_WithDeleteLink.php">Back to the list</A>

</BODY>
</HTML>
