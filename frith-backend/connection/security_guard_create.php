<?php

//connect to db
require 'db_conn.php';


$json["error"] = false;
$json["message"] = "";
$json["testing"] = urldecode(file_get_contents('php://input'));

$json["testing"] = preg_split('/[&|=]/',$json["testing"], -1, PREG_SPLIT_NO_EMPTY);
$str = $json["testing"];



//$json["testing"] = $FirstName;


$val = isset($POST_["FirstName"]) && isset($POST_["LastName"]) && isset($POST_["Phone"]) && isset($POST_["Email"]) && isset($POST_["Password"]) && isset($POST_["UniqueKey"]);

if (!empty($str)) {
    //echo "test2";
    /*
    $FirstName = $POST_["FirstName"];
    $LastName = $POST_["LastName"];
    $Phone = $POST_["Phone"];
    $Email = $POST_["Email"];
    $Password = $POST_["Password"]; 
    $UniqueKey = $POST_["UniqueKey"];
    */
    $FirstName = $str[1];
    $LastName = $str[3];
    $Phone = $str[5];
    $Email = $str[7];
    $Password = $str[9];
    $UniqueKey = $str[11];

    $sql = "SELECT * FROM `firmuniquekey` WHERE `GuardKey`= '$UniqueKey';";
    $res = mysqli_query($conn, $sql);
    $numrows = mysqli_num_rows($res);

    //if table does not contain unique key
    if ($numrows == 0) {
        $json["error"] = true;
        $json["message"] = "Invalid Unique Key";
    } 
    
    if ($json["error"] == false) {
        //Sanitise data
        /*
        $FirstName = mysqli_escape_string($conn, $FirstName);
        $LastName = mysqli_escape_string($conn, $LastName);
        $Phone = mysqli_escape_string($conn, $Phone);
        $Email = mysqli_escape_string($conn, $Email);
        $Password = mysqli_escape_string($conn, $Password);
        $UniqueKey = mysqli_escape_string($conn, $UniqueKey);
        */
        $sql = "INSERT INTO `accountsecurityguard`(`GuardKey`, `FirstName`, `LastName`, `PhoneNumber`, `EmailAddress`, `Password`) VALUES ('$UniqueKey','$FirstName','$LastName','$Phone','$Email','$Password');";
        $res = mysqli_query($conn, $sql);

        if (!$res) {
            $json["error"] = true;
            $json["message"] = "Database error";
        } else {
            $json["message"] = "Success";
        }
    }


    

} else {
    $json["error"] = true;
    $json["message"] = "did not receive post values";
}
    mysqli_close($conn);
    header('Content-Type: application/json');
    echo json_encode($json);

?>