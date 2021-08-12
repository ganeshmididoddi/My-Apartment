<?php
include 'connect.php';
$id=$_POST['id'];
$code=$_POST['code'];
$name=$_POST['name'];
$number=$_POST['number'];
$description=$_POST['description'];
$monthly=$_POST['monthly'];
$quarterly=$_POST['quarterly'];
$yearly=$_POST['yearly'];
$type=$_POST['type'];
$con->query("update amenities set code='".$code."',name='".$name."',number='".$number."',description='".$description."',monthly='".$monthly."',quarterly='".$quarterly."',yearly='".$yearly."',type='".$type."' where id ='".$id."' ");
echo json_encode("Success");
?>