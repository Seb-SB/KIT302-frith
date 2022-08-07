<?php

//connect to db
require 'db_conn.php';


// $json["error"] = false;
// $json["message"] = "";
// $json["testing"] = urldecode(file_get_contents('php://input'));

// $json["testing"] = preg_split('/[&|=]/',$json["testing"], -1, PREG_SPLIT_NO_EMPTY);
// $str = $json["testing"];

$json1 = file_get_contents('php://input');

//convert file contents to PHP object
$data = json_decode($json1, true);


$received = false;
$json["error"] = false;
$json["errmsg"] = "";

if (empty($data['TimeSubmitted'])) {
    $received = false;
} else {
    $TimeSubmitted = $data['TimeSubmitted'];
    $received = true;
}
if (empty($data['IncidentType'])) {
    $received = false;
} else {
    $IncidentType = $data['IncidentType'];
    $received = true;
}
//check if ABN value has been received 
if (empty($data['SpecificArea'])) {
    $received = false;
} else {
    $SpecificArea = $data['SpecificArea'];
    $received = true;
}
//check if phone number value has been received 
if (empty($data['Description'])) {
    $received = false;
} else {
    $Description = $data['Description'];
    $received = true;
}
//check if PartiesInvolved value has been received 
if (empty($data['PartiesInvolved'])) {
    $received = false;
} else {
    $PartiesInvolved = $data['PartiesInvolved'];
    $received = true;
}
//check if Witnesses value has been received 
if (empty($data['Witnesses'])) {
    $received = false;
} else {
    $Witnesses = $data['Witnesses'];
    $received = true;
}


if ($received) {
    $ReportFiled = "y";
    //$sql = "SELECT * FROM `incidentreport` WHERE `GuardKey`= '$UniqueKey';";
    //$res = mysqli_query($conn, $sql);
    //$numrows = mysqli_num_rows($res);

    //if table does not contain unique key
    // if ($numrows == 0) {
    //     $json["error"] = true;
    //     $json["message"] = "Invalid Unique Key";
    // }

    // if ($json["error"] == false) {

        $sql = "INSERT INTO `incidentreport`(`TimeSubmitted`, `IncidentType`, `SpecificArea`, `Description`, `PartiesInvolved`, `Witnesses`, `ReportFiled`) VALUES ('$TimeSubmitted','$IncidentType','$SpecificArea','$Description','$Witnesses','$ReportFiled');";
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