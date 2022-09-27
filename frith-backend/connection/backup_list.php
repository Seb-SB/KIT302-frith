<?php

//connect to db
require 'db_conn.php';

//handle recieved data in json format
$json1 = file_get_contents('php://input');

//convert file contents to PHP object
$data = json_decode($json1, true);

$receieved = false;

$json["error"] = false;

    
    $sql="SELECT * FROM `backupdetails`";
    
    $res =mysqli_query($conn, $sql);
    
    
    //$numrows = mysqli_num_rows($res);
    while($row = $res->fetch_assoc())
{
    $data[] = $row;
}

    if(! $res) {
        $json["error"] = true;
        $json["errmsg"] = "Invalid credentials。$name";
    } else {

       
    }

$json["arr"]=$data;


mysqli_close($conn);

//tell browser that it is json data
header('Content-Type: application/json');

echo json_encode($json);


?>