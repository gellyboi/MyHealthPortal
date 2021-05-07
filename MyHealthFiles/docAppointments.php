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
		<p class="itemize"><a href="docAppointments.php">Submit Appointment Info</a></p>
		
		<form method="post" action="index.php">
			<button type="submit" name="logout">Sign Out</button>
		</form>
	</div>
	
	<!-- BODY PANEL -->
	<div id="center-panel">
		<h2 class="top-text">Choose an Appointment for Submittal: </h2>
		<!-- WANT TO HAVE APPOINTMENT DROP DOWN -->
		<?php
			$aQuery = "SELECT * FROM Appointments INNER JOIN Patients ON Appointments.PatientID=Patients.PatientID WHERE DocID=$_SESSION[did];";
			$aResult = mysqli_query($conn, $aQuery);
			
		?>
		
		<form method="post" action="docAppointments.php">
			<label for="appointments">Appointments: </label>
			<select name="appointments">
				<?php while($row = mysqli_fetch_assoc($aResult)){  ?>
				<option value=<?php echo $row['PatientID']; $appID = $row['AppointmentID']; ?>><?php echo $row['FirstName']." ".$row['LastName'].", (".$row['AppDate'].", ".$row['AppTime'].")"; ?></option>
				<?php }; ?>
			</select>
			<div class="input-group">
				<button type="submit" name="AppointmentChoice">Submit Choice</button>
			</div>
		<form>
		
		<?php if(isset($_POST['AppointmentChoice'])) : ?>
		<!-- WANT TO SUBMIT RELEVANT DATA TO PATIENTRECORDS  -->
		<?php
			//Get info from SSDO
			$sQuery = "SELECT * FROM SSDO WHERE PatientID=$_POST[appointments]";
			$result = mysqli_query($connSSDB, $sQuery);
			$hasPolicy = false;
			if(mysqli_num_rows($result) > 0){
				echo "<p>Patient has a policy that covers percentage of treatments.</p>";
				$row = mysqli_fetch_assoc($result);
				$hasPolicy = true;
				$_SESSION['planID'] = $row['InsuranceID'] - 100000000;
			} else {
				echo "<p>Patient has no insurance policy.</p>";
				$policyID = NULL;
			}
			
		?>
		
		<!-- Want date record is created, treatment, cost to ins, cost to patient -->
		<!-- maybe add an alert if patient has no insurance -->
		<form method="post" action="docAppointments.php">
				<div class="input-group">
					<label>Date of Entry:</label>
					<input type="date" name="recDate">
				</div>
				<div class="input-group">
					<label>Treatment:</label>
					<input type="text" name="treatment">
				</div>
				<div class="input-group">
					<label>Cost of Treatment:</label>
					<input type="text" name="cost">
				</div>
				
				<br><p>Does patient need Prescription?</p>
				<div class="input-group">
					<input type="radio" name="prescriptionChoice" value=1>
					<label>Yes</label>
				</div>
				<div class="input-group">
					<input type="radio" name="prescriptionChoice" value=0>
					<label>No</label>
				</div>
				<div class="input-group">
				<label for="prescription">Prescriptions:</label>
					<select name="prescription">
						<?php 
						$prescriptQuery = "SELECT * FROM Products";
						$prescriptResult = mysqli_query($conn, $prescriptQuery);
						while($row = mysqli_fetch_assoc($prescriptResult)) { ?>
						<option value=<?php echo $row['PrescriptionID']; ?>><?php echo $row['PrescriptionName']; ?></option>
						<?php }; ?>
					</select>
				</div>
				<div class="input-group">
					<button type="submit" name="submitAppData">Submit Entry</button>
				</div>
		</form>
		<?php endif; ?>
		
		<?php if(isset($_POST['submitAppData'])) : ?>
		<?php
			//Take form data, submit to patient record
			$date = $_POST['recDate'];
			$treatment = $_POST['treatment'];
			$totCost = intval($_POST['cost']);
			if($hasPolicy){
				$insCost = intval(.8 * $totCost);
				$patCost = $totCost - $insCost;
			} else {
				$insCost = 0;
				$patCost = $totCost;
			}
			
			$recQuery = "INSERT INTO `PatientRecords` (`PatientID`, `PlanID`, `PrescriptionID`, `RecDate`, `Treatment`, `CostToIns`, `CostToPatient`) VALUES ($_POST[appointments], $_SESSION[planID], $_POST[prescription], '$date', '$treatment', '$insCost', '$patCost');";
			$result = mysqli_query($conn, $recQuery);
			
			//Prescription assigned to patient?
			$needPrescript = $_POST['prescriptionChoice'];
			if($needPrescript){
				$prescripID = $_POST['prescription'];
				$valuesQuery = "SELECT * FROM Products WHERE PrescriptionID=$prescripID";
				$result = mysqli_query($conn, $valuesQuery);
				$fetch = mysqli_fetch_assoc($result);
				$prescripQuery = "INSERT INTO `Prescriptions` (`PatientID`, `DocID`, `PrescriptionName`, `ScripDate`) VALUES ($_POST[appointments], $_SESSION[did], '$fetch[PrescriptionName]', '$date')";
				$result = mysqli_query($conn, $prescripQuery);
			} else {
				//do nothing?
				$prescripID = NULL;
			}
			
			$deductibleQuery = "SELECT * From InsPlans WHERE PlanID=$_SESSION[planID];";
			$result = mysqli_query($conn, $deductibleQuery);
			$row = mysqli_fetch_assoc($result);
			$deductible = intval($row['AnnualDeductible']);
			//Add treatment cost to table Costs
			$costQuery = "INSERT INTO `Costs` (`PatientID`, `PlanID`, `PrescriptionID`, `AppointmentID`, `Treatment`, `AllowedCost`, `InNetworkCoverage`, `OutNetworkCoverage`, `Deductible`) VALUES ($_POST[appointments], $_SESSION[planID], $prescripID, $appID, '$treatment', '$totCost', '$insCost', '0', '$deductible');";
			$result = mysqli_query($conn, $costQuery);

			unset($_SESSION['planID']);
		?>
		<p>Submitted patient records!</p>
		<?php endif; ?>
		
	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>