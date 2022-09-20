<?php

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$data2 = json_decode($json2, true);
    $sql =  "SELECT * FROM `accountbusinessowner`";
    $result = mysqli_query($conn, $sql);
    if($result) {
        while($row = mysqli_fetch_assoc($result)) {
            $output_array[] = array(
                'businessID' => $row['BusinessID'],
                'StatusID   ' => $row['StatusID'],
                'PoolID' => $row['PoolID'],
                'BusinessName' => $row['BusinessName'],
                'ABN' => $row['ABN'],
                'EmailAddress' => $row['EmailAddress'],
                'Password' => $row['Password'],
                'ManagerFirstName' => $row['ManagerFirstName'],
                'ManagerLastName' => $row['ManagerLastName'],
                'PhoneNumber' => $row['PhoneNumber']
            );
        }
    }


mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($output_array)

?>