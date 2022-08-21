<?php
//Populates business information modal in security_firm_dashboard.php Assigned Businesses table.

include "db_conn.php";
//  retrieve userid
$userid = $_POST['userid'];
 
//sql query
$query = "SELECT * FROM `accountbusinessowner` WHERE `BusinessID` = '$userid';";
$result = mysqli_query($conn,$query);

while( $row = mysqli_fetch_array($result) ){
        echo "<table border='0' width='100%'>";
            echo '<tr>';
                echo '<td>';

                    //Business Name
                    echo '<label for="busname">Business Name</label>';
                    echo '<p id="busname" >' . $row['BusinessName'] . '</p>';
                    //Business ANB
                    echo '<label for="busabn">ABN</label>';
                    echo '<p id="busabn" >' . $row['ABN'] . '</p>';
                    //Business Phone Number
                    echo '<label for="busnum">Phone Number</label>';
                    echo '<p id="busnum" >' . $row['PhoneNumber'] . '</p>';
                    //Business Email Address 
                    echo '<label for="link">Email Address</label>';
                    echo '<p><a id="link" style="white-space: nowrap" href="mailto:test@test.com">' . $row['EmailAddress'] . '</a></p>';
                    //Business Manager Name
                    echo '<label for="manager">Manager Name</label>';
                    echo '<p id="manager" >' . $row['ManagerFirstName'] . ' ' . $row['ManagerLastName'] .'</p>';
                    //Business Security Locations ? list so nested table? while loop with <p>?
                    echo '<label for="buslocations">Guardable Locations</label>';

                    $sql = "SELECT * FROM `guardablearea` WHERE `BusinessID` = '$userid';";
                    $res = mysqli_query($conn,$sql);

                    if($res) {
                        while ($area_row = mysqli_fetch_array($res)) {
                            echo '<p>' . $area_row['AreaName'] . '</p>';
                        }

                    } else {
                        echo '<p>No Assigned Areas</p>';
                    }

                echo '</td>';
            echo '</tr>';
        echo '</table>';
}

?>
