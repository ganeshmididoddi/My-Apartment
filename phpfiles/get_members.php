<?php
include 'connect.php';
$code=$_POST['code'];
$val="Residence";
$sql=$con->query("select * from  registration where code ='".$code."'and usertype ='".$val."'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);
?>


