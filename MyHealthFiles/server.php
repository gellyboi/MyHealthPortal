<?php
	//Start the session
	session_start();
	error_reporting(0);
	include 'anotherconn.php';

	//========== Global Parameters ==========
	
	//Initialize relevant user data
	$firstname = "";
	$lastname = "";
	$ssn = "";
	$email = "";
	$phone = "";
	$dob = "";
	$address = "";
	$errorList = array();
	

	//========== Database Connection ==========
	$conn = new mysqli($servername, $username, "", "db2", $sqlport, $socket);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	//=========== Register User ===============
	//get form data
	if(isset($_POST['register'])){
		$firstname = mysqli_real_escape_string($conn, $_POST['firstname']);
		$lastname = mysqli_real_escape_string($conn, $_POST['lastname']);
		$ssn = mysqli_real_escape_string($conn, $_POST['ssn']);
		$phone = mysqli_real_escape_string($conn, $_POST['phone']);
		$dob = mysqli_real_escape_string($conn, $_POST['dob']);
		$address = mysqli_real_escape_string($conn, $_POST['address']);
		$email = mysqli_real_escape_string($conn, $_POST['email']);
		$password1 = mysqli_real_escape_string($conn, $_POST['password1']);
		$password2 = mysqli_real_escape_string($conn, $_POST['password2']);
		
		//check form data for errors, if found display error.
		//is empty ifs
		if(empty($firstname)){
			array_push($errorList, "Empty field in first name.");
		}
		if(empty($lastname)){
			array_push($errorList, "Empty field in last name.");
		}
		if(empty($ssn)){
			array_push($errorList, "Empty field in SSN.");
		}
		if(empty($phone)){
			array_push($errorList, "Empty field in Phone Number.");
		}
		if(empty($dob)){
			array_push($errorList, "Empty field in Date of Birth.");
		}
		if(empty($address)){
			array_push($errorList, "Empty field in address.");
		}
		if(empty($email)){
			array_push($errorList, "Empty field in email address.");
		}
		if(empty($password1)){
			array_push($errorList, "Empty field in password.");
		}
		if(empty($password2)){
			array_push($errorList, "Empty field in password.");
		}
		
		//check if passwords match
		if($password1 != $password2){
			array_push($errorList, "Passwords do not match.");
		} else {
			if(count($errorList) == 0){
				//make call to insert new user
				//first, get number of patient rows. new ID will be one plus this
				//shouldn't particularly matter how long this takes. as long as it gets done for just registering.
				$pQuery = "SELECT * FROM Patients WHERE 1";
				$result = mysqli_query($conn, $pQuery);
				$newID = mysqli_num_rows($result) + 1;
				//insert credentials
				$registerQuery = "INSERT INTO `Patients` (`PatientID`, `FirstName`, `LastName`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`) VALUES ($newID, '$firstname', '$lastname', '$ssn', '$dob', '$phone', '$email', '$address'); 
				INSERT INTO `Users` (`PID`, `Email`, `Password`) VALUES ($newID, '$email', '$password1');";
				mysqli_multi_query($conn, $registerQuery);
				//redirect to log in new data
				header('location: login.php');
			}
		}
	}
	
	//if all is well, insert credentials into Patients table and Users table
	
	
	//=========== Login User ===============
	//check login credentials
	//if match found, success! promote status to access homepage (index.php)
	if(isset($_POST['login'])){		//$_post index depends on name of form in login.php
		$email = mysqli_real_escape_string($conn, $_POST['email']);
		$password = mysqli_real_escape_string($conn, $_POST['password']);
		
		//are there empty fields?
		if(empty($email)){
			array_push($errorList, "Empty emails are not allowed.");
		}
		if(empty($password)){
			array_push($errorList, "Empty passwords are not allowed.");
		}
		//No errors? proceed.
		if(count($errorList) == 0){
			//Query patient DB for login credentials
			$pQuery = "SELECT * FROM Users WHERE Email='$email' AND Password='$password';";
			$result = mysqli_query($conn, $pQuery);
			$user = mysqli_fetch_assoc($result);
			
			//are credentials unique?
			if(mysqli_num_rows($result) == 1){
				//set session specific attributes.
				//get name of patient from "SELECT FirstName FROM Patients WHERE PatientID = $user['PID'];"
				$_SESSION['pid'] = $user['PID'];
				$pQuery = "SELECT * FROM Patients WHERE PatientID = $user[PID]";
				$result = mysqli_query($conn, $pQuery);
				$user = mysqli_fetch_assoc($result);
				$_SESSION['name'] = $user['FirstName'];
				$_SESSION['successMsg'] = "You are now logged in.";
				header('location: index.php');
			} else {
				//if no unique match, return errorMsg
				array_push($errorList, "Credentials do not match.");
			}
		}
	}
	
	//=========== Logout User ==================
	if(isset($_POST['logout'])){
		echo "Time to log out.";
		session_destroy();
		unset($_SESSION['name']);
		unset($_SESSION['pid']);
		header('location: login.php');
		
	}
	
?>