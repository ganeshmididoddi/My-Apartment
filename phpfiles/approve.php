<?php
include 'connect.php';
$id=$_POST['id'];
$val=active;
$sql=$con->query("update registration set status='".$val."'where id ='".$id."'");
?>
