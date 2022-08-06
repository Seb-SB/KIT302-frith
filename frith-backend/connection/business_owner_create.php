<?php

//connect to db
require 'db_conn.php';

//handle recieved data in json format
$json1 = file_get_contents('php://input');

//convert file contents to PHP object
$data = json_decode($json1, true);


$received = false;
$json["error"] = false;
$json["errmsg"] = "";


//check if business name value has been received 
if (empty($data['BusinessName'])) {
    $received = false;
} else {
    $busName = $data['BusinessName'];
    $received = true;
}
//check if ABN value has been received 
if (empty($data['ABN'])) {
    $received = false;
} else {
    $ABN = $data['ABN'];
    $received = true;
}
//check if phone number value has been received 
if (empty($data['PhoneNumber'])) {
    $received = false;
} else {
    $busPhoneNumber = $data['PhoneNumber'];
    $received = true;
}


//check if email value has been received 
if (empty($data['EmailAddress'])) {
    $received = false;
} else {
    $busEmail = $data['EmailAddress'];
    $received = true;
}

//check if password value has been received 
if (empty($data['Password'])) {
    $received = false;
} else {
    $busPassword = $data['Password'];
    $received = true;
}

//check if manager first name value has been received 
if (empty($data['ManagerFirstName'])) {
    $received = false;
} else {
    $busFirstName = $data['ManagerFirstName'];
    $received = true;
}

//check if manager last name value has been received 
if (empty($data['ManagerLastName'])) {
    $received = false;
} else {
    $busLastName = $data['ManagerLastName'];
    $received = true;
}

//if all values were received
if($received){


    //TODO: Check with database setup -> how to add business account

    $sql = "INSERT INTO `accountbusinessowner`(`BusinessName`, `ABN`, `PhoneNumber`, `EmailAddress`, `Password`, `ManagerFirstName`, `ManagerLastName`) VALUES ('$busName','$ABN','$busPhoneNumber','$busEmail','$busPassword','$busFirstName','$busLastName');";
    $res = mysqli_query($conn, $sql);
    
    if (!$res) {
        $json["error"] = true;
        $json["message"] = "Database error";
    } else {
        $json["message"] = "Success";
    }
} else {
    $json["error"] = true;
    $json["message"] = "did not receive post values";
}

mysqli_close($conn);
//tell browser that it is json data
header('Content-Type: application/json');

echo json_encode($json);

?>
