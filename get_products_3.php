<?php
include "db.php";

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$category = isset($_GET['category']) ? $_GET['category'] : '';

$limit = 3;
$offset = ($page - 1) * $limit;

// Điều kiện WHERE
$where = "";
if ($category != '') {
    $category = $conn->real_escape_string($category);
    $where = "WHERE c.CategoryName = '$category'";
}

// Đếm tổng
$countSql = "SELECT COUNT(*) as total 
             FROM products p
             LEFT JOIN categories c ON p.CategoryID = c.CategoryID
             $where";

$countResult = $conn->query($countSql);
$total = $countResult->fetch_assoc()['total'];

$totalPages = ceil($total / $limit);

// Query chính
$sql = "SELECT 
            p.ProductID,
            p.Name,
            p.Price,
            p.Stock,
            p.IsPromotion,
            p.DiscountPercent,
            c.CategoryName,
            pi.ImageURL
        FROM products p
        LEFT JOIN categories c 
            ON p.CategoryID = c.CategoryID
        LEFT JOIN productimages pi 
            ON p.ProductID = pi.ProductID AND pi.IsMain = 1
        $where
        LIMIT $limit OFFSET $offset";

$result = $conn->query($sql);

$products = [];

while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode([
    "products" => $products,
    "totalPages" => $totalPages,
    "currentPage" => $page
]);
?>