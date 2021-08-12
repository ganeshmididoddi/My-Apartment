<? php

include 'connect.php';

$image = $_FILES['image']['name'];
$name = $_POST['name'];

$imagePath = 'uploads/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name, $imagePath);

$con->query("INSERT INTO profile(name,image)VALUES(,'".$name."''".$image."')");
?>