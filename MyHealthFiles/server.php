<?php
	//Start the session
	session_start();
	//error_reporting(0);
	include 'includes/dbconn.php';

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
	$errors = array();
	

	//========== Database Connection ==========
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
	
	//if no match, return errorMsg
	
	//if match found, success! promote status to access homepage (index.php)
	
	
	
?>