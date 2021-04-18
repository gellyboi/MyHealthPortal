<?php
	//Start the session
	session_start();
	error_reporting(0);
	include 'anotherconn.php';

	//========== Global Parameters ==========

	/*$msgIndex = 0;

	$targetDB = '';
	$querytype = 'sql';
	$inputQuery = '';

	$tableName = '';
	$selection = '';

	$search_result = null;
	$errorMsg = array('');
	$successMsg = array('');
	$defaultTables = ['information_schema'];*/
	
	//Initialize relevant user data
	$firstName = "";
	$lastName = "";
	$ssn = "";
	$email = "";
	$phone = "";
	$dob = "";
	$address = "";
	$errorList = array();
	

	//========== Database Connection ==========
	//$socket = "/vols/sdb7/httpdh3_db/httpdh3_db.sock";
	//$servername = "localhost";
	//$username = "httpdh3";
	//$sqlport = "3309";
	$conn = new mysqli($servername, $username, "", "db2", $sqlport, $socket);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	//=========== Register User ===============
	//get form data
	
	//check form data for errors, if found display error.
	//is empty ifs
	
	//is password confirmation correct
	
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
			$pQuery = "SELECT * FROM Users WHERE Email='$username' AND Password='$password';";
			$result = mysqli_query($conn, $pQuery);
			$user = mysqli_fetch_assoc($result);
			
			//are credentials unique?
			if(mysqli_num_rows($result) == 1){
				//set session specific attributes.
				$_SESSION['name'] = $username;
				$_SESSION['pid'] = $user['PID'];
				$_SESSION['successMsg'] = "You are now logged in.";
				header('location: index.php');
			} else {
				//if no unique match, return errorMsg
				array_push($errorList, "Credentials do not match.");
			}
		}
	}
	
	
	
	
?>