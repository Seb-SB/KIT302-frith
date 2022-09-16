<?php

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$data2 = json_decode($json2, true);
    $sql =  "SELECT * FROM `shiftdetails`";
    $result = mysqli_query($conn, $sql);
    if($result) {
        while($row = mysqli_fetch_assoc($result)) {
            $output_array[] = array(
                'ShiftID' => $row['ShiftID'],
                'GuardKey' => $row['GuardKey'],
                'BusinessID' => $row['BusinessID'],
                'AreaID' => $row['AreaID'],
                'TimeStarted' => $row['TimeStarted'],
                'Status' => $row['Status']
            );
        }
    }


mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($output_array)

?>