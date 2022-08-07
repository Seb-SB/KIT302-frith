<?php

//connect to db
require 'db_conn.php';

$json1 = file_get_contents('php://input');

//convert file contents to PHP object
$data = json_decode($json1, true);


$received = false;
$json["error"] = false;
$json["errmsg"] = "";

if (empty($data['TitleSubmitted'])) {
    $received = false;
} else {
    $TitleSubmitted = $data['TitleSubmitted'];
    $received = true;
}
//check if phone number value has been received 
if (empty($data['Details'])) {
    $received = false;
} else {
    $Description = $data['Details'];
    $received = true;
}


if ($received) {
    $ReportFiled = "y";
  

        $sql = "INSERT INTO `notepad`(`TitleSubmitted`,  `Details`) VALUES ('$TitleSubmitted','$Details');";
        $res = mysqli_query($conn, $sql);

        if (!$res) {
            $json["error"] = true;
            $json["message"] = "Database error";
        } else {
            $json["message"] = "Success";
        }
    //}




} else {
    $json["error"] = true;
    $json["message"] = "did not receive post values";
}
    mysqli_close($conn);
    header('Content-Type: application/json');
    echo json_encode($json);

?>
