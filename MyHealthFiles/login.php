<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h1>My Health Portal Login</h1>
<form method="post" action="login.php">
<label>Email</label>
<input type="text" name="email">
<label>Password</label>
<input type="text" name="password">
<button type="submit" name="login">Login</button>
<p>
    Not a member? <a href="register.php">Sign up</a>
</p>

</body>
</html>
