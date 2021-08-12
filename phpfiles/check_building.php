<?php
include 'connect.php';
$code=$_POST['code'];
$sql=$con->query("select*from building where code ='".$code."' LIMIT 1");
$num_rows = mysqli_num_rows($sql);
if ($num_rows > 0) {
  echo json_encode("data");
}
else {
	echo json_encode("add");
}
?>