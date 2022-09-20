<?php

//connect to db
require 'db_conn.php';
$json2 = file_get_contents('php://input');
//convert file contents to PHP object
$input = json_decode($json2, true);
$sql = "INSERT INTO shiftdetails SET Status = '1', TimeStarted = '$input[TimeStarted]', GuardKey = (SELECT GuardKey FROM accountsecurityguard WHERE GuardKey = '$input[GuardKey]'), BusinessID = (SELECT BusinessID FROM accountbusinessowner WHERE BusinessID = '$input[BusinessID]'), AreaID = (SELECT AreaID FROM guardablearea WHERE AreaID = '$input[AreaID]')";

$res = mysqli_query($conn, $sql);
if(!$res) {
    die("Failed to insert" . $conn->connect_error);
}
mysqli_close($conn);
echo "Success";


?>