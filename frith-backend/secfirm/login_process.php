<?php 
include 'db_conn.php';

include("../session.php");

$email = $_POST['email'];
$password = $_POST['password'];
$error = "";

$email = stripcslashes($email);
$password = stripcslashes($password);
$password = md5($password, $binary = false);


$sql = "select * from accountsecurityfirm where EmailAddress = '$email' and Password = '$password'";
$result = mysqli_query($conn,$sql);
$row = mysqli_fetch_array($result);
if ($row['EmailAddress'] == $email && $row['Password'] == $password) {
    $_SESSION['EmailAddress'] = $email;
    $_SESSION['Password'] = $password;
    header("Location: security_firm_dashboard.php");

    
}else {
    header("Location: login.php?error=1");
}

?>