<?php
//Populates business information modal in security_firm_dashboard.php Assigned Businesses table.

include "db_conn.php";
//  retrieve userid
$userid = $_POST['userid'];
 
//sql query
$query = "SELECT * FROM `incidentreport` WHERE `ReportID` = '$userid';";
$result = mysqli_query($conn,$query);

while( $row = mysqli_fetch_array($result) ){
        echo "<table border='0' width='100%'>";
            echo '<tr>';
                echo '<td>';
                    $guard_key = $row['GuardKey'];
                    $business_id = $row['BusinessID'];

                    //Guard Name
                    echo '<label for="guardname">Guard Name</label>';

                    $sql = "SELECT * FROM `accountsecurityguard` WHERE `GuardKey`=$guard_key;";
                    $res = mysqli_query($conn,$sql);
                    
                    if($res) {
                        while ($guard_array = mysqli_fetch_array($res)) {
                            echo '<p id="guardname" >' . $guard_array['FirstName'] . ' ' . $guard_array['LastName']. '</p>';
                        }
                    } else {
                        echo 'failed to connect';
                    }

                    //Business Name
                    echo '<label for="busname">Business Name</label>';
                    $sql_busname = "SELECT * FROM `accountbusinessowner` WHERE `BusinessID`=$business_id;";
                    $res_busname = mysqli_query($conn,$sql_busname);

                    if($res_busname) {
                        while ($bus_array = mysqli_fetch_array($res_busname)) {
                            echo '<p id="busname" >' . $bus_array['BusinessName'] . '</p>';
                        }
                    } else {
                        echo 'failed to connect';
                    }


                    //Guard Key
                    ///echo '<label for="guardkey">Guard Key</label>';
                    ///echo '<p id="guardkey" >' . $row['GuardKey'] . '</p>';

                    //Business ID
                    echo '<label for="busabn">Business ID</label>';
                    echo '<p id="busid" >' . $row['BusinessID'] . '</p>';
                    //Time Submitted
                    echo '<label for="time">Time Submitted</label>';
                    echo '<p id="busnum" >' . $row['TimeSubmitted'] . '</p>';
                    //Incident Type
                    echo '<label for="incidenttype">Incident Type</label>';
                    echo '<p id="incidenttype" >' . $row['IncidentType'] . '</p>';
                    //Specific Area
                    echo '<label for="area">Location</label>';
                    echo '<p id="area" >' . $row['SpecificArea'] . '</p>';
                    //Description
                    echo '<label for="description">Description</label>';
                    echo '<p id="description" >' . $row['Description'] . '</p>';
            

                echo '</td>';
            echo '</tr>';
        echo '</table>';
}

?>