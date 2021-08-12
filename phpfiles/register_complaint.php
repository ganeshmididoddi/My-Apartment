<?php
include 'connect.php';
$code=$_POST['code'];
$subject=$_POST['subject'];
$description=$_POST['description'];
$con->query("insert into complaint(code,subject,description,date,time) values('$code','$subject','$description',curdate(),curtime())");
?>