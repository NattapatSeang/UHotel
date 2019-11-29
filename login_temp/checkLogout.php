<?php

    session_start();
    include 'db_conn.php';

    if( isset($_SESSION['StaffID']) ) {
        $sql = "UPDATE staff SET IsActive = 0 WHERE StaffID = {$_SESSION['StaffID']};";
        mysqli_query($conn, $sql);
    } else if ( isset($_SESSION['PartnerNo']) ) {
        $sql = "UPDATE partner SET IsActive = 0 WHERE PartnerNo = {$_SESSION['PartnerNo']};";
        mysqli_query($conn, $sql);
    }
    
    session_destroy();
    mysqli_close($conn);
    header("Location: ../html/Companylogin.html");
?>