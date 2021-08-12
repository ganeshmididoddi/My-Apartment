<?php
include 'connect.php';
$type=$_POST['type'];
$code=$_POST['code'];
$sql=$con->query("select*from amenities where type ='".$type."' and code='".$code."' order by id desc");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>