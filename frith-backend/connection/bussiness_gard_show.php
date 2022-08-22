<?php

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$input = json_decode($json2, true);
$bussinessId = $_GET['bussinessId'];
echo $bussinessId;
$sql = "SELECT * FROM `shiftdetails` where 'BusinessID'='$bussinessId'";
$result = mysqli_query($conn, $sql);
$output_array = [];
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $output_array[] = array(
            'GuardKey' => $row['GuardKey'],
        );
        if ($output_array != null || count($output_array) == 0) {
            header('Content-Type: application/json');
            echo json_encode($output_array);
        }
        $condiction = '(';
        for ($i = 0; $i < count($output_array); $i++) {
            $condiction .= ',' ;
            $condiction .= $output_array[$i]['GuardKey'];
        }
        $condiction .= ')';
        echo $condiction;
        $sql2 = "select * from accountsecurityguard where 'GuardKey' in '$condiction'";
        $result = mysqli_query($conn, $sql2);
        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $output_array[] = array(
                    'GuardKey' => $row['GuardKey'],
                    'FirstName   ' => $row['FirstName'],
                    'LastName' => $row['LastName'],
                    'PhoneNumber' => $row['PhoneNumber'],
                    'EmailAddress' => $row['EmailAddress'],
                    'Password' => $row['Password']
                );
            }

        }
    }
}


mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($output_array)

?>