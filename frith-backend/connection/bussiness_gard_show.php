<?php

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$input = json_decode($json2, true);
$bussinessId = $_GET['bussinessId'];
$sql = "SELECT * FROM `shiftdetails` where `BusinessID`='$bussinessId' AND `Status`='1'";
$result = mysqli_query($conn, $sql);
$out = (array) null;
if ($result) {
    while ($row1 = mysqli_fetch_assoc($result)) {
        $output_array[] = array(
            'GuardKey' => $row1['GuardKey'],
            'AreaID' => $row1['AreaID']
        );
        if ($output_array != null && count($output_array) == 0) {
            header('Content-Type: application/json');
            echo json_encode($output_array);
            return;
        }
        $condiction = '(';
        for ($i = 0; $i < count($output_array); $i++) {
            $condiction .= $output_array[$i]['GuardKey'];
            $condiction .= ',' ;
        }

        $condiction = substr($condiction,0,strlen($condiction) - 1);
        $condiction .= ')';
        $sql2 = "select * from `accountsecurityguard` where `GuardKey` in $condiction";
        $result = mysqli_query($conn, $sql2);
        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $out[] = array(
                    'ShiftID' => $row1['ShiftID'],
                    'GuardKey' => $row['GuardKey'],
                    'FirstName' => $row['FirstName'],
                    'LastName' => $row['LastName'],
                    'PhoneNumber' => $row['PhoneNumber'],
                    'EmailAddress' => $row['EmailAddress'],
                    'Password' => $row['Password'],
                    'Status' => $row1['Status'],
                );
            }
            for ($i = 0 ; $i < count($output_array) ; $i++){
                $areaId = $output_array[$i]['AreaID'];
                $sql2 = "select * from `guardablearea` where `AreaID` = $areaId";
                $result = mysqli_query($conn, $sql2);
                if ($result) {
                    while ($row1 = mysqli_fetch_assoc($result)){
                        $out[$i]['areaID'] = $row1['AreaID'];
                        $out[$i]['areaName'] = $row1['AreaName'];
                    }
                }
            }
        }
    }
}

mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($out);
?>