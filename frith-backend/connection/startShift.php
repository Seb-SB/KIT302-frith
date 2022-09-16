<?php

//connect to db
require 'db_conn.php';
$json2 = file_get_contents('php://input');
//convert file contents to PHP object
$input = json_decode($json2, true);
$sql = "update shiftdetails set Status = '$input[Status]', TimeStarted = '$input[TimeStarted]' where ShiftID = '$input[ShiftID]'";

$res = mysqli_query($conn, $sql);
if(!$res) {
    die("Failed to insert" . $conn->connect_error);
}
mysqli_close($conn);
echo "Success";


?>