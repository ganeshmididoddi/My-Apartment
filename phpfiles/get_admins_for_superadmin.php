<?php
include 'connect.php';
$id=$_POST['id'];
$sql=$con->query("select * from  registration where  id ='".$id."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);
?>


