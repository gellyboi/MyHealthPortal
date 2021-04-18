<?php
    include('server.php');
?>
<?php
    //session_start();
    if (!isset($_SESSION['name'])) {
        $_SESSION['msg'] = "Login required";
        header('location: login.php');
    }
    if (isset($_GET['logout'])) {
        session_destroy();
        unset($_SESSION['name']);
        header("location: login.php");
    }
?>


<!DOCTYPE html>
<html>
<head>
    <title>My Health Portal</title>
</head>
<body>
    <h1>My Health Portal</h1>
	<p><a>Sign Out</a></p>
		
		<!-- PUT BELOW IN A DIV FOR A SIDE PANEL -->
		<p><a href="index.php">View and Create Appointments</a></p>
		<p><a href="index.php">Request a Test</a></p>
		<p><a href="index.php">Review Your Insurance Plans</a></p>
		<p><a href="index.php">See Your Billing Statements</a></p>
		
		
		<!-- MAIN BODY DIV WILL LIST CONVENIENT INFORMATION; PATIENT PROFILE MAYBE?... -->
		<!-- BASICALLY JUST ANOTHER TABLE RETURNED BY PRECANNED QUERY -->
</body>
</html>
