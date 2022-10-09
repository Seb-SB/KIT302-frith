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

<!-- Incident Report View -->
<div class="container">
    <br />
    <!-- BODY FOR Incident Report View -->
    <h3 align="center">Incident Reports</h3>
    <div class="row">
    <div class="col-md-12">
        <div class="panel-body">
            <?php 
                include "db_conn.php";

                if(isset( $_SESSION["EmailAddress"])) {
                    //echo $_SESSION["EmailAddress"];
                    $email = $_SESSION["EmailAddress"];
                }

                //todo:
                //get firmID > guard keys from `firmuniquekey` > grab all associated incident reports 

                $firm_query = "SELECT * FROM `accountsecurityfirm` WHERE 'EmailAddress'='$email';";
                $firm_result = mysqli_query($conn,$firm_query);

                if($firm_result) {
                    while($row_firm_id = mysqli_fetch_assoc($firm_result)) {
                        $firm_id = $row_firm_id['FirmID'];
                    }
                } else {
                    echo "Error connecting";
                }
        
                ///echo $firm_id;

                $guard_query = "SELECT * FROM `firmuniquekey` WHERE `FirmID`='$firm_id';";
                $guard_result = mysqli_query($conn,$guard_query);
                //while ($guard_row = mysqli_fetch_array($guard_result)) {

                //}
                if ($guard_result){
                    $guard_array = mysqli_fetch_all($guard_result);
                } else {
                    echo "failed to connect to database.";
                }
            
                //print_r($guard_array);
                ///echo $guard_array[0][0];

                $query = "SELECT * FROM `incidentreport` ORDER BY `TimeSubmitted` DESC;";
                $result = mysqli_query($conn,$query);

            ?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Guard Key</th>
                            <th>Business ID</th>
                            <th>Incident Type</th>
                            <th>Date/Time</th>
                        </tr>
                        </thead> 
                        <?php while($row = mysqli_fetch_array($result)){ 
                            error_reporting(E_ERROR | E_PARSE);
                            ///print_r($row);
                             ///foreach($guard_array as $guard_id){
                                ///if ($guard_id == $row['GuardKey']){ 
                                    
                                    for ($i = 0; $i <= sizeof($guard_array, 0); $i++) {
                                        if ($guard_array[$i][0] == $row['GuardKey']){?>
                                        <tr data-id='<?php echo $row['ReportID']; ?>' class="ReportInfo"> 
                                            <td><?php echo $row['GuardKey']; ?></td>
                                            <td><?php echo $row['BusinessID']; ?></td> 
                                            <td><?php echo $row['IncidentType']; ?></td> 
                                            <td><?php echo $row['TimeSubmitted']; ?></td> 
                                        </tr>
                                  
                                <?php }
                             } 
                         } ?>
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

<!-- Populate modal with business info -->
<script type='text/javascript'>
    // this opens up the pop up window for key list using AJAX
    //when user click the row with class key info, it assigns the index and pass 
    //the input to the url provided
            $(document).ready(function(){
                $('.ReportInfo').click(function(){
                    var userid = $(this).data('id');
                    $.ajax({
                        url: 'incident_report_info.php',
                        type: 'post',
                        data: {userid: userid},
                        success: function(response){ 
                            $('.modal-body').html(response); 
                            $('#empModalRep').modal('show'); 
                        }
                    });
                });
            });
            </script>
        </div>
        <!-- modap pop up window body -->
        <div class="modal fade" id="empModalRep" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Incident Report</h4>
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