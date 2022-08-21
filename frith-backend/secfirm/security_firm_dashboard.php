<?php 
    include("../session.php");

    if($_SESSION["email"] !== "") {
        header("location:index.php");
    }

    // echo '<pre>';
    // var_dump($_SESSION);
    // echo '</pre>';

?>

<!DOCTYPE html>
<html>
<head>
<title>Security Firm Dashboard</title>
<link rel="stylesheet" href="css/homepage.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body >
<div class="topnav">
    <div class="topnav-right">
        <a href="logout.php">Logout</a>
    </div>
  </div>
</div>
<div class="container">
   <br />
   <!-- this starts the body for Security Key list -->
   <h3 align="center">Security Key List</h3>
   <div class="row">
    <div class="col-md-12">
        <div class="panel-body">
            <!-- this panel includes the table body -->
            <?php 
                include "db_conn.php";

                if(isset( $_SESSION["EmailAddress"])) {
                    //echo $_SESSION["EmailAddress"];
                    $email = $_SESSION["EmailAddress"];
                }

                $sql_firmid = "SELECT * FROM `accountsecurityfirm` WHERE `EmailAddress`='$email';";
                $res = mysqli_query($conn,$sql_firmid);
        
                if($res) {
                    while($row_firm_id = mysqli_fetch_assoc($res)) {
                        $firm_id = $row_firm_id['FirmID'];
                    }
                }

                $query = "SELECT * FROM `firmuniquekey` WHERE `FIRMID`='$firm_id'";
                $result = mysqli_query($conn,$query);
            ?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <!-- Iframe is hidden, main purpose is for page to stay in key list page after sumbmitting the form -->
                        <iframe name="hiddenFrame" class="hide"></iframe> 
                        <!-- form for generating new key, onsubmit refreshes the page after submitting it -->
                        <form onsubmit="setTimeout(function(){window.location.reload();},10);" action="generate_key.php" method="post" target="hiddenFrame" >
                            <input type="submit" name="newKey" value="Generate a new key">
                        </form>
                        <!-- table starts  -->
                        <tr>
                            <th>Guard Key</th>
                            <th>Date Created</th>
                        </tr>
                        </thead> 
                        <?php while($row = mysqli_fetch_array($result)){ ?>
                            <tr data-id='<?php echo $row['GuardKey']; ?>' class="keyinfo">
                                <td><?php echo $row['GuardKey']; ?></td>
                                <td><?php echo $row['DateKey'];?></td>
                            </tr>
                        <?php } ?>
                </table>
            </div>
        </div>    
    </div>    
    </div>
</div>    
<div class="container">
   <br />
   <!-- BODY FOR SECURITY GUARD USER LIST -->
   <h3 align="center">Security Guard Account List</h3>
   <div class="row">
    <div class="col-md-12">
        <div class="panel-body">
            <?php 
                include "db_conn.php";

                //include("../session.php");

                if(isset( $_SESSION["EmailAddress"])) {
                    //echo $_SESSION["EmailAddress"];
                    $email = $_SESSION["EmailAddress"];
                }

                

                $query = "select * from accountsecurityguard";
                $result = mysqli_query($conn,$query);
            ?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Last Name</th>
                            <th>First Name</th>
                            <th>Email Address</th>
                        </tr>
                        </thead> 
                        <?php while($row = mysqli_fetch_array($result)){ ?>
                            <tr data-id='<?php echo $row['GuardKey']; ?>' class="userinfo">
                                <td><?php echo $row['LastName']; ?></td>
                                <td><?php echo $row['FirstName']; ?></td>
                                <td><?php echo $row['EmailAddress']; ?></td>
                            </tr>
                        <?php } ?>
                </table>
            </div>
        </div>    
    </div>    
    </div>
</div>    


<!-- Business List View -->
<div class="container">
    <br />
    <!-- BODY FOR Business List View -->
    <h3 align="center">Assigned Businesses</h3>
    <div class="row">
    <div class="col-md-12">
        <div class="panel-body">
            <?php 
                include "db_conn.php";

                if(isset( $_SESSION["EmailAddress"])) {
                    //echo $_SESSION["EmailAddress"];
                    $email = $_SESSION["EmailAddress"];
                }

                

                $query = "SELECT * FROM `accountbusinessowner` ORDER BY `BusinessName` ASC;";
                $result = mysqli_query($conn,$query);
            ?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Business Name</th>
                            <th>Contact Number</th>
                        </tr>
                        </thead> 
                        <?php while($row = mysqli_fetch_array($result)){ ?>
                            <tr data-id='<?php echo $row['BusinessID']; ?>' class="BusinessInfo"> <!-- WORK OUT THIS-->
                                <td><?php echo $row['BusinessName']; ?></td>
                                <td><?php echo $row['PhoneNumber']; ?></td> 
                            </tr>
                        <?php } ?>
                </table>
            </div>
        </div>    
    </div>    
    </div>                         


</div>
        

<!-- SCRIPT FOR THIS PAGE -->
<script type='text/javascript'>
            // this opens up the pop up window for key list using AJAX
            //when user click the row with class key info, it assigns the index and pass 
            //the input to the url provided
            $(document).ready(function(){
                $('.keyinfo').click(function(){
                    var userid = $(this).data('id');
                    $.ajax({
                        url: 'key_info.php',
                        type: 'post',
                        data: {userid: userid},
                        success: function(response){ 
                            $('.modal-body').html(response); 
                            $('#empModal').modal('show'); 
                        }
                    });
                });
            });
            </script>
        </div>
         <!-- modap pop up window body -->
        <div class="modal fade" id="empModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Security Guard Info</h4>
                          <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
        </div>
            
<script type='text/javascript'>
    // this opens up the pop up window for key list using AJAX
    //when user click the row with class key info, it assigns the index and pass 
    //the input to the url provided
            $(document).ready(function(){
                $('.userinfo').click(function(){
                    var userid = $(this).data('id');
                    $.ajax({
                        url: 'security_info.php',
                        type: 'post',
                        data: {userid: userid},
                        success: function(response){ 
                            $('.modal-body').html(response); 
                            $('#empModal').modal('show'); 
                        }
                    });
                });
            });
            </script>
        </div>
        <!-- modap pop up window body -->
        <div class="modal fade" id="empModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Security Guard Info</h4>
                          <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
        </div>
    </body>
</html>

<!-- Populate modal with business info -->
<script type='text/javascript'>
    // this opens up the pop up window for key list using AJAX
    //when user click the row with class key info, it assigns the index and pass 
    //the input to the url provided
            $(document).ready(function(){
                $('.BusinessInfo').click(function(){
                    var userid = $(this).data('id');
                    $.ajax({
                        url: 'business_info.php',
                        type: 'post',
                        data: {userid: userid},
                        success: function(response){ 
                            $('.modal-body').html(response); 
                            $('#empModalBus').modal('show'); 
                        }
                    });
                });
            });
            </script>
        </div>
        <!-- modap pop up window body -->
        <div class="modal fade" id="empModalBus" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Business Details</h4>
                          <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
        </div>
    </body>
</html>