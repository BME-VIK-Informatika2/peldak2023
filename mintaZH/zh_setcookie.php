<?php
if (isset($_GET['skin']))
{
    setcookie("skin",$_GET['skin']);
}
?>
<html>
<head><title>Kész a süti...</title></head>
<body>
<?php
if (isset($_GET['skin']))
{
    echo "<H1>Cookie beállítva... (default timeout: session)</H1>";
}
else
{
    echo "<H1>A cookie nincs beállítva, mert nincs skin get paraméter</H1>";
}
?>

<A href="zh.php">Most már néz meg a ZH oldalt ezzel a skinnel!</A>
</body>
</html>
