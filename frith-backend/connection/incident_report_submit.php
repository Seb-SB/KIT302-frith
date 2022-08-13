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
if (empty($data['GuardKey'])) {
    $received = false;
    print("No GuardKey");
} else {
    $GuardKey = $data['GuardKey'];
    $received = true;
    print("Guard Key " + $GuardKey);
}
if (empty($data['TimeSubmitted'])) {
    $received = false;
    print("No TimeSubmitted");
} else {
    $TimeSubmitted = $data['TimeSubmitted'];
    $received = true;
    print("Time " + $TimeSubmitted);
}
if (empty($data['IncidentType'])) {
    $received = false;
    print("No IncidentType");
} else {
    $IncidentType = $data['IncidentType'];
    $received = true;
    print("IncidentType " + $IncidentType);
}

if (empty($data['SpecificArea'])) {
    $received = false;
    print("No SpecificArea");
} else {
    $SpecificArea = $data['SpecificArea'];
    $received = true;
    print("SpecificArea " + $SpecificArea);
}

if (empty($data['Description'])) {
    $received = false;
    print("No Description");
} else {
    $Description = $data['Description'];
    $received = true;
    print("Description " + $Description);
}
//check if PartiesInvolved value has been received 
if (empty($data['PartiesInvolved'])) {
    $received = false;
    print("No PartiesInvolved");
} else {
    $PartiesInvolved = $data['PartiesInvolved'];
    $received = true;
    print("PartiesInvolved " + $PartiesInvolved);
}
//check if Witnesses value has been received 
if (empty($data['Witnesses'])) {
    $received = false;
    print("No Witnesses");
} else {
    $Witnesses = $data['Witnesses'];
    $received = true;
    print("Witnesses " + $Witnesses);
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