<?php

//connect to db
require 'db_conn.php';


$receieved = false;

$json["error"] = false;
$json["errmsg"] = "";
$json["errmsg1"] = "";
$json["errmsg2"] = "";

//$val = isset($POST_["Email"]) && isset($POST_["Password"]);
$json1 = file_get_contents('php://input');

//echo $json1;

$equals = "=";
$amp = "&";
$firstEqualsLocation = stripos($json1, $equals) + 1;
$secondEqualsLocation = strrpos($json1, $equals) + 1;
$firstAmpLocation = stripos($json1, $amp);

//$sub1 = substr($json1, $firstEqualsLocation, $firstAmpLocation);
$sub1 = substr($json1, $firstEqualsLocation, ($firstAmpLocation-$firstEqualsLocation));
$sub2 = substr($json1, $secondEqualsLocation);


//echo $sub1;
//echo $sub2;

///$json["email"] = $sub1;
///$json["password"] = $sub2;

if (empty($sub1)) {
    $json["errmsg1"] = "Did not get email";
} else {
    $email = urldecode($sub1);
    $receieved = true;
}

if (empty($sub2)) {
    $json["errmsg2"] = "Did not get password";
} else {
    $password = $sub2;
    $receieved = true;
}

/*
if (!isset($POST_["email"]))
{
    $json["errmsg1"] = "Did not get email";
} else {
    $email = $POST_["email"];
    $receieved = true;
}

if (!isset($POST_["password"]))
{
    $json["errmsg2"] = "Did not get password";
} else {
    $password = $POST_["password"];
    $receieved = true;
}*/

if($receieved) {

    //$email = mysqli_escape_string($conn, $email);
    //$password = mysqli_escape_string($conn, $password);
    
    $sql = "SELECT * FROM `accountsecurityguard` WHERE `EmailAddress`='$email' AND `Password`='$password';";
    $res = mysqli_query($conn, $sql);
    $numrows = mysqli_num_rows($res);
    
    //if table contains corresponding value
    if ($numrows > 0) {
        $json["Email"] = $email;
        $json["Password"] = $password;
        $json["error"] = false;
        $json["errmsg"] = "Success";
        
    } else {
        $json["error"] = true;
        $json["errmsg"] = "Invalid credentials.";
    }   

} else {
    $json["error"] = true;
    $json["errmsg"] = "Failure to connect";
}



mysqli_close($conn);

//tell browser that it is json data
header('Content-Type: application/json');

echo json_encode($json);
?>