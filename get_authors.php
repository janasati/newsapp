<?php

// Include the database configuration
include 'db_config.php'; // Ensure this path is correct

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");


// Check if $pdo is defined
if (!isset($pdo)) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Database connection not established.']);
    exit;
}

try {
    // Prepare and execute the query to fetch authors
    $stmt = $pdo->prepare("SELECT author_id, author_name FROM authors");
    $stmt->execute();

    // Fetch all authors
    $authors = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch news articles for each author
    foreach ($authors as &$author) {
        $authorId = $author['author_id'];

        // Prepare and execute the query to fetch news for the author
        $stmt = $pdo->prepare("SELECT * FROM news WHERE author_id = ?");
        $stmt->execute([$authorId]);

        // Fetch all news articles for the author
        $news = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Attach news articles to the author
        $author['news'] = $news;
    }

    // Set the content type to JSON
    header('Content-Type: application/json');
    // Output the authors and their news as JSON
    echo json_encode($authors);
} catch (PDOException $e) {
    // Handle query errors
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Failed to fetch authors and news. Error: ' . $e->getMessage()]);
}
?>
