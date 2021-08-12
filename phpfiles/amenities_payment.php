<?php
include 'connect.php';
$code=$_POST['code'];
$sql=$con->query("SELECT t2.id, t1.name, t1.roomno, t1.code, t2.amenities_name,t2.amount,t2.payment
FROM registration t1
INNER JOIN membership t2 ON t2.r_id = t1.id
WHERE t1.code='".$code."'
and t2.payment='notpaid'
and t1.usertype='Residence'");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>