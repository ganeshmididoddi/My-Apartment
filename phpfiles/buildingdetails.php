<?php
include 'connect.php';
$code=$_POST['code'];
$sql=$con->query("select*from building where code='".$code."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>