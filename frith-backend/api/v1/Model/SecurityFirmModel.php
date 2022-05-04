<?php
    require_once PROJECT_ROOT_PATH . "/Model/Database.php";

    class SecurityFirmModel extends Database {
        public function createAccount($firmname, $abn, $email, $phone, $fname, $lname) {
            $result = $this->insert(
                "INSERT INTO AccountSecurityFirm (StatusID, FirmName, ABN, EmailAddress, PhoneNumber, ManagerFirstName, ManagerLastName, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", 
                "ssssssss", 
                ["Pending", $firmname, $abn, $email, $phone, $fname, $lname, "_"]
            );
            
            return $result;
        }

        public function validateCredentials($email, $password) {
            $rows = $this->select("SELECT StatusID, FirmName FROM AccountSecurityFirm WHERE EmailAddress LIKE ? AND Password LIKE ?", "ss", [$email, $password]);
            return empty($rows) ? "false" : $rows[0];
        }
    }
?>