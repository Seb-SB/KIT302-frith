<?php

//connect to db
require 'db_conn.php';

$reportID = "";
$guardKey = "1";
$businessID = "25";
$timeSubmitted = "2022-08-07 10:23:11";
$incidentType = "Low";
$specArea = "Bar";
$Description = "test";
$ReportFiled = "Y";

$sql = "INSERT INTO `incidentreport`(`reportID`,`GuardKey`,`BusinessID`, `TimeSubmitted`, `IncidentType`, `SpecificArea`, `Description`, `ReportFiled`) VALUES ('$reportID', '$GuardKey', '$BusinessID', '$TimeSubmitted','$IncidentType','$SpecificArea','$Description','$ReportFiled');";
        
$res = mysqli_query($conn, $sql);

mysqli_close($conn);
?>