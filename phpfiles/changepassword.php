<?php
include 'connect.php';
$r_id=$_POST['r_id'];
$password=$_POST['password'];
$queryresult=$con->query("select * from registration where id ='".$r_id."' LIMIT 1 ");
$result= array();
while( $fetchData=$queryresult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>

