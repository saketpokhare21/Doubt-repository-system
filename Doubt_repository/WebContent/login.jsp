<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<title>Login - Welcome To Doubt Repository</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="sty lesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="util.css">
	<link rel="stylesheet" type="text/css" href="main.css">
<!--===============================================================================================-->


</head>


<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(bg-01.jpg);">
					<span class="login100-form-title-1">
						Welcome to Doubt Repository
					</span>
					<H4 class="login100-form-title-1">SIGN IN</H4>
				</div>
				
				<form action="LoginController"  class="login100-form validate-form" novalidate method="post" >
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">PRN No :</span>
						<input class="input100" type="text" id="prn_no" name="prn_no" placeholder="Enter PRN No." size="51" required>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password :</span>
						<input class="input100" type="password" id="pass" name="pass" placeholder="Enter password" size="51" required>
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-30">
					
					</div>
				
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Submit">
					</div>
					 <!-- <input type="submit" class="btn btn-primary" value="Submit"> -->
				</form>
					</div>
			</div>
	</div>
				
	
<!-- 	<div align="center">
		<h1>Login</h1>
		<form action ="LoginController" method="post">
			<input type = "text" name = "prn_no" id = "prn_no" placeholder = "Enter PRN No." required><br><br>
			<input type = "password" name = "pass" id = "pass" placeholder = "Enter your password" required><br><br>
			<input type="submit" value="Submit">
		</form>
		</div> -->
	
	
</body>
</html>