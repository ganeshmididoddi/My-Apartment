<?php
include 'connect.php';
$code=$_POST['code'];
$type=$_POST['type'];
$sql=$con->query("select*from amenities where code ='".$code."' and  type ='".$type."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>