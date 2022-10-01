<?php
include("connected.php");
$con = dbconnection();

if (isset($_POST["username"])) {
    $username = $_POST["username"];
} else return;
if (isset($_POST["passuser"])) {
    $passuser = $_POST["passuser"];
} else return;

$arr=[];
$query="SELECT `no`, `username`, `fname`, `lname`, `licsenseplate`, `mailuser`, `passuser`, `phone`, `iden`, `vehicle` FROM `acc_user` WHERE username='$username'AND passuser='$passuser';
";
$e = mysqli_query($con, $query);
if(mysqli_num_rows($e)>0)
{  $arr["success"] = "already";}
else{{
    $arr["success"] = "false";
}
}
print(json_encode($arr));
?>