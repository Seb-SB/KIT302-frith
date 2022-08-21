<?php 

//connect to db
require 'db_conn.php';

$json2 = file_get_contents('php://input');

//convert file contents to PHP object
$data2 = json_decode($json2, true);

$received = false;
$json["error"] = false;
$json["errmsg"] = "";

if (empty($data2['BusinessID'])) {
    $received = false;
} else {
    $BusinessID = $data2['BusinessID'];
    $received = true;
}

if (empty($data2['Severity'])) {
    $received = false;
} else {
    $Severity = $data2['Severity'];
    $received = true;
}

if (empty($data2['TimeSubmitted'])) {
    $received = false;
} else {
    $TimeSubmitted = $data2['TimeSubmitted'];
    $received = true;
}

if (empty($data2['EventTitle'])) {
    $received = false;
} else {
    $EventTitle = $data2['EventTitle'];
    $received = true;
}

if (empty($data2['NumPerpetrators'])) {
    $received = false;
} else {
    $NumPerpetrators = $data2['NumPerpetrators'];
    $received = true;
}

if (empty($data2['Description'])) {
    $received = false;
} else {
    $Description = $data2['Description'];
    $received = true;
}

if($received) {
    $sql_severity_level =  "SELECT * FROM `severitylevel` WHERE `Severity`='$Severity';";
    $result = mysqli_query($conn, $sql_severity_level);

    if($result) {
        while($row_levelid = mysqli_fetch_assoc($result)) {
            $levelID = $row_levelid['LevelID'];
        }
    }

    $sql = "INSERT INTO `eventdetails`(`BusinessID`, `LevelID`, `TimeSubmitted`, `EventTitle`, `NumPerpetrators`, `Description`) VALUES ('$BusinessID','$levelID','$TimeSubmitted','$EventTitle','$NumPerpetrators','$Description')";
    $res = mysqli_query($conn, $sql);

    if(!$res) {
        $json["error"] = true;
        $json["message"] = "SQL error";
    } else {
        $json["message"] = "Success";
    }

} else {
    $json["error"] = true;
    $json["message"] = "did not receive post values";
}


mysqli_close($conn);
header('Content-Type: application/json');
echo json_encode($json);


?>