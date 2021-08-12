<?php
include 'connect.php';
$code=$_POST['code'];
$sql=$con->query("SELECT * FROM notice where code='".$code."' order by id desc");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>