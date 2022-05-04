<?php
    require_once PROJECT_ROOT_PATH . "/Model/Database.php";

    class SystemAdminModel extends Database {

        public function validateCredentials($email, $password) {
            $rows = $this->select("SELECT AdministratorID FROM AccountSystemAdministrator WHERE EmailAddress LIKE ? AND Password LIKE ?", "ss", [$email, $password]);
            return empty($rows) ? "false" : $rows[0];
        }
    }
?>