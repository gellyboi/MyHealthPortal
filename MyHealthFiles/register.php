<?php 
	include 'server.php'; 
	//echo getcwd();
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Register</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<div id="header-panel">
			<h1 class="center-text">My Health Portal Registration</h1>
		</div>
		<div id="login-panel">
			<form method="post" action="register.php">
				<?php include('errorHandle.php'); ?>
				<div class="input-group">
					<label>First Name:</label>
					<input type="text" name="firstname" value="<?php echo $firstname; ?>">
				</div>
				<div class="input-group">
					<label>Last Name:</label>
					<input type="text" name="lastname" value="<?php echo $lastname; ?>">
				</div>
				<div class="input-group">
					<label>Social Security Number:</label>
					<input type="number" name="ssn" value="<?php echo $ssn; ?>" min="100000000" max="999999999">
				</div>
				<div class="input-group">
					<label>Phone Number:</label>
					<input type="number" name="phone" value="<?php echo $phone; ?>" min="1000000000" max="9999999999">
				</div>
				<div class="input-group">
					<label>Date of Birth:<label>
					<input type="date" name="dob" value="<?php echo $dob; ?>">
				</div>
				<div class="input-group">
					<label>Address:</label>
					<input type="text" name="address" value="<?php echo $address; ?>">
				</div>
				<div class="input-group">
					<label>Email:</label>
					<input type="email" name="email" value="<?php echo $email; ?>">
				</div>
				<div class="input-group">
					<label>Password:</label>
					<input type="password" name="password1">
				</div>
				<div class="input-group">
					<label>Confirm password:</label>
					<input type="password" name="password2">
				</div>
				<br></br>
				<div class="input-group">
					<button type="submit" name="register">Register</button>
				</div>
				<p>
					Already a member? <a href="login.php">Sign in</a>
				</p>
			</form>
		</div>
	</body>
</html>