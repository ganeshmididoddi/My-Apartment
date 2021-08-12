<?php
include 'connect.php';
$id=$_POST['id'];
$code=$_POST['code'];
$name=$_POST['name'];
$number=$_POST['number'];
$address=$_POST['address'];
$cost=$_POST['cost'];
$type=$_POST['type'];
$con->query("update vendordetails set code='".$code."',name='".$name."',number='".$number."',address='".$address."',cost='".$cost."',type='".$type."' where id='".$id."'");
?>