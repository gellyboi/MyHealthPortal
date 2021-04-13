<?php
    session_start()
    if (!isset($_SESSION['name'])) {
        $_SESSION['msg'] = "Login required";
        header('location: login.php');
    }
    if (isset($_GET['logout'])) {
        session_destroy();
        unset($_SESSION['name']);
        header("location: login.php");
    }
?>
<?php
    include('server.php');
?>

<!DOCTYPE html>
<html>
<head>
    <title>My Health Portal</title>
</head>
<body>
    <h1>My Health Portal</h1>
</body>
</html>
