<?php
include "db.php";

$sql = "SELECT p.*, c.CategoryName 
        FROM products p 
        JOIN categories c ON p.CategoryID = c.CategoryID";

$result = $conn->query($sql);

$products = [];

while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode($products);
?>