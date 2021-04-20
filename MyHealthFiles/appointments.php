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
			<p class="itemize"><a href="index.php">Request a Test</a></p>
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
			<!-- FOR APPOINTMENTS WE WANT TO BE ABLE TO CHOOSE DOCTORS TO MAKE APPOINTMENTS WITH, SO LIST THE DOCTORS -->
			<h2 class="top-text">Choose a doctor to make an appointment with, and fill in other necessary information:</h2>
			<?php
				$dQuery = "SELECT * FROM Doctors WHERE 1;";
				$result = mysqli_query($conn, $dQuery);
				$i = 1;
			?>
			<!-- THEN IMPLEMENT REGISTRATION TO BE ABLE TO FILL OUT NECESSARY COLUMNS: APPDATE, APPTIME, WITH REASON -->
			<form method="post" action="appointments.php">
				<label for="docs">Choose a Doctor:</label>
				<select name="docs">
					<?php while($row = mysqli_fetch_assoc($result)){  ?>
						<option value=<?php echo 100000000 + $i; ?>>Dr. <?php echo $row['FirstName']." ".$row['LastName'].",&nbsp;&nbsp;&nbsp;&nbsp;(".$row['Email'].")"; ?></option>
					<?php $i++;}; ?>
				</select><br>
				<div class="input-group">
					<label>Appointment Date:</label>
					<input type="date" name="appDate">
				</div>
				<div class="input-group">
					<label>Appointment Time:</label>
					<input type="time" name="appTime">
				</div>
				<div class="input-group">
					<label>Reason:</label>
					<input type="text" name="reason">
				</div>
				<div class="input-group">
					<button type="submit" name="makeAppointment">Create Appointment</button>
				</div>
			</form>
			<?php 
			if(isset($_POST['makeAppointment'])){
				$aQuery = "SELECT AppointmentID FROM Appointments WHERE 1;";
				$result = mysqli_query($conn, $aQuery);
				$appointmentID = 1 + mysqli_num_rows($result);
				$addAppointment = "INSERT INTO `Appointments` (`AppointmentID`, `PatientID`, `DocID`, `AppDate`, `AppTime`, `Reason`) VALUES ($appointmentID, $_SESSION[pid], $_POST[docs], '$_POST[appDate]', '$_POST[appTime]', '$_POST[reason]');";
				$result = mysqli_query($conn, $addAppointment);
				echo "$_POST[docs]";
			}
			?>
		</div>
		
		<!-- ADD A FOOTER HERE MAYBE -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>