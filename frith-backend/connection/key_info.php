<!-- This file retrieve infromations of keys including who's guard is assigned. -->
<?php
include "db_conn.php";
//  retrieve userid
$userid = $_POST['userid'];
 
//sql query
$sql = "select * from accountsecurityguard where GuardKey=".$userid;
$result = mysqli_query($conn,$sql);
while( $row = mysqli_fetch_array($result) ){
        //checks whether the key is assigned to a security guard
        if(empty($result)) {

            ?>
            <table border='0' width='100%'>
                <tr>
                    <td>
                        <h1>No assigned guard</h1>
                    </td>
                </tr>
            </table>

            
    
        <?php 
        // if key is assigned, show the name of guard
        }else{
            ?> 
            <table border='0' width='100%'>
                <tr>
                    <td>
                      <label for="fname">Assigned Guard: </label>
                      <p id="fname" style="display:inline" ><?php echo $row['FirstName']; ?></p>
                      <p id="fname" style="display:inline" ><?php echo $row['LastName']; ?></p>
                </tr>
            </table>

        <?php 
        }
}

?>
