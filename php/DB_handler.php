<?php

// connect to database
// เปลี่ยนตรงนี้ให้เป็น localhost ของเครื่องตัวเอง
$db = mysqli_connect("localhost","root","","uhoteldb");

//check if connection is successfully
if ( mysqli_connect_error() ) {
    echo "Failed to connect to MySQL : ".mysqli_connect_error();
}

//check login
function checkLogin(){

    

}






?>