<?php

//connect to db
require 'db_conn.php';

$reportID = "";
$guardKey = "";
$businessID = "";
$incidentType = "";
$specArea = "";
$Description = "";
$PartiesInvolved = "";
$Witnesses = "";
$ReportFiled = "";

$sql = "INSERT INTO `incidentreport` (`ReportID`, `GuardKey`, `BusinessID`, `IncidentType`, `SpecificArea`, `Description`, `PartiesInvolved`, `Witnesses`, `ReportFiled`) VALUES (NULL, '113', '1', 'bad', 'place', 'this is a test', 'many', 'manyu', 'Y');
";
$res = mysqli_query($conn, $sql);

mysqli_close($conn);
?>