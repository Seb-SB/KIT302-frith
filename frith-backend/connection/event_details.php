<?php

//connect to db
require 'db_conn.php';

//testing -> grab all values from eventdetails table
$sql = "SELECT * FROM `eventdetails`;";
$res = mysqli_query($conn, $sql);
$row_number = mysqli_num_rows($res);

$output_array = array();

if($row_number == 0) {
    $json["error"] = true;
    $json["errmsg"] = "Empty table";
} else {
    while($row = mysqli_fetch_assoc($res)){

        $severity_colour = $row['LevelID'];
        $sql_colour = "SELECT * FROM `severitylevel` WHERE `LevelID`='$severity_colour';";
        $result = mysqli_query($conn, $sql_colour);

        while($row_colour = mysqli_fetch_assoc($result)) {
            
            $event_colour = $row_colour['Colour'];
        }
        
        $output_array[] = array(
            'businessID' => $row['BusinessID'],
            'dateTime' => $row['TimeSubmitted'],
            'eventDescription' => $row['Description'],
            'eventTitle' => $row['EventTitle'],
            'numberOfPerpetrators' => $row['NumPerpetrators'],
            'levelID' => $row['LevelID'],
            'eventColour' => $event_colour
        );

        /*
        $json["businessID"] = $row['BusinessID'];
        $json["dateTime"] = $row['TimeSubmitted'];
        $json["eventDescription"] = $row['Description'];
        $json["eventTitle"] = $row['EventTitle'];
        $json["numberOfPerpetrators"] = $row['NumPerpetrators'];
        $json["levelID"] = $row['LevelID'];
        $json["eventColour"] = $event_colour;  
        */
    }
}
header('Content-Type: application/json');

echo json_encode($output_array);
mysqli_close($conn);

?>