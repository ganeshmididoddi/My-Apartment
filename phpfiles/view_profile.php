<?php
include 'connect.php';
$r_id=$_POST['r_id'];
$sql=$con->query("select*from profile where r_id='".$r_id."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>