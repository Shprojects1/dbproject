<?php
session_start();
require 'db.php'; // this connects to the database

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $stmt = $pdo->prepare("SELECT * FROM Users WHERE Username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user["PasswordHash"])) {
        $_SESSION["user_id"] = $user["UserID"];
        $_SESSION["role"] = $user["Role"];
        header("Location: dashboard.php");
        exit;
    } else {
        echo "Invalid username or password.";
    }
}
?>
