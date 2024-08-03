<?php
// Define database connection details
$host = 'fdb1030.awardspace.net';        // Replace with your database host
$dbname = '4510393_news';   // Replace with your database name
$username = '4510393_news'; // Replace with your database username
$password = 'New12345@'; // Replace with your database password

try {
    // Create a new PDO instance with the connection details
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    // Set PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Handle connection error
    die('Database connection failed: ' . $e->getMessage());
}
?>
