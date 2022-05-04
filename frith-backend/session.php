<?php
    session_start();

    if(!isset($_SESSION["id"])) {
        $_SESSION["id"] = "";
        $_SESSION["email"] = "";
    }

    $session_id = $_SESSION["id"];
    $session_email = $_SESSION["email"];
?>