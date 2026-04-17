<?php
include "db.php";

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 12; // số sản phẩm mỗi trang
$offset = ($page - 1) * $limit;

// Đếm tổng sản phẩm
$countSql = "SELECT COUNT(*) as total FROM products";
$countResult = $conn->query($countSql);
$total = $countResult->fetch_assoc()['total'];

$totalPages = ceil($total / $limit);

// Lấy dữ liệu theo trang
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