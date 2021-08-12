<?php
include 'connect.php';
$id=$_POST['id'];
$code=$_POST['code'];
$name=$_POST['name'];
$number=$_POST['number'];
$description=$_POST['description'];
$cost=$_POST['cost'];
$type=$_POST['type'];
$con->query("update amenities set code='".$code."',name='".$name."',number='".$number."',description='".$description."',openspacecharge='".$cost."',type='".$type."' where id ='".$id."' ");
echo json_encode("Success");
?>