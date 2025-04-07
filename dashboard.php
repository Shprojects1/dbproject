<?php
session_start();
if (!isset($_SESSION["user_id"])) {
    header("Location: login.html");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Dashboard</title>
</head>
<body>
  <h1>Welcome to the Hospital System</h1>
  <p>Your role is: <?php echo $_SESSION["role"]; ?></p>
  <a href="logout.php">Logout</a>
</body>
</html>
