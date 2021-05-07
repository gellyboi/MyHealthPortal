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
		<!-- For the medicines page, we want to list available options for prescriptions from Prescriptions table (once added) -->
		<!-- That information will be put into the Prescriptions table, with the PatientID and DocID to tell who it's for and who approved of it -->
		<!-- Then, add a cost to the patient in the Costs table associated with PatientID -->
		<?php
			$prescriptQuery = "SELECT * FROM Prescriptions INNER JOIN Products on Prescriptions.PrescriptionName = Products.PrescriptionName WHERE PatientID = $_SESSION[pid]";
			$prescriptResult = mysqli_query($conn, $prescriptQuery);
		?>
		<h2 class="top-text">Choose a Prescription</h2>
		<form method="post" action="pharmaceuticals.php">
			<label for="prescriptQuery">Prescriptions:</label>
			<select name="prescriptQuery">
				<?php while($row = mysqli_fetch_assoc($prescriptResult)) { ?>
					<option value="<?php echo $row['PrescriptionName']; ?>">
					<?php echo $row['PrescriptionName'].", $".$row['Cost']; ?></option>
				<?php }; ?>
			</select>
			<div class="input-group">
				<button type="submit" name="SSD0Choice">Submit Choice</button>
			</div>

		</form>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>