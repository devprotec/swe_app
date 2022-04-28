<?php
	    $dbhost = 'fdb34.awardspace.net';
        $dbuser = '4071423_capstone';
        $dbpass = 'aim123.,?';
        $dbname = '4071423_capstone';

        //Create Connection
        $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
    if($conn)


    {echo "success";}else echo "failed";
	

?>
