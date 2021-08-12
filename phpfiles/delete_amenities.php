S<?php
include 'connect.php';
$id=$_POST['id'];
$sql=$con->query("delete from amenities where id ='".$id."'");
?>