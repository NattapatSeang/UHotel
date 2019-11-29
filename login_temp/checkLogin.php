<?php

session_start();

if (isset($_POST['submit'])){

    include 'db_conn.php';

    $user = mysqli_real_escape_string($conn, $_POST['username']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);

    $isPartner = TRUE;
    $isAdmin = TRUE;
    $isManager = TRUE;

    // Error handlers
    if( empty($user) || empty($pass) ) {
        header("Location: ../html/Companylogin.html?login=empty1");
        exit();
    } else {
        // check for staff
        $sql = "SELECT * FROM staff WHERE Email ='$user';";
        $result = mysqli_query($conn, $sql);
        $resultCheck = mysqli_num_rows($result);

        if( $resultCheck < 1 ) {
            //check StaffID
            $isManager = FALSE;
            $isAdmin = FALSE;
        } else {
            if ( $row = mysqli_fetch_assoc($result)) {
                //check Pwd
                if( $pass != $row['Pwd']) {
                    // password not match
                    $isManager = FALSE;
                    $isAdmin = FALSE;
                } else if ( $pass == $row['Pwd']) {
                    // password match
                    // query for manager
                    $StaffID = $row['StaffID'];
                    $sqlManager = "SELECT * FROM manager WHERE StaffID ='$StaffID';";
                    $resultManager = mysqli_query($conn, $sqlManager);
                    $resultCheck = mysqli_num_rows($resultManager);    
                    if( $resultCheck < 1 ) {
                        // user is not manager
                        $isManager = FALSE;
                    } elseif ( $isManager == FALSE && $isAdmin == TRUE && $isPartner == TRUE ) {
                        //query for admin
                        $sqlAdmin = "SELECT * FROM admin WHERE StaffID ='$StaffID';";
                        $resultAdmin = mysqli_query($conn, $sqlAdmin);
                        $resultCheck = mysqli_num_rows($resultAdmin);
                        if( $resultCheck < 1 ) {
                            // user is manager
                            $isAdmin = FALSE;
                        }
                    }
                } 
            }
        }

        if ( $isManager == FALSE && $isAdmin == FALSE ) {
            $sql = "SELECT * FROM partner WHERE UID ='$user';";
            $result = mysqli_query($conn, $sql);
            $resultCheck = mysqli_num_rows($result);

            if( $resultCheck < 1 ) {
                //check StaffID
                $isPartner = FALSE;
            }else {
                if ( $row = mysqli_fetch_assoc($result)) {
                    //check Pwd
                    if( $pass != $row['Pwd']) {
                        // password not match
                        $isPartner = FALSE;
                    }
                }
            }
        }
    }
} else {
    header("Location: ../html/Companylogin.html?login=error");
    exit();
}

if( $isManager ) { // user is manager

    $sql = "UPDATE staff SET IsActive = 1 WHERE StaffID = {$row['StaffID']};";
    mysqli_query($conn, $sql);

    $_SESSION['ManagerID'] = $row['StaffID'];
    $_SESSION['Name'] = $row['StaffName'];
    $_SESSION['Position'] = $row['Position'];
    header("Location: manager/mIndex.php?login=success");
    
} else if ( $isAdmin ) { //user is admin

    $sql = "UPDATE staff SET IsActive = 1 WHERE StaffID = {$row['StaffID']};";
    mysqli_query($conn, $sql);

    $_SESSION['AdminID'] = $row['StaffID'];
    $_SESSION['Name'] = $row['StaffName'];
    $_SESSION['Position'] = $row['Position'];
    header("Location: admin/aIndex.php?login=success");

} elseif ( $isPartner ) { // user is partner

    $sql = "UPDATE partner SET IsActive = 1 WHERE PartnerNo = {$row['PartnerNo']};";
    mysqli_query($conn, $sql);

    $_SESSION['PartnerNo'] = $row['PartnerNo'];
    $_SESSION['Name'] = $row['StudioName'];
    header("Location: partner/pIndex.php?login=success");
    
} else {
    header("Location: ../html/Companylogin.html?login=error");
}

mysqli_close($con);

?>