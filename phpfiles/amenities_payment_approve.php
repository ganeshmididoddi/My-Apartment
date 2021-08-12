<?php
include 'connect.php';
$id=$_POST['id'];
$val=paid;
$sql=$con->query("update membership set payment='".$val."'where id ='".$id."'");
?>
