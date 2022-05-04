<?php
    class Database {
        protected $connection = null;

        public function __construct() {
            try {
                date_default_timezone_set("Australia/Hobart");
                $this->connection = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE_NAME);

                if(mysqli_connect_errno()) {
                    throw new Exception("Could not connect to the database.");
                }
            } catch(Exception $e) {
                throw new Exception($e->getMessage());
            }
        }

        public function select($query, $type = "", $params) {
            try {
                $stmt = $this->executeStatement($query, $type, $params);
                $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
                $stmt->close();

                return $result;
            } catch(Exception $e) {
                throw new Exception($e->getMessage());
            }
            return false;
        }

        public function insert($query, $type = "", $params) {
            try {
                $stmt = $this->executeStatement($query, $type, $params);
                return $this->connection->insert_id;
            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }
            return "-1";
        }

        public function update($query, $type = "", $params) {
            try {
                $stmt = $this->executeStatement($query, $type, $params);
                return "0";
            } catch(Exception $e) {
                throw new Exception($e->getMessage());
            }
            return "-1";
        }

        public function delete($query, $type = "", $params) {
            try {
                $stmt = $this->executeStatement($query, $type, $params);
                return "0";
            } catch(Exception $e) {
                throw new Exception($e->getMessage());
            }
            return "-1";
        }

        private function executeStatement($query, $type = "", $params) {
            try {
                $stmt = $this->connection->prepare($query);

                if($stmt == false) {
                    throw new Exception("Unable to execute prepared statement: ".$query);
                }

                if($type != "") {
                    if($params) {
                        $stmt->bind_param($type, ...$params);
                    }
                }

                $stmt->execute();

                return $stmt;
            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }
        }
    }
?>