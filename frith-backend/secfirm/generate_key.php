<!-- This file generates new unique key for once the button is click on key list view. -->
<?php 
include "db_conn.php";
if(isset($_POST['newKey'])) {
        //set a random number (min,max)
        $random_num = rand(1,9999); 
        //sets a current date
        $current_date = date('Y-m-d');
        //sql query to database
        $sql = "INSERT INTO `firmuniquekey` (`GuardKey`,`FirmID`,`DateKey`) VALUES ('$random_num','1','$current_date');";
        $result = mysqli_query($conn,$sql);
}else{
    //this triggers when button is not clicked
    echo "did not receive newKey";
}
?>