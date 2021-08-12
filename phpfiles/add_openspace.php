<?php
include 'connect.php';
$code=$_POST['code'];
$name=$_POST['name'];
$number=$_POST['number'];
$description=$_POST['description'];
$cost=$_POST['cost'];
$type=$_POST['type'];
$con->query("insert into amenities(code,name,number,description,openspacecharge,type) values('$code','$name','$number','$description','$cost','$type')");
echo json_encode("Success");
?>