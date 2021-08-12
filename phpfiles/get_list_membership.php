<?php
include 'connect.php';
$r_id=$_POST['r_id'];
$type=$_POST['type'];
$sql=$con->query("select membership.*,amenities.type from membership left join amenities on membership.amenities_id= amenities.id where r_id ='".$r_id."' and type='".$type."' order by id desc");
$res=array();
while ($row=$sql-> fetch_assoc())
{
	$res[]=$row;
}
echo json_encode($res);

?>