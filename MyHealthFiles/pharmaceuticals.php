<?php
    include('server.php');
?>
<?php
    if (!isset($_SESSION['name'])) {
        $_SESSION['msg'] = "Login required";
        header('location: login.php');
    }
?>


<!DOCTYPE html>
<html>
<head>
    <title>My Health Portal</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<!-- HEADER PANEL -->
	<div id="header-panel">
		<h1 class="center-text">My Health Portal</h1>
		
	</div>
	
	<!-- SIDE PANEL -->
	<div id="side-panel">
		<h2 class="top-text">Welcome, <?php echo $_SESSION['name']; ?>!</h2>
		<p class="itemize"><a href="index.php">Home</a></p>
		<p class="itemize"><a href="appointments.php">Create Appointments</a></p>
		<p class="itemize"><a href="pharmaceuticals.php">Purchase Pharmaceuticals</a></p>
		<p class="itemize"><a href="insurancePlans.php">Review Your Insurance Plans</a></p>
		<p class="itemize"><a href="billings.php">See Your Billing Statements</a></p>
		
		<form method="post" action="index.php">
			<button type="submit" name="logout">Sign Out</button>
		</form>
	</div>
	
	<!-- BODY PANEL -->
	<div id="center-panel">
		<!-- For the medicines page, we want to list available options for prescriptions from Prescriptions table (once added) -->
		<!-- We want to handle buying prescriptions by notifying doctors that a request for a prescription has been made -->
		<!-- When the doctor approves of the request, the request is finalized and added to the patient's list of prescriptions -->
		<!-- That information will be put into the Prescriptions table, with the PatientID and DocID to tell who it's for and who approved of it -->
		<!-- Then, add a cost to the patient in the Costs table associated with PatientID -->
		<h2 class="top-text">Body Header</h2>
		<p>stuff goes here</p>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>