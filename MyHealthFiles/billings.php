<?php
    include('server.php');
	include('errorHandle.php');
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
		
		<?php if (isset($_SESSION['pid'])) : ?>
		<p class="itemize"><a href="serviceSelection.php">Choose Services</a></p>
		<p class="itemize"><a href="appointments.php">Create Appointments</a></p>
		<p class="itemize"><a href="pharmaceuticals.php">Purchase Pharmaceuticals</a></p>
		<p class="itemize"><a href="insurancePlans.php">Review Your Insurance Plans</a></p>
		<p class="itemize"><a href="billings.php">See Your Billing Statements</a></p>
		
		<?php elseif (isset($_SESSION['did'])) : ?>
		<!-- Doctor Links -->
		<p>Doctor links here</p>
		<?php endif; ?>
		
		<form method="post" action="index.php">
			<button type="submit" name="logout">Sign Out</button>
		</form>
	</div>
	
	<!-- BODY PANEL -->
	<div id="center-panel">
		<!-- For the Billings page, a good choice would be to break up listing costs in sections (i.e. Insurance costs, Prescription Costs and appointment costs) -->
		<!-- All of these costs should be found in the Costs table, should differentiate using TypeOfCost, (TypeOfCost as varchar or int?) -->
		<!-- Make a report for costs, maybe available as a pdf? -->
		
		<h2 class="top-text">Billing Statement</h2>
		<?php
			$costsQuery = "SELECT * FROM Costs WHERE PatientID = $_SESSION[pid]";
			$costsResult = mysqli_query($conn, $costsQuery);
			$costs = mysqli_fetch_assoc($costsResult);
			if (mysqli_num_rows($costsResult) == 0) {
				echo "<p>No Billing Information Available</p>";
			} else {
				echo "<p>Test: ";
				echo "$costs[PatientID]";
				echo "</p>";
			}
		?>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>