<html>
<head><title>Set cookie</title></head>
<body>
<?php
    if (isset($_COOKIE['kulcs']))
    {
        $ertek = $_COOKIE['kulcs'];
        echo "Be van állítva a 'kulcs' cookie, értéke: $ertek<P/>\n";
    }
    else
    {
        echo "Nincsen beállítva  a 'kulcs' cookie...<P/>\n";
    }
?>
<A href="cookie_set.php">Cookie beállítása</A>
</body>
</html>
