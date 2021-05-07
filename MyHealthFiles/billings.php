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
		<h2 class="top-text">Pharmacy Costs:</h2>
		<?php 
		$_SESSION['subTotal'] = 0;
		$_SESSION['wInsRate'] = 0;
		$_SESSION['wDeduct'] = 0;
		$_SESSION['grandTot'] = 0;
		//Divide costs into costs to Pharmacy, cost to doctor, cost to insurance
		//Get entries with a PharmacyID not null
		$query = "SELECT * FROM Costs WHERE PharmacyID AND PatientID=$_SESSION[pid];";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$pQuery = "SELECT * FROM Pharmacies WHERE PharmacyID=$row[PharmacyID]";
			$pResult = mysqli_query($conn, $pQuery);
			$pRow = mysqli_fetch_assoc($pResult);
			echo "<br /><p>$pRow[PharmacyName], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
			$_SESSION['subTotal'] += intval($row['AllowedCost']);
			$_SESSION['wInsRate'] += intval($row['InNetworkCoverage']);
		}; ?>
		<br><h2 class="top-text">Appointment Costs:</h2>
		<?php
		//Get entries with a AppointmentID not null
		$query = "SELECT * FROM Costs WHERE AppointmentID AND PatientID=$_SESSION[pid];";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$aQuery = "SELECT * FROM Appointments INNER JOIN Doctors ON Appointments.DocID = Doctors.DocID WHERE AppointmentID=$row[AppointmentID]";
			$aResult = mysqli_query($conn, $aQuery);
			$aRow = mysqli_fetch_assoc($aResult);
			echo "<br /><p>Dr. $aRow[FirstName] $aRow[LastName], $aRow[AppDate], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
			$_SESSION['subTotal'] += intval($row['AllowedCost']);
			$_SESSION['wInsRate'] += intval($row['InNetworkCoverage']);
		}; ?>
		<br><h2 class="top-text">Insurance Costs:</h2>
		<?php 
		//Get entries with a PharmacyID not null
		$query = "SELECT * FROM Costs WHERE PrescriptionID IS NULL AND PharmacyID IS NULL AND AppointmentID IS NULL AND PatientID=$_SESSION[pid];";
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_assoc($result)){
			$iQuery = "SELECT * FROM InsProviders INNER JOIN InsPlans ON InsProviders.PlanID = InsPlans.PlanID WHERE InsProviders.PlanID=$row[PlanID]";
			$iResult = mysqli_query($conn, $iQuery);
			$iRow = mysqli_fetch_assoc($iResult);
			echo "<br /><p>$iRow[CompanyName], Total Cost: $$row[AllowedCost], Covered by Insurance: $$row[InNetworkCoverage], Coverage with no insurance: $$row[OutNetworkCoverage], Deductible: $$row[Deductible]</p>";
			echo "<p>Annual Coverage: $$iRow[AnnualCoverage], Annual Deductible: $$iRow[AnnualDeductible], Annual Premium: $$iRow[AnnualPremium], Lifetime Coverage: $$iRow[LifetimeCoverage]</p>";
			$_SESSION['wDeduct'] += intval($row['Deductible']);
			$_SESSION['appliedServices'] = $_SESSION['subTotal'];
			if($_SESSION['appliedServices'] == 0){
				$_SESSION['wDeduct'] = 0;
			} else if($_SESSION['appliedServices'] < $_SESSION['wDeduct']){
				$_SESSION['wDeduct'] = $_SESSION['appliedServices'];
			}
			$_SESSION['wInsRate'] += intval($row['InNetworkCoverage']);
			if($_SESSION['subTotal'] > $_SESSION['wDeduct']){
				//cost according to insrate
				$_SESSION['wInsRate'] = intval(.2 * ($_SESSION['subTotal'] - $_SESSION['wDeduct']));
			} else {
				$_SESSION['wInsRate'] = 0;
			}
			$_SESSION['subTotal'] += intval($iRow['AnnualPremium']);
			//grand total is insRate + Deductible
			$_SESSION['grandTot'] = $_SESSION['wInsRate'] + $_SESSION['wDeduct'] + intval($iRow['AnnualPremium']);
		}; ?>
		<br><h2 class="top-text">Total Costs:</h2>
		<?php
		//for grand totals, want TotalCost (subtotal before applying insurance or deductible), Cost after insurance, Cost after deductible. Notify if Coverage or deductible have been exceeded/covered.
		echo "<p>Subtotal: $$_SESSION[subTotal].00</p><br /><p>Insurance Coverage: $$_SESSION[wInsRate].00</p><br /><p>Deductible: $$_SESSION[wDeduct].00</p><br /><p>Grand Total: $$_SESSION[grandTot].00</p><br />";
		//All done then unset
		unset($_SESSION['subTotal']);
		unset($_SESSION['wInsRate']);
		unset($_SESSION['wDeduct']);
		unset($_SESSION['grandTot']);
		?>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>