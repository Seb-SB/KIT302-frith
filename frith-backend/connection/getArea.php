<?php

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$data2 = json_decode($json2, true);
$bussinessId = $_GET['bussinessId'];
$sql =  "SELECT * FROM `guardablearea` where `BusinessID`='$bussinessId'";
$result = mysqli_query($conn, $sql);
if($result) {
    while($row = mysqli_fetch_assoc($result)) {
        $output_array[] = array(
            'AreaID' => $row['AreaID'],
            'BusinessID' => $row['BusinessID'],
            'AreaName' => $row['AreaName'],
        );
    }
}


mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($output_array)

?>