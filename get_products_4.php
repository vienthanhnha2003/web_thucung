<?php
include "db.php";


// ====== NHẬN PARAM ======
$page       = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$category   = isset($_GET['category']) ? $_GET['category'] : '';
$keyword    = isset($_GET['keyword']) ? $_GET['keyword'] : '';
$minPrice   = isset($_GET['minPrice']) ? (float)$_GET['minPrice'] : 0;
$maxPrice   = isset($_GET['maxPrice']) ? (float)$_GET['maxPrice'] : 0;

// ====== PHÂN TRANG ======
$limit  = 6;
$offset = ($page - 1) * $limit;

// ====== BUILD WHERE ======
$whereArr = [];

// Lọc danh mục
if ($category != '') {
    $category = $conn->real_escape_string($category);
    $whereArr[] = "c.CategoryName = '$category'";
}

// Tìm kiếm tên
if ($keyword != '') {
    $keyword = $conn->real_escape_string($keyword);
    $whereArr[] = "p.Name LIKE '%$keyword%'";
}

// Giá sau khuyến mãi
$priceCondition = "(CASE 
                    WHEN p.IsPromotion = 1 
                    THEN p.Price - (p.Price * p.DiscountPercent / 100)
                    ELSE p.Price 
                  END)";

// Lọc giá từ
if ($minPrice > 0) {
    $whereArr[] = "$priceCondition >= $minPrice";
}

// Lọc giá đến
if ($maxPrice > 0) {
    $whereArr[] = "$priceCondition <= $maxPrice";
}

// Gộp WHERE
$where = "";
if (count($whereArr) > 0) {
    $where = "WHERE " . implode(" AND ", $whereArr);
}

// ====== ĐẾM TỔNG ======
$countSql = "SELECT COUNT(*) as total 
             FROM products p
             LEFT JOIN categories c ON p.CategoryID = c.CategoryID
             $where";

$countResult = $conn->query($countSql);

if (!$countResult) {
    echo json_encode(["error" => $conn->error]);
    exit;
}

$total = $countResult->fetch_assoc()['total'];
$totalPages = ceil($total / $limit);

// ====== QUERY DATA ======
$sql = "SELECT 
            p.ProductID,
            p.Name,
            p.Price,
            p.Stock,
            p.IsPromotion,
            p.DiscountPercent,
            c.CategoryName,
            pi.ImageURL,

            -- TÍNH GIÁ CUỐI
            $priceCondition AS FinalPrice

        FROM products p
        LEFT JOIN categories c 
            ON p.CategoryID = c.CategoryID
        LEFT JOIN productimages pi 
            ON p.ProductID = pi.ProductID AND pi.IsMain = 1
        $where
        ORDER BY p.ProductID DESC
        LIMIT $limit OFFSET $offset";

$result = $conn->query($sql);

if (!$result) {
    echo json_encode(["error" => $conn->error]);
    exit;
}

$products = [];

while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

// ====== RESPONSE ======
echo json_encode([
    "products" => $products,
    "totalPages" => $totalPages,
    "currentPage" => $page,
    "totalItems" => $total
]);
?>