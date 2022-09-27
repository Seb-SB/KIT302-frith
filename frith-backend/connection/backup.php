<?php

//connect to db
require 'db_conn.php';

//handle recieved data in json format
$json1 = file_get_contents('php://input');

//convert file contents to PHP object
$data = json_decode($json1, true);

$receieved = false;

$json["error"] = false;

//check if email value has been received 
// if (empty($data['email'])) {
//     $json["errmsg1"] = "Did not get email";
// } else {
//     $email = $data['email'];
//     $received = true;
// }

// //check if password value has been received 
// if (empty($data['password'])) {
//     $json["errmsg2"] = "Did not get password";
// } else {
//     $password = $data['password'];
//     $received = true;
// }


if($data['name']) {
	$json1 = file_get_contents('php://input');

//convert file contents to PHP object
   $data = json_decode($json1, true);

    $name=$data['name'];
    $location=$data['location'];
    $times=date('y-m-d');
    $sql="INSERT INTO `backupdetails`(`location`,`Time`) VALUES ('$location','$times')";
    
    $res =mysqli_query($conn, $sql);
   
    //$numrows = mysqli_num_rows($res);
    
    if(! $res) {
        $json["error"] = true;
        $json["errmsg"] = "Invalid credentials。$name";
    } else {

       
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