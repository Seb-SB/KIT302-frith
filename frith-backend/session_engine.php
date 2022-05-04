<?php
    include("session.php");

    if(isset($_POST["action"])) {
        switch($_POST["action"]) {
            case "login":
                $id = $_POST["id"];
                $email = $_POST["email"];

                $session_id = $id;
                $session_email = $email;

                $_SESSION["id"] = $session_id;
                $_SESSION["email"] = $session_email;
                break;
            case "logout":
                session_destroy();
                header("index.php");
                break;
            default:
                break;
        }
    }
?>