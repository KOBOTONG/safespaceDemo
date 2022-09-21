<?php
	include ("connected.php");
	$con=dbconnection();

if (isset($_POST["fname"])) {
	$fname=$_POST["fname"];
}
else return;
if (isset($_POST["lname"])) {
	$lname=$_POST["lname"];
}
else return;
if (isset($_POST["mailuser"])) {
	$mailuser=$_POST["mailuser"];
}
else return;

if (isset($_POST["password"])) {
	$password=$_POST["password"];
}
else return;

if (isset($_POST["phone"])) {
	$phone=$_POST["phone"];
}
else return;

$query = "INSERT INTO `user`(`fname`, `lname`, `mailuser`, `password`, `phone`) 
VALUES ('$fname','$lname','$mailuser','$password','$phone')";

$exe=mysqli_query($con,$query);

$arr=[];
if ($exe) {
	$arr["success"]="true";
}else{
	$arr["success"]="false";
}
print(json_encode($arr));
?>