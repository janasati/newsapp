<?php
include 'db_config.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if (!isset($_GET['author_id'])) {
    header('HTTP/1.1 400 Bad Request');
    echo json_encode(['error' => 'Missing author_id parameter']);
    exit;
}

$authorId = $_GET['author_id'];

if (!ctype_digit($authorId)) {
    header('HTTP/1.1 400 Bad Request');
    echo json_encode(['error' => 'Invalid author_id']);
    exit;
}

$authorId = (int)$authorId;

try {
    $stmt = $pdo->prepare("SELECT n.*, i.image_url FROM news n LEFT JOIN images i ON n.news_id = i.news_id WHERE n.author_id = ?");
    $stmt->execute([$authorId]);

    if ($stmt->rowCount() === 0) {
        header('HTTP/1.1 404 Not Found');
        echo json_encode(['error' => 'No news found for the specified author']);
        exit;
    }

    $news = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($news);
} catch (PDOException $e) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Failed to fetch news. Error: ' . $e->getMessage()]);
}
?>
