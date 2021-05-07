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
		<h2 class="top-text">Choose a pharmacy:</h2>
		<?php
			//Get pharmacies from SSDO
			$pharmQuery = "SELECT * FROM SSDO WHERE PatientID=$_SESSION[pid];";
			$result = mysqli_query($connSSDB, $pharmQuery);
		?>
		<form method="post" action="pharmaceuticals.php">
			<label for="pharmChoice">Pharmacies:</label>
			<select name="pharmChoice">
				<?php 
				while($row = mysqli_fetch_assoc($result)) { 
				$phQuery = "SELECT * FROM Pharmacies WHERE PharmacyID=$row[PharmacyID];";
				$phResult = mysqli_query($conn, $phQuery);
				$phRow = mysqli_fetch_assoc($phResult);
				?>
				<option value=<?php echo $row['PharmacyID']; ?>><?php echo "$phRow[PharmacyName], $phRow[Address], ($phRow[PhoneNum])"; ?></option>
				<?php }; ?>
			</select>
			<div class="input-group">
				<button type="submit" name="PharmChoice">Submit Choice</button>
			</div>
		</form>
		
		<?php if(isset($_POST['PharmChoice'])) : ?>
		<h2 class="top-text">Choose a Prescription</h2>
		<form method="post" action="pharmaceuticals.php">
			<label for="prescripQuery">Prescriptions:</label>
			<select name="prescripQuery">
				<?php 
				$_SESSION['pharmID'] = $_POST['pharmChoice'];
				$prescriptQuery = "SELECT * FROM Prescriptions INNER JOIN Products ON Prescriptions.PrescriptionName = Products.PrescriptionName WHERE PatientID = $_SESSION[pid]";
				$prescriptResult = mysqli_query($conn, $prescriptQuery);
				while($row = mysqli_fetch_assoc($prescriptResult)) { ?>
					<option value="<?php echo $row['PrescriptionID']; ?>">
					<?php echo $row['PrescriptionName'].", $".$row['Cost']; ?></option>
				<?php }; ?>
			</select>
			<div class="input-group">
				<button type="submit" name="SSDOChoice">Purchase Prescription</button>
			</div>
		</form>
		<?php endif; ?>

		<?php if(isset($_POST['SSDOChoice'])) {
			$scripID = $_POST['prescripQuery'];
			
			//get price
			$priceQuery = "SELECT * FROM Products WHERE PrescriptionID=$scripID;";
			$result = mysqli_query($conn, $priceQuery);
			$row = mysqli_fetch_assoc($result);
			$pharmPrice = $row['Cost'];
			
			//Get insurance ID
			$planIDQuery = "SELECT * FROM SSDO where PatientID = $_SESSION[pid]";
			$result = mysqli_query($connSSDB, $planIDQuery);
			$row = mysqli_fetch_assoc($result);
			$insCost = intval(.8 * $pharmPrice); //In network cost reduces total price of prescription
			

			$row['InsuranceID'] = $row['InsuranceID'] - 100000000; // gives us planid
			$deductQuery = "SELECT * FROM InsPlans WHERE PlanID=$row[InsuranceID]";
			$deductResult = mysqli_query($conn, $deductQuery);
			$deductRow = mysqli_fetch_assoc($deductResult);
			
			$pharmPrice = intval($pharmPrice);
			$deductRow['AnnualDeductible'] = intval($deductRow['AnnualDeductible']);

			if (mysqli_num_rows($result) == 0) {
				$CostQuery = "INSERT INTO Costs (PatientID, PharmacyID, PrescriptionID, AllowedCost, InNetworkCoverage, OutNetworkCoverage, Deductible) VALUES ($_SESSION[pid], $_SESSION[pharmID], $scripID, '$pharmPrice', '$insCost', '0', '$deductRow[AnnualDeductible]');";
				$result = mysqli_query($conn, $CostQuery);
			} else {
				$CostQuery = "INSERT INTO Costs (PatientID, PlanID, PharmacyID, PrescriptionID, AllowedCost, InNetworkCoverage, OutNetworkCoverage, Deductible) VALUES ($_SESSION[pid], $row[InsuranceID], $_SESSION[pharmID], $scripID, '$pharmPrice', '$insCost', '0', '$deductRow[AnnualDeductible]');";
				$result = mysqli_query($conn, $CostQuery);
			}
			echo "<p>Prescription was purchased!</p>";
			
			unset($_SESSION['pharmID']);
		}
		?>
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>