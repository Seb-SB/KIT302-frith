<?php
    class BaseController {
        public function __call($name, $args) {
            $this->sendOutput("", array("HTTP/1.1 404 Not Found"));
        }

        protected function getUriSegments() {
            $uri = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
            $uri = explode("/", $uri);

            return $uri;
        }

        protected function getQueryStringParams() {
            return parse_str($_SERVER["QUERY_STRING"], $query);
        }

        protected function sendOutput($data, $headers=array()) {
            header_remove("Set-Cookie");

            if(is_array($headers) && count($headers)) {
                foreach($headers as $header) {
                    header($header);
                }
                    
                echo $data;
                exit;
            }
        }

        protected function isValidRequest($request, $expected) {
             return strtoupper($request) == $expected;
        }

        protected function handleRequest($request, $func) {
            $errorDesc = "";

            if($this->isValidRequest($_SERVER["REQUEST_METHOD"], $request)) {
                try {
                    $response = $func();
                } catch(Error $e) {
                    $errorDesc = $e->getMessage();
                    $errorHeader = "HTTP/1.1 500 Internal Server Error";
                }
            } else {
                $errorDesc = "Method not supported";
                $errorHeader = "HTTP/1.1 422 Unprocessable Entity";
            }

            if(!$errorDesc) {
                $this->sendOutput($response, array("Content-Type: application/json", "HTTP/1.1 200 OK"));
            } else {
                $this->sendOutput(json_encode(array("error" => $errorDesc)), array("Content-Type: application/json", $errorHeader));
            }
        }
    }
?>