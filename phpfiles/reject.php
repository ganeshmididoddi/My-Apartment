<?php
include 'connect.php';
$id=$_POST['id'];
$sql=$con->query("delete from registration where id ='".$id."'");
?>