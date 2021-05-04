<?php include 'server.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<div id="header-panel">
	<h1 class="center-text">My Health Portal Login</h1>
</div>
<div id="login-panel">
	<form method="post" action="login.php">
		<?php include 'errorHandle.php'; ?>
		<label>Email:</label>
		<input type="text" name="email">
		<label>Password:</label>
		<input type="password" name="password">
		<br></br>
		<button type="submit" name="login">Login</button>
	</form>
	<br></br>
	<p>
		Not a member? <a href="register.php">Sign up</a>
	</p>
</div>
</body>
</html>
