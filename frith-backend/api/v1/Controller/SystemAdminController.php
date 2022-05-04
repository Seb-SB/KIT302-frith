<?php
    class SystemAdminController extends BaseController {

        public function loginAction() {
            $this->handleRequest("POST", function() {
                $model = new SystemAdminModel();

                if(!isset($_POST["json"]))
                    return "Input error";

                $json = json_decode(rawurldecode($_POST["json"]));

                $email = $json->{"email"};
                $password = $json->{"password"};

                return json_encode($model->validateCredentials($email, hash("sha256", $password)));
            });
        }
    }
?>