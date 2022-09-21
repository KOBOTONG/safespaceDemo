<?php
function dbconnection()
{
    $con=mysqli_connect("localhost", "dbsafespace", "ss123456789", "dtb");
    return $con;
}
?>