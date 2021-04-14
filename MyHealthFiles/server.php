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
	$conn = new mysqli($servername, $username, "", "db1", $sqlport, $socket);

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
	if(isset($_POST['login_user'])){		//$_post index depends on name of form in login.php
		$username = mysqli_real_escape_string($conn, $_POST['username']);
		$password = mysqli_real_escape_string($conn, $_POST['password']);
		
		//are there empty fields?
		if(empty($username)){
			array_push($errorList, "Empty usernames are not allowed.");
		}
		if(empty($password)){
			array_push($errorList, "Empty passwords are not allowed.");
		}
		//No errors? proceed.
		if(count($errorList) == 0){
			//Query patient DB for login credentials
			$pQuery = "SELECT * FROM Users WHERE Username='$username' AND Userpass='$password';";
			$result = mysqli_query($conn, $query);
			$user = mysqli_fetch_assoc($results);
			
			//are credentials unique?
			if(mysqli_num_rows($results) == 1){
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