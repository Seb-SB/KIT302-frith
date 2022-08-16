<?php

//connect to db
require 'db_conn.php';


// $json["error"] = false;
// $json["message"] = "";
// $json["testing"] = urldecode(file_get_contents('php://input'));

// $json["testing"] = preg_split('/[&|=]/',$json["testing"], -1, PREG_SPLIT_NO_EMPTY);
// $str = $json["testing"];

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$data2 = json_decode($json2, true);


$received = false;
$json["error"] = false;
$json["errmsg"] = "";
if (empty($data2['GuardKey'])) {
    $received = false;

} else {
    $GuardKey = $data2['GuardKey'];
    $received = true;

}
if (empty($data2['TimeSubmitted'])) {
    $received = false;

} else {
    $TimeSubmitted = $data2['TimeSubmitted'];
    $received = true;

}
if (empty($data2['IncidentType'])) {
    $received = false;

} else {
    $IncidentType = $data2['IncidentType'];
    $received = true;
}

if (empty($data2['SpecificArea'])) {
    $received = false;

} else {
    $SpecificArea = $data2['SpecificArea'];
    $received = true;
}

if (empty($data2['Description'])) {
    $received = false;

} else {
    $Description = $data2['Description'];
    $received = true;
}


if ($received) {
    $ReportFiled = "Y";
    
    $sql = "SELECT `BusinessID` FROM `shiftdetails` WHERE `GuardKey`= '$GuardKey';";
    $res = mysqli_query($conn, $sql);
    if($res){
        while($row = mysqli_fetch_assoc($res)){
            $BusinessID = $row['BusinessID'];
        }
    }
    else {
        $json["error"] = false;
    }
    // if table does not contain unique key
    

    if ($json["error"] == false) {

        $sql = "INSERT INTO `incidentreport`(`GuardKey`,`BusinessID`, `TimeSubmitted`, `IncidentType`, `SpecificArea`, `Description`, `ReportFiled`) VALUES ('$GuardKey', '$BusinessID', '$TimeSubmitted','$IncidentType','$SpecificArea','$Description','$ReportFiled');";
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