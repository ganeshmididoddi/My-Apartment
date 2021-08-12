<?php
include 'connect.php';
$r_id=$_POST['r_id'];
$password=$_POST['password'];
$queryresult=$con->query(" update registration set password='".$password."' where id ='".$r_id."'");
if($queryresult){
	echo json_encode("updated");
}else {
	echo json_encode("failed");
}
?>



