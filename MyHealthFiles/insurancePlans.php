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
			<p class="itemize"><a href="appointments.php">Create Appointments</a></p>
			<p class="itemize"><a href="index.php">Purchase Pharmaceuticals</a></p>
			<p class="itemize"><a href="index.php">Review Your Insurance Plans</a></p>
			<p class="itemize"><a href="index.php">See Your Billing Statements</a></p>
			
			<form method="post" action="appointments.php">
				<button type="submit" name="logout">Sign Out</button>
			</form>
		</div>
		
		<div id="center-panel">
			<!-- MAIN BODY DIV WILL LIST CONVENIENT INFORMATION; PATIENT PROFILE MAYBE?... -->
			<!-- BASICALLY JUST ANOTHER TABLE RETURNED BY PRECANNED QUERY -->
			<!-- FOR INSURANCE PLANS, JOIN PROVIDER AND PLAN TABLES, TO DISPLAY RELEVANT INFORMATION -->
			<h2 class="top-text">Register for an insurance plan:</h2>
			<?php
				$iQuery = "SELECT * FROM InsPlans INNER JOIN InsProviders ON InsPlans.PlanID=InsProviders.PlanID;";
				$result = mysqli_query($conn, $iQuery);
				$i = 1;
			?>
			<!-- THEN IMPLEMENT REGISTRATION TO BE ABLE TO FILL OUT NECESSARY COLUMNS: APPDATE, APPTIME, WITH REASON -->
			<form method="post" action="insurancePlans.php">
				<?php while($row = mysqli_fetch_assoc($result)){  ?>
				
				<input type="radio" name="insChoice" value="<?php echo 200000000 + $i; ?>">
				<label for="insChoice">
				<?php echo $row['CompanyName']."; ".$row['Category']."; (".$row['PhoneNum'].")".
				"<br>Deductible: $".$row['AnnualDeductible'].", Annual Premium: $".$row['AnnualPremium'].", Annual Coverage: $".$row['AnnualCoverage'].", Lifetime Coverage: $".$row['LifetimeCoverage']; ?>
				</label>
				<br><br>
				<?php $i++;}; ?>
				<br>
				<div class="input-group">
					<button type="submit" name="registerPlan">Register for Plan</button>
				</div>
			</form>
			<?php 
			if(isset($_POST['registerPlan'])){
				$addPlan = "INSERT INTO `RegisteredPlans` (`PlanID`, `PatientID`) VALUES ($_POST[insChoice], $_SESSION[pid]);";
				$result = mysqli_query($conn, $addPlan);
			}
			
			?>
		</div>
		
		<!-- ADD A FOOTER HERE MAYBE -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>