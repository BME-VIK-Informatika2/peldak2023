<html>
<head>
<title>Állatok</title>
<link rel='stylesheet' type='text/css' href='zh.css' />
</head>
<body>
<H1 id="nev">Név, NKód</H1>
<?php
    if (!isset($_GET['fajnev'])) {
        echo("<H2 id='hiba'>Nincsen fajnév megadva... :(</H2>");
        echo("<form method='GET'>");
        echo("    Fajnév: <input type='text' name='fajnev' />");
        echo("    <input type='submit' />");
        echo("</from>");
    }
    else {
        $mysqli = new mysqli('localhost','root','','allatkert');
        if ($mysqli->connect_errno)
        {
            die("Nem sikerült csatlakozni az adatbázishoz...");
        }

        echo "<TABLE>\n";
        echo "<TR><TH>Azonosító</TH><TH>Név</TH><TH>Min. kor</TH></TR>\n";

        $query = "select A.ID, A.Nev, MIN(G.Kor) as 'minkor'".
            " from allat A join gondozza H on A.ID = H.AllatID join gondozo G on H.GondozoID = G.ID".
            " where A.Faj = ? group by A.ID, A.Nev order by A.Nev;";
        $cmd = $mysqli->prepare($query);
        $cmd->bind_param("s",$_GET['fajnev']);
        $cmd->execute();
        $cmd->bind_result($id, $nev, $minkor);
        while( $cmd->fetch() ) {
            echo "<TR><TD>$id</TD><TD>$nev</TD><TD>$minkor</TD></TR>\n";
        }
        echo "</TABLE>\n";

        $cmd->close();
        $mysqli->close();
    }
?>



</BODY>
</HTML>
