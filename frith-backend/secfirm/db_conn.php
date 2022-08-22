<?php

$db = "frith";
$servername = "localhost";
$username = "root";
$password = "123456";


$conn = new mysqli($servername, $username, $password, $db);

if ($conn->connect_error) {
    die("connection failed: " . $conn->connect_error);
}
//echo "Connected successfully";



?>