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
    <!-- WE WANT PATIENT TO BE ABLE TO MAKE CHOICES OF DOCTORS, INSURANCE COMPANIES, AND PHARMACIES -->
    <!-- CHOICE OF INSURANCE COMPANY AND PHARMACY NEEDS TO BE MADE ALL AT ONCE FOR SSDO TABLE -->

    <!-- DOCTOR CHOICE IS INDEPENDENT OF OTHER TWO, TO BE PUT INTO SSDD TABLE -->
    <!-- $connSSDB is the selection service database connection -->
    <!-- Need to get insurance and pharmacy data from patient database ($conn) -->
    <?php
      $insQuery = "SELECT * FROM InsProviders";
      $pharmQuery = "SELECT * FROM Pharmacies";
      $insResult = mysqli_query($conn, $insQuery);
      $pharmResult = mysqli_query($conn, $pharmQuery);
    ?>

    <!-- One to One ratio of plans to providers to make it simpler -->
		<h2 class="top-text">Choose an Insurance Company and Pharmacy:</h2>
      <form method="post" action="serviceSelection.php">
        <label for="insCompany">Insurance Companies:</label>  
        <select name="insCompany">
          <?php while($row = mysqli_fetch_assoc($insResult)){  ?>
						<option value=<?php echo $row['CompanyID']; ?>><?php echo $row['CompanyName'].", ".$row['Category'].", (".$row['Email'].")"; ?></option>
        </select>
          <br>
        <label for="pharmacy">Pharmacies:</label>
        <select name="pharmacy">
          <?php while($row = mysqli_fetch_assoc($pharmResult)){  ?>
						<option value=<?php echo $row['PharmacyID']; ?>><?php echo $row['PharmacyName'].", ".$row['PhoneNum'].", (".$row['Address'].")"; ?></option>
        </select>
        <div class="input-group">
					<button type="submit" name="SSDOChoice">Submit Choices</button>
				</div>
      </form>

    <?php if(isset($_POST['SSDOChoice'])){
      //Insert to SERVICE SELECTION DATABASE
      $insID = $_POST['insCompany'];
      $pharmID = $_POST['pharmacy'];
      
      //Let's make sure there's no duplicates
      $SSDOQuery = "SELECT * FROM SSDO WHERE PatientID=$_SESSION[pid] AND InsuranceID=$insID AND PharmacyID=$pharmID;";
      $SSDOResult = mysqli_query($connSSDB, $SSDOQuery);

      if(mysqli_num_rows($SSDOResult) == 0){
        //make da query LESS GOOOOO
        $SSDOQuery = "INSERT INTO `SSDO`(`PatientID`, `InsuranceID`, `PharmacyID`) VALUES ($_SESSION[pid], $insID, $pharmID);";
        $SSDOResult = mysqli_query($connSSDB, $SSDOQuery);
      } else {
		echo "<p>You already chose this service!</p>";
	  }
        
    } ?>
      
    <?php if(mysqli_affected_rows($connSSDB) > 0) : ?>
    <p>Successfully added services!</p>
    <?php endif; ?>
    <!-- That should do it for the SSDO table entry handling -->

    <?php
    $docQuery = "SELECT * FROM Doctors";
    $docResult = mysqli_query($connDoc, $docQuery);
    ?>

    <h2 class="top-text">Choose a Doctor</h2>
    <form method="post" action="serviceSelection.php">
      <label for="doctors">Insurance Companies:</label>  
      <select name="doctors">
        <?php while($row = mysqli_fetch_assoc($docResult)){  ?>
          <option value=<?php echo $row['DocID']; ?>>Dr. <?php echo $row['FirstName'].", ".$row['LastName'].", (".$row['Email'].")"; ?></option>
        <?php $i++;}; ?>
      </select>
      <div class="input-group">
        <button type="submit" name="SSDDChoice">Submit Choice</button>
      </div>
    </form>

    <?php if(isset($_POST['SSDDChoice'])){
      //Insert to SERVICE SELECTION DATABASE
      $docID = $_POST['doctors'];
	  
	  //Let's make sure there's no duplicates
      $SSDDQuery = "SELECT * FROM SSDO WHERE PatientID=$_SESSION[pid] AND DocID=$docID;";
      $SSDDResult = mysqli_query($connSSDB, $SSDDQuery);
	  
	  if(mysqli_num_rows($SSDDResult) == 0){
		//make da query LESS GOOOOO
		$SSDDQuery = "INSERT INTO `SSDD`(`PatientID`, `DocID`) VALUES ($_SESSION[pid], $docID);";
		$SSDDResult = mysqli_query($connSSDB, $SSDDQuery);
	  } else {
		echo "<p>You already chose this service!</p>";
	  }
      
    } ?>
    <?php if(mysqli_affected_rows($connSSDB) > 0) : ?>
    <p>Successfully added doctor!</p>
    <?php endif; ?>

	</div>
	
	<!-- FOOTER PANEL -->
		<div id="footer-panel">
			<h3>Created by: Ryan Buckel, Christian Whitfield</h3>
		</div>
	</body>
</html>