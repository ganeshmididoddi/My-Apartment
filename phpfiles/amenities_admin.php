<?php
include 'connect.php';
$code=$_POST['code'];
$type=$_POST['type'];
$sql=$con->query("select*from amenities where code ='".$code."' and  type ='".$type."' LIMIT 1");
$num_rows = mysqli_num_rows($sql);
if ($num_rows > 0) {
  echo json_encode("data");
}
else {
	echo json_encode("add");
}
?>