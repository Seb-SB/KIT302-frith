<!-- This file generates new unique key for once the button is click on key list view. -->
<?php 
include "db_conn.php";

include("../session.php");

if(isset( $_SESSION["EmailAddress"])) {
    //echo $_SESSION["EmailAddress"];
    $email = $_SESSION["EmailAddress"];
}

if(isset($_POST['newKey'])) {
        //set a random number (min,max)
        $random_num = rand(1,9999); 
        //sets a current date
        $current_date = date('Y-m-d');

        $sql_firmid = "SELECT * FROM `accountsecurityfirm` WHERE `EmailAddress`='$email';";
        $res = mysqli_query($conn,$sql_firmid);

        if($res) {
            while($row_firm_id = mysqli_fetch_assoc($res)) {
                $firm_id = $row_firm_id['FirmID'];
            }
        }

        //sql query to database
        $sql = "INSERT INTO `firmuniquekey` (`GuardKey`,`FirmID`,`DateKey`) VALUES ('$random_num','$firm_id','$current_date');";
        $result = mysqli_query($conn,$sql);
}else{
    //this triggers when button is not clicked
    echo "did not receive newKey";
}
?>