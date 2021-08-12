<?php
include 'connect.php';
$value=$_POST['value'];
$code=$_POST['code'];
$sql=$con->query("select*from vendordetails where type ='".$value."' and code='".$code."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>