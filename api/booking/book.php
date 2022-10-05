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
				
		$usernamebook = $_GET['usernamebook'];
		$fnamebook = $_GET['fnamebook'];
		$lnamebook = $_GET['lnamebook'];
		$licsenbook = $_GET['licsenbook'];
		$stmonth = $_GET['stmonth'];
		$styear = $_GET['styear'];
		$tomonth = $_GET['tomonth'];
        $toyear = $_GET['toyear'];
        $resultmy = $_GET['resultmy'];

		$sql = "INSERT INTO `booking`(`nobook`,`usernamebook`, `fnamebook`, `lnamebook`, `licsenbook`, `stmonth`, `styear`, `tomonth`, `toyear`, `resultmy`)
 VALUES (Null , '$usernamebook','$fnamebook','$lnamebook','$licsenbook','$stmonth','$styear','$tomonth','$toyear','$resultmy')";

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