<?php
include 'connect.php';
$val="Residence";
$status="notactive";
$code=$_POST['code'];
$sql=$con->query("select*from registration where usertype ='".$val."'and status ='".$status."' and code='".$code."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>