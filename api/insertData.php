<?php


include("connected.php");
$con = dbconnection();

if (isset($_POST["username"])) {
    $username = $_POST["username"];
} else return;

if (isset($_POST["fname"])) {
    $fname = $_POST["fname"];
} else return;

if (isset($_POST["lname"])) {
    $lname = $_POST["lname"];
} else return;

if (isset($_POST["licsenseplate"])) {
    $licsenseplate= $_POST["licsenseplate"];
} else return;

if (isset($_POST["mailuser"])) {
    $mailuser = $_POST["mailuser"];
} else return;

if (isset($_POST["password"])) {
    $password = $_POST["password"];
} else return;

if (isset($_POST["phone"])) {
    $phone = $_POST["phone"];
} else return;

if (isset($_POST["nameiden"])) {
    $nameiden = $_POST["nameiden"];
} else return;

if (isset($_POST["namevehi"])) {
    $namevehi = $_POST["namevehi"];
} else return;

$iden = "uploadIden/$nameiden";
$vehicle = "uploadVehical/$namevehi";

$arr = [];
$q="SELECT `no`, `username`, `fname`, `lname`, `licsenseplate`, `mailuser`, `password`, `phone`, `iden`, `vehicle` FROM `user_acc` WHERE username='$username';
";
$e = mysqli_query($con, $q);
if(mysqli_num_rows($e)>0)
{  $arr["success"] = "already";}
else{
$query = "INSERT INTO `user_acc`(`username`, `fname`, `lname`, `licsenseplate`, `mailuser`, `password`, `phone`, `iden`, `vehicle`) 
VALUES ('$username','$fname','$lname','$licsenseplate','$mailuser','$password','$phone','$iden','$vehicle')";



$arr = [];
$exe = mysqli_query($con, $query);
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}
}
print(json_encode($arr));
?>
