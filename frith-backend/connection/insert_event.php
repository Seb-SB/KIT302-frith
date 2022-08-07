<?php

//connect to db
require 'db_conn.php';

$sql = "INSERT INTO `eventdetails` (`EventID`, `BusinessID`, `LevelID`, `TimeSubmitted`, `EventTitle`, `NumPerpetrators`, `Description`) VALUES (NULL, '31', 'M', '2022-08-07 05:35:58.000000', 'Testing 5', '4', 'This happened!')";
$res = mysqli_query($conn, $sql);

if(!$res) {
    die("Failed to insert" . $conn->connect_error);
}

echo "Success";

mysqli_close($conn);

?>