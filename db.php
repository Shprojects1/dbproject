<?php
$host = 'localhost';
$db = 'hospital_system'; // Change this to your database name
$user = 'root';          // Default for XAMPP
$pass = '';              // Default for XAMPP
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
