<?php
    require __DIR__."/inc/bootstrap.php";

    $uri = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
    $uri = substr($uri, strpos($uri, "dispatcher.php"));
    $uri = explode("/", $uri);

    if(!isset($uri[1]) || !isset($uri[2])) {
        header("HTTP/1.1 404 Not Found");
        exit();
    } else {
        switch($uri[1]) {
            // System Administrator Endpoint
            case "sysadmin":
                require PROJECT_ROOT_PATH."/Controller/SystemAdminController.php";
                
                buildController(new SystemAdminController(), $uri[2]);
                break;

            // Security Firm Endpoint
            case "secfirm":
                require PROJECT_ROOT_PATH."/Controller/SecurityFirmController.php";
                
                buildController(new SecurityFirmController(), $uri[2]);
                break;
                
            default:
                $data = json_encode(array("error" => "Method not supported"));
                $headers = array("Content-Type: application/json", "HTTP/1.1 422 Unprocessable Entity");
                header_remove("Set-Cookie");

                foreach($headers as $header) {
                    header($header);
                }

                echo $data;
                exit();
                break;
        }
    }

    function buildController($controller, $call) {
        $function = $call . "Action";
        $controller->{$function}();
    }
?>