<?php
include 'connect.php';
$val="Admin";
$status="notactive";
$code=$_POST['code'];
$sql=$con->query("select*from registration where usertype ='".$val."'and status ='".$status."' and superadmincode ='".$code."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>