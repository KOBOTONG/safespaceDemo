
<?php
	include 'conka.php';
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
				
		$username = $_GET['username'];
		$fname = $_GET['fname'];
		$lname = $_GET['lname'];
		$licsenseplate = $_GET['licsenseplate'];
		$mailuser= $_GET['mailuser'];
		$passuser = $_GET['passuser'];
		$phone = $_GET['phone'];
		$iden = $_GET['iden'];
		$vehicle= $_GET['vehicle'];
		
							
		$sql = "INSERT INTO `acc_user`(`no`,`username`, `fname`, `lname`, `licsenseplate`, `mailuser`, `passuser`, `phone`, `iden`, `vehicle`) 
        VALUES (NULL,'$username','$fname','$lname','$licsenseplate','$mailuser','$passuser','$phone','$iden','$vehicle')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";
   
}
	mysqli_close($link);
?>
