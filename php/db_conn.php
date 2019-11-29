<?php

// connect to database
// เปลี่ยนตรงนี้ให้เป็น localhost ของเครื่องตัวเอง
$conn = mysqli_connect("localhost","root","","uhoteldb");

//check if connection is successfully
if ( mysqli_connect_error() ) {
    echo "Failed to connect to MySQL : ".mysqli_connect_error();
}


function  DB_query($db, $sql){
    $result = mysqli_query($db, $sql);
    $resultCheck = mysqli_num_rows($result);

    if ($resultCheck < 1)
    {
        return 0;
    } else {
        while($row = mysqli_fetch_assoc($result)){
            echo "<option value='".$row['VideoNo']."'>".$row['VideoName']."</option>";
        }
    }

}



?>