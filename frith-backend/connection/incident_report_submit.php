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
    print("No GuardKey");
} else {
    $GuardKey = $data2['GuardKey'];
    $received = true;
    print("Guard Key ");
    print($GuardKey);
}
if (empty($data2['TimeSubmitted'])) {
    $received = false;
    print("No TimeSubmitted");
} else {
    $TimeSubmitted = $data2['TimeSubmitted'];
    $received = true;
    print("Time " + $TimeSubmitted);
    print($TimeSubmitted);
}
if (empty($data2['IncidentType'])) {
    $received = false;
    print("No IncidentType");
} else {
    $IncidentType = $data2['IncidentType'];
    $received = true;
    print("IncidentType ");
    print($IncidentType);
}

if (empty($data2['SpecificArea'])) {
    $received = false;
    print("No SpecificArea");
} else {
    $SpecificArea = $data2['SpecificArea'];
    $received = true;
    print("SpecificArea ");
    print($SpecificArea);
}

if (empty($data2['Description'])) {
    $received = false;
    print("No Description");
} else {
    $Description = $data2['Description'];
    $received = true;
    print("Description ");
    print($Description);
}


if ($received) {
    $ReportFiled = "Y";
    $BusinessID = 25;
    //$sql = "SELECT * FROM `incidentreport` WHERE `GuardKey`= '$UniqueKey';";
    //$res = mysqli_query($conn, $sql);
    //$numrows = mysqli_num_rows($res);

    //if table does not contain unique key
    // if ($numrows == 0) {
    //     $json["error"] = true;
    //     $json["message"] = "Invalid Unique Key";
    // }

    // if ($json["error"] == false) {

        $sql = "INSERT INTO `incidentreport`(`GuardKey`,`BusinessID`, `TimeSubmitted`, `IncidentType`, `SpecificArea`, `Description`, `ReportFiled`) VALUES ('$GuardKey', '$BusinessID', '$TimeSubmitted','$IncidentType','$SpecificArea','$Description','$ReportFiled');";
        $res = mysqli_query($conn, $sql);

        if (!$res) {
            $json["error"] = true;
            $json["message"] = "Database error";
        } else {
            $json["message"] = "Success";
        }
    //}




} else {
    $json["error"] = true;
    $json["message"] = "did not receive post values";
}
    mysqli_close($conn);
    header('Content-Type: application/json');
    echo json_encode($json);

?>