<?php
include 'connect.php';
$subject=$_POST['subject'];
$description=$_POST['description'];
$code=$_POST['code'];
$con->query("insert into notice(code,subject,description,date,time) values('$code','$subject','$description',curdate(),curtime())");
?>