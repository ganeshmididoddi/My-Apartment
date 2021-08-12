<?php
include 'connect.php';
$email=$_POST['email'];
$password=$_POST['password'];
$code=$_POST['code'];
$usertype=$_POST['usertype'];
$queryresult=$con->query("select * from registration where email='".$email."' and password='".$password."' and code ='".$code."' and usertype ='".$usertype."' LIMIT 1 ");
$result= array();
while( $fetchData=$queryresult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>



