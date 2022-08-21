<?php

$db = "frith";
$servername = "localhost";
$username = "root";
$password = "thisadmin";


$conn = new mysqli($servername, $username, $password, $db);

if ($conn->connect_error) {
    die("connection failed: " . $conn->connect_error);
}
//echo "Connected successfully";



?>