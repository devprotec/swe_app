<?php

    include_once "connect.php";

    
    $roomName = $_GET["roomName"];
    //$table = $_GET["table"];
    

    $sql="INSERT INTO `$rooms`(`roomName`) VALUES ('$roomName')";
	if(mysqli_query($conn,$sql)){
        echo "inserting succussfully";
    }else{
        echo "not successful";
    }


?>