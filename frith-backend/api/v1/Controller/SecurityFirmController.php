<?php
    class SecurityFirmController extends BaseController {

        public function createAction() {
            $this->handleRequest("POST", function() {
                $model = new SecurityFirmModel();

                if(!isset($_POST["json"]))
                    return "Input error";

                $json = json_decode($_POST["json"]);

                $firmname = $json->{"firmname"};
                $abn = $json->{"abn"};
                $email = $json->{"email"};
                $phone = $json->{"phone"};
                $fname = $json->{"fname"};
                $lname = $json->{"lname"};

                return $model->createAccount($firmname, $abn, $email, $phone, $fname, $lname);
            });
        }

        public function loginAction() {
            $this->handleRequest("POST", function() {
                $model = new SecurityFirmModel();

                if(!isset($_POST["json"]))
                    return "Input error";

                $json = json_decode($_POST["json"]);

                $email = $json->{"email"};
                $password = $json->{"password"};

                return json_encode($model->validateCredentials($email, hash("sha256", $password)));
            });
        }
    }
?>