<!-- this file is responsbile for showing the details for each security guard.
Once the post is received, it will check the database for same GuardKey -->
<?php
include "db_conn.php";
 
$userid = $_POST['userid'];
// query the database
$sql = "select * from accountsecurityguard where GuardKey=".$userid;
$result = mysqli_query($conn,$sql);
while( $row = mysqli_fetch_array($result) ){
?>
<table border='0' width='100%'>
     <!-- table for security guard info -->
<tr>
     <td>
          <label for="fname">First Name</label>
          <p id="fname" ><?php echo $row['FirstName']; ?></p>
          <label for="lname" >Last Name</label>
          <p id="lname" ><?php echo $row['LastName']; ?></p>
          <label for="link">Email Address</label>
          <a id="link" style="white-space: nowrap" href="mailto:test@test.com"><?php echo $row['EmailAddress'];?></a>
          <p id="pnumber">Phone Number: <?php echo $row['PhoneNumber']; ?></p>
          <label for="assign">Assigned Business location</label>
          <p id="assign"></p>
          <label for="sub">Submitted Incident Reports</label>
          <p id="sub"></p>


    </td>
</tr>
</table>
 
<?php } ?>