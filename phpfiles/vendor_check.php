<?php
include 'connect.php';
$code=$_POST['code'];
$value=$_POST['value'];
$sql=$con->query("select*from vendordetails where code ='".$code."' and  type ='".$value."'");
$num_rows = mysqli_num_rows($sql);
if ($num_rows > 0) {
  echo json_encode("data");
}
else {
	echo json_encode("add");
}
?>