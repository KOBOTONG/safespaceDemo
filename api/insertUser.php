<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {			
		$fname = $_GET['fname'];
		$lname = $_GET['lname'];
		$mailuser = $_GET['mailuser'];
		$password = $_GET['password'];
		$phone = $_GET['phone'];
		
							
		$sql = "INSERT INTO `user`(`id`, `fname`, `lname`, `mailuser`, `password`, `phone`) VALUES (Null,'$fname','$lname','$mailuser','$password','$phone')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome";
   
}
	mysqli_close($link);
?>