<?php
error_reporting(E_ERROR | E_PARSE);

// Response object structure
$response = new stdClass;
$response->status = null;
$response->message = null;

// Uploading file
$destination_dir = "Imageuserdata/";
$base_filename = basename($_FILES["fileVehi"]["name"]);
$target_file = $destination_dir . $base_filename;

if(!$_FILES["fileVehi"]["error"])
{
    if (move_uploaded_file($_FILES["fileVehi"]["tmp_name"], $target_file)) {        
        $response->status = true;
        $response->message = "File uploaded successfully";

    } else {

        $response->status = false;
        $response->message = "File uploading failed";
    }    
} 
else
{
    $response->status = false;
    $response->message = "File uploading failed";
}

header('Content-Type: application/json');
echo json_encode($response);