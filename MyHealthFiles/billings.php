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
		
		
		<h2 class="top-text">Billing Statement:</h2>
		<p>Pharmacy Costs:</p>
		<?php 
		//Divide costs into costs to Pharmacy, cost to doctor, cost to insurance
		//Get entries with a PharmacyID not null
		$query = "SELECT * FROM Costs WHERE PharmacyID;";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$pQuery = "SELECT * FROM Pharmacies WHERE PharmacyID=$row[PharmacyID]";
			$pResult = mysqli_query($conn, $pQuery);
			$pRow = mysqli_fetch_assoc($pResult);
			echo "<p>$pRow[PharmacyName], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
		}; ?>
		<br><p>Appointment Costs:</p>
		<?php
		//Get entries with a AppointmentID not null
		$query = "SELECT * FROM Costs WHERE AppointmentID;";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$aQuery = "SELECT * FROM Appointments INNER JOIN Doctors ON Appointments.DocID = Doctors.DocID WHERE AppointmentID=$row[AppointmentID]";
			$aResult = mysqli_query($conn, $aQuery);
			$aRow = mysqli_fetch_assoc($aResult);
			echo "<p>Dr. $aRow[FirstName] $aRow[LastName], $aRow[AppDate], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
		}; ?>
		<br><p>Insurance Costs:</p>
		<?php 
		//Get entries with a PharmacyID not null
		$query = "SELECT * FROM Costs WHERE PrescriptionID IS NULL AND PharmacyID IS NULL AND AppointmentID IS NULL;";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$iQuery = "SELECT * FROM InsProviders INNER JOIN InsPlans ON InsProviders.PlanID = InsPlans.PlanID WHERE InsProviders.PlanID=$row[PlanID]";
			$iResult = mysqli_query($conn, $iQuery);
			$iRow = mysqli_fetch_assoc($iResult);
			echo "<p>$iRow[CompanyName], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
			echo "<p>Annual Coverage: $$iRow[AnnualCoverage], Annual Deductible: $$iRow[AnnualDeductible], Annual Premium: $$iRow[AnnualPremium], Lifetime Coverage: $$iRow[LifetimeCoverage]</p>";
		}; ?>
		<br><p>Grand Totals:</p>
		<?php
		//for grand totals, want TotalCost, Cost after insurance, Cost after deductible. Notify if Coverage or deductible have been exceeded/covered.
		?>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>