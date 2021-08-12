<?php
include 'connect.php';
$name=$_POST['name'];
$email=$_POST['email'];
$password=$_POST['password'];
$code=$_POST['code'];
$roomno=$_POST['roomno'];
$usertype=$_POST['usertype'];
$superadmincode=$_POST['superadmincode'];
$sql_u = "SELECT * FROM registration WHERE email='$email'";
$res_u = mysqli_query($con, $sql_u);
if (mysqli_num_rows($res_u) > 0) {
  	  echo json_encode("Email Exist");
	  }else{
$sql="insert into registration(name,email,password,superadmincode,code,roomno,usertype) values('$name','$email','$password','$superadmincode','$code','$roomno','$usertype')";
$query=mysqli_query($con,$sql);
$sqla ="insert into profile (r_id,name,email,code,room_no) select id ,'$name','$email','$code','$roomno' from registration where email='".$email."' and password='".$password."'";
$result=mysqli_query($con,$sqla);
echo json_encode("Success");
		}
	 

?>