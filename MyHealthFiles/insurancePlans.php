<?php include 'server.php'; ?>
<?php include 'errorHandle.php'; ?>

<!DOCTYPE html>
</html>
	<head>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<div id="header-panel">
			<h1 class="center-text">My Health Portal</h1>
		</div>
		
		<!-- PUT BELOW IN A DIV FOR A SIDE PANEL -->
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
			
			<form method="post" action="appointments.php">
				<button type="submit" name="logout">Sign Out</button>
			</form>
		</div>
		
		<div id="center-panel">
			<!-- MAIN BODY DIV WILL LIST CONVENIENT INFORMATION; PATIENT PROFILE MAYBE?... -->
			<!-- BASICALLY JUST ANOTHER TABLE RETURNED BY PRECANNED QUERY -->
			<!-- FOR INSURANCE PLANS, JOIN PROVIDER AND PLAN TABLES, TO DISPLAY RELEVANT INFORMATION -->
			<h2 class="top-text">Register for an insurance plan:</h2>
			<!-- THEN IMPLEMENT REGISTRATION TO BE ABLE TO FILL OUT NECESSARY COLUMNS: APPDATE, APPTIME, WITH REASON -->
			<form method="post" action="insurancePlans.php">
				<?php 
				
				
				$query = "SELECT * FROM SSDO WHERE PatientID=$_SESSION[pid]";
				$result = mysqli_query($connSSDB, $query);
				while($row = mysqli_fetch_assoc($result)){ 
					$_SESSION['compID'] = $row['InsuranceID'];
				?>
				<input type="radio" name="insChoice" value="<?php echo $row['InsuranceID'] - 100000000; ?>">
				<label for="insChoice">
				<?php 
					$iQuery = "SELECT * FROM InsPlans INNER JOIN InsProviders ON InsPlans.PlanID=InsProviders.PlanID WHERE CompanyID=$row[InsuranceID];";
					$iResult = mysqli_query($conn, $iQuery);
					$iRow = mysqli_fetch_assoc($iResult);
					echo $iRow['CompanyName']."; ".$iRow['Category']."; (".$iRow['PhoneNum'].")"."<br>Deductible: $".$iRow['AnnualDeductible'].", Annual Premium: $".$iRow['AnnualPremium'].", Annual Coverage: $".$iRow['AnnualCoverage'].", Lifetime Coverage: $".$iRow['LifetimeCoverage']; ?>
				</label>
				<br><br>
				<?php }; ?>
				<br>
				<div class="input-group">
					<button type="submit" name="registerPlan">Register for Plan</button>
				</div>
			</form>
			<?php 
			if(isset($_POST['registerPlan'])){
				$planQuery = "SELECT * FROM RegisteredPlans WHERE PatientID=$_SESSION[pid] AND PlanID=$_POST[insChoice]";
				$planResult = mysqli_query($conn, $planQuery);
				
				if(mysqli_num_rows($planResult) == 0){
				$getValsQuery = "SELECT * FROM InsPlans WHERE PlanID=$_POST[insChoice]";
				$valResult = mysqli_query($conn, $getValsQuery);
				$row = mysqli_fetch_assoc($valResult);
				$premium = intval($row['AnnualPremium']);
				$deductible = intval($row['AnnualDeductible']);
				$coverage = intval($row['AnnualCoverage']);
				$CostQuery = "INSERT INTO Costs (PatientID, PlanID, AllowedCost, InNetworkCoverage, OutNetworkCoverage, Deductible) VALUES ($_SESSION[pid], $_POST[insChoice], '$premium', '$coverage', '0', '$deductible');";
				$result = mysqli_query($conn, $CostQuery);
				$addPlan = "INSERT INTO `RegisteredPlans` (`PlanID`, `PatientID`) VALUES ($_POST[insChoice], $_SESSION[pid]);";
				$result = mysqli_query($conn, $addPlan);
				$deleteOldPlan = "DELETE FROM `RegisteredPlans` WHERE PatientID=$_SESSION[pid] AND NOT PlanID=$_POST[insChoice];";
				$result = mysqli_query($conn, $deleteOldPlan);
				$removeFromCosts = "DELETE FROM Costs WHERE PatientID=$_SESSION[pid] AND NOT PlanID=$_POST[insChoice] AND PrescriptionID IS NULL AND PharmacyID IS NULL AND AppointmentID IS NULL;";
				$result = mysqli_query($conn, $removeFromCosts);
				echo "<p>Plan successfully registered!</p>";
				unset($_SESSION['compID']);
				} else {
					echo "<p>Already Registered for plan!</p>";
				}
			}
			
			?>
		</div>
		
		<!-- ADD A FOOTER HERE MAYBE -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>