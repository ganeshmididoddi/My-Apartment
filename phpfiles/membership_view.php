<?php
include 'connect.php';
$id=$_POST['id'];
$sql=$con->query("select t1.*, t2.name from membership t1 INNER JOIN registration t2 on t1.r_id=t2.id where t1.id ='".$id."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>