<?php
    $password = "testing";

    //$hashed_password = password_hash($password, PASSWORD_BCRYPT);
    $hashed_password = md5($password, $binary = false);
    //$hashed_password = CRYPT_SHA256($password, );
    //echo $hashed_password;

    echo phpversion();

?>