<?php 



?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Security Firm</title>

        <!--Google Fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Domine&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

        <!--Latest compiled and minified CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!--jQuery library-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--Bootstrap Icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <!--Popper JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!--Latest compiled JavaScript-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>
        <main class="d-flex align-items-center vh-100">
            <div class="container text-center w-25">
                <h2 class="font-weight-bold">Project Frith</h2>
                <h4 class="font-weight-bold mb-3">Security Firm</h4>
                <div class="d-flex justify-content-center text-danger mb-1" id="results"></div> 
                <?php
                    if(isset($_GET['error']) == true) {
                        echo '<p align="center" style="color:red">Username/Password is invalid</p>';
                    }
                ?>
                <form id="loginForm" action="login_process.php" method="post">
                    <div class="form-group">
                        <input type="email" class="form-control form-control-lg mb-3" name="email" placeholder="Email address" required>
                        <input type="password" class="form-control form-control-lg mb-3" name="password" placeholder="Password" required>

                        <button type="submit" id="login-btn" class="btn btn-lg btn-block btn-success">Login</button>
                    </div>
                </form>
                <p>Need an account? <a href="register.php">Register for an account</a></p>
            </div>
        </main>
    </body>

</html>