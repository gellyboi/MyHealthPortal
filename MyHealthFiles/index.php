<?php
    include('server.php');
	include('errorHandle.php');
?>
<?php
    //session_start();
    if (!isset($_SESSION['name'])){
        $_SESSION['msg'] = "Login required";
        header('location: login.php');
    }
    /*if (isset($_GET['logout'])) {
        session_destroy();
        unset($_SESSION['name']);
        header("location: login.php");
    }*/
?>


<!DOCTYPE html>
<html>
<head>
    <title>My Health Portal</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div id="header-panel">
		<h1 class="center-text">My Health Portal</h1>
	</div>
	
	<!-- PUT BELOW IN A DIV FOR A SIDE PANEL -->
	<div id="side-panel">
		<!-- Wouldn't be a bad idea to have if statements for when either a doctor or patient logs in. -->
		<!-- That way, we can add to the index page so that it's the index for patients AND doctors -->
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
		<p class="itemize"><a href="docAppointments.php">Submit Appointment Info</a></p>
		<?php endif; ?>
		
		<form method="post" action="index.php">
			<button type="submit" name="logout">Sign Out</button>
		</form>
	</div>
	
	<div id="center-panel">
		<!-- MAIN BODY DIV WILL LIST CONVENIENT INFORMATION; PATIENT PROFILE MAYBE?... -->
		<!-- BASICALLY JUST ANOTHER TABLE RETURNED BY PRECANNED QUERY -->
		
		<!-- PATIENT PROFILE SECTION -->
		<?php if(isset($_SESSION['pid'])) : ?>
			<?php
				//Check if patient has entries for selection service database
				$ssdbQuery = "SELECT * FROM SSDO WHERE PatientID=$_SESSION[pid];";
				$result = mysqli_query($connSSDB, $ssdbQuery);
				if(mysqli_num_rows($result) == 0){
					echo "<h2 class='top-text'>Warning! You need to select services for at least one Insurance Company and Pharmacy!</h2>";
				}
				$ssdbQuery = "SELECT * FROM SSDD WHERE PatientID=$_SESSION[pid];";
				$result = mysqli_query($connSSDB, $ssdbQuery);
				if(mysqli_num_rows($result) == 0){
					echo "<h2 class='top-text'>Warning! You need to select services from at least one Doctor!</h2>";
				}
			?>
			<?php 
				$profileQuery = "SELECT * FROM Patients WHERE PatientID=$_SESSION[pid];";
				$result = mysqli_query($conn, $profileQuery);
				$profile = mysqli_fetch_assoc($result);
			?>
			
			<h2 class="top-text">My Health Profile Overview:</h2>
			<p>Name: <?php echo "$profile[FirstName] $profile[LastName]";?></p>
			<p>Date of Birth: <?php echo $profile['DOB']; ?></p>
			<p>Email: <?php echo $profile['Email']; ?></p>
			<p>Phone: <?php echo $profile['PhoneNum']; ?></p>
			<p>Address: <?php echo $profile['Address']; ?></p>
			<br></br>
			
			<!-- LIST UPCOMING APPOINTMENTS & WITH WHOM -->
			<h2 class="top-text">Your Scheduled Appointments:</h2>
			
			<?php 
				$profileQuery = "SELECT * FROM Appointments WHERE PatientID=$_SESSION[pid];";
				$result = mysqli_query($conn, $profileQuery);
			?>
			
			<?php if (mysqli_num_rows($result) == 0) : ?>
				<p>No appointments scheduled.</p>
			<?php endif; ?>
			
			<?php if (mysqli_num_rows($result) > 0) : ?>
				
				<!-- NOW LIST THEM (QUERY SHOULD JOIN WITH DOCTOR TABLE, SO WE CAN GET A NAME) -->
				<?php 
					$aQuery = "SELECT AppDate, AppTime, Reason, FirstName, LastName, Email FROM Appointments INNER JOIN Doctors ON Doctors.DocID = Appointments.DocID WHERE PatientID=$_SESSION[pid];";
					$result = mysqli_query($conn, $aQuery);
					while($row = mysqli_fetch_assoc($result)){
				?>
				
				<p><?php echo $row['AppDate']." ".$row['AppTime'].", Dr. ".$row['FirstName']." ".$row['LastName'].", (".$row['Email'].")"; ?></p>
				<?php }; ?>
			<br></br>	
			<h2 class="top-text">Your Patient Records:</h2>
			<?php 
			$recQuery = "SELECT * FROM PatientRecords WHERE PatientID=$_SESSION[pid]";
			$recResult = mysqli_query($conn, $recQuery);
			if(mysqli_num_rows($recResult) == 0){
				echo "<p>You have no records at the moment.</p>";
			} else {
				while($row = mysqli_fetch_assoc($recResult)){
					echo "<p>Date: $row[RecDate], Treatment: $row[Treatment], Cost to Insurance: $$row[CostToIns], Cost to Patient: $$row[CostToPatient]</p>";
				}
			}
			?>
			
			<?php endif; ?>
		<?php elseif(isset($_SESSION['did'])) : ?>
			
			<?php
				//Lets get doctor's information
				$dQuery = "SELECT * FROM Doctors WHERE DocID=$_SESSION[did];";
				$result = mysqli_query($connDoc, $dQuery);
				$profile = mysqli_fetch_assoc($result);
				
			?>
			<!-- DOCTOR PROFILE SECTION -->
			<h2 class="top-text">My Health Profile Overview:</h2>
			<p>Name: <?php echo "$profile[FirstName] $profile[LastName]";?></p>
			<p>Date of Birth: <?php echo $profile['DOB']; ?></p>
			<p>Email: <?php echo $profile['Email']; ?></p>
			<p>Phone: <?php echo $profile['PhoneNum']; ?></p>
			<br></br>
			
			<!-- LIST UPCOMING APPOINTMENTS & WITH WHOM -->
			<h2 class="top-text">Your Scheduled Appointments:</h2>
			<?php 
				$profileQuery = "SELECT * FROM Appointments WHERE DocID=$_SESSION[did];";
				$result = mysqli_query($conn, $profileQuery);
			?>
			
			<?php if (mysqli_num_rows($result) == 0) : ?>
				<p>No appointments scheduled.</p>
			<?php endif; ?>
			
			<?php if (mysqli_num_rows($result) > 0) : ?>
				
				<!-- NOW LIST THEM (QUERY SHOULD JOIN WITH DOCTOR TABLE, SO WE CAN GET A NAME) -->
				<?php 
					$aQuery = "SELECT AppDate, AppTime, FirstName, LastName, Email FROM Appointments INNER JOIN Patients ON Patients.PatientID = Appointments.PatientID WHERE DocID=$_SESSION[did];";
					$result = mysqli_query($conn, $aQuery);
					while($row = mysqli_fetch_assoc($result)){
				?>
				
				<p><?php echo $row['AppDate']." ".$row['AppTime'].", ".$row['FirstName']." ".$row['LastName'].", (".$row['Email'].")"; ?></p>
				<?php }; ?>
			
			<?php endif; ?>
			<br></br>	
			<h2 class="top-text">Your Patients:</h2>
			<?php 
			$recQuery = "SELECT * FROM SSDD WHERE DocID=$_SESSION[did]";
			$recResult = mysqli_query($connSSDB, $recQuery);
			if(mysqli_num_rows($recResult) == 0){
				echo "<p>You have no patients at the moment.</p>";
			} else {
				while($row = mysqli_fetch_assoc($recResult)){
					$query = "SELECT * FROM Patients WHERE PatientID=$row[PatientID]";
					$result = mysqli_query($conn, $query);
					$pRow = mysqli_fetch_assoc($result);
					echo "<p>Name: $pRow[FirstName] $pRow[LastName], Date of Birth: $pRow[DOB], Phone: $pRow[PhoneNum], Email: $pRow[Email]</p>";
				}
			}
			?>
		
		<?php endif; ?>
		
		<!-- ADD ANOTHER SECTION TO LIST PATIENT RECORDS (RETRIEVE FROM PatientRecords) -->
		<!-- PatientRecords should have fields added to it once a doctor submits their notes from an appointment or approves a prescription -->
		
	</div>
	
	<!-- ADD A FOOTER HERE MAYBE -->
	<div id="footer-panel">
		<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
	</div>
	
</body>
</html>
