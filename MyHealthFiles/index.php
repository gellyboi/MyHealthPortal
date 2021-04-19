<?php
    include('server.php');
?>
<?php
    //session_start();
    if (!isset($_SESSION['name'])) {
        $_SESSION['msg'] = "Login required";
        header('location: login.php');
    }
    /*if (isset($_GET['logout'])) {
        session_destroy();
        unset($_SESSION['name']);
        header("location: login.php");
    }*/
?>


<!DOCTYPE html>
<html>
<head>
    <title>My Health Portal</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div id="header-panel">
		<h1 class="center-text">My Health Portal</h1>
		
	</div>
	
	<!-- PUT BELOW IN A DIV FOR A SIDE PANEL -->
	<div id="side-panel">
		<h2 class="top-text">Welcome, <?php echo $_SESSION['name']; ?>!</h2>
		<p class="itemize"><a href="index.php">View and Create Appointments</a></p>
		<p class="itemize"><a href="index.php">Request a Test</a></p>
		<p class="itemize"><a href="index.php">Review Your Insurance Plans</a></p>
		<p class="itemize"><a href="index.php">See Your Billing Statements</a></p>
		
		<form method="post" action="index.php">
			<button type="submit" name="logout">Sign Out</button>
		</form>
	</div>
	
	<div id="center-panel">
		<!-- MAIN BODY DIV WILL LIST CONVENIENT INFORMATION; PATIENT PROFILE MAYBE?... -->
		<!-- BASICALLY JUST ANOTHER TABLE RETURNED BY PRECANNED QUERY -->
		<h2 class="top-text">My Health Profile Overview</h2>
		
	</div>
		
	
</body>
</html>
