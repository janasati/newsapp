<?php
include 'db_config.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

try {
    // Check if 'author_name' is provided in the POST request
    if (!isset($_POST['author_name']) || empty($_POST['author_name'])) {
        // Return an error response if the parameter is missing or empty
        header('HTTP/1.1 400 Bad Request');
        echo json_encode(['error' => 'Missing or empty author_name parameter']);
        exit;
    }

    // Retrieve the author name from POST data
    $authorName = $_POST['author_name'];

    // Prepare and execute the SQL statement to insert the author
    $stmt = $pdo->prepare("INSERT INTO authors (author_name) VALUES (?)");
    $stmt->execute([$authorName]);

    // Set the response content type and send a success message
    header('Content-Type: application/json');
    echo json_encode(['message' => 'Author added successfully']);
} catch (PDOException $e) {
    // Handle any SQL or connection errors
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Failed to add author. Error: ' . $e->getMessage()]);
}
?>
