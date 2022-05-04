<?php
    define("PROJECT_ROOT_PATH", __DIR__."/../");

    if (!function_exists('str_ends_with')) {
        function str_ends_with(string $haystack, string $needle): bool
        {
            $needle_len = strlen($needle);
            return ($needle_len === 0 || 0 === substr_compare($haystack, $needle, - $needle_len));
        }
    }

    // Database Configuration
    require_once PROJECT_ROOT_PATH."/inc/config.php";

    // Base Controller
    require_once PROJECT_ROOT_PATH."/Controller/BaseController.php";

    // Models
    $path = PROJECT_ROOT_PATH."/Model";
    foreach(array_diff(scandir($path), array(",", "..")) as $file) {
        if(str_ends_with($file, "Model.php")) {
            require_once PROJECT_ROOT_PATH."/Model/".$file;
        }
    }
?>