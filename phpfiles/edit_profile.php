<?php
include 'connect.php';
$r_id=$_POST['r_id'];
$name=$_POST['name'];
$number=$_POST['number'];
$roomno=$_POST['roomno'];
$profession=$_POST['profession'];
$type=$_POST['type'];
$sql=$con->query("INSERT INTO profile (r_id,name, ph_number,room_no,profession,type) VALUES('".$r_id."','".$name."','".$number."','".$roomno."','".$profession."','".$type."') ON DUPLICATE KEY UPDATE name ='".$name."', ph_number='".$number."',room_no='".$roomno."', profession='".$profession."', type='".$type."'");
?>



