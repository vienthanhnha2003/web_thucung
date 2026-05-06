<?php
include "db.php";

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 4; // mỗi lần load 4 sản phẩm
$offset = ($page - 1) * $limit;

/* TOTAL */
$totalSql = "
SELECT COUNT(DISTINCT p.ProductID) as total
FROM orderdetails od
JOIN orders o ON od.OrderID = o.OrderID
JOIN products p ON od.ProductID = p.ProductID
WHERE o.Status = 'Done'
";

$totalResult = $conn->query($totalSql)->fetch_assoc();
$totalRows = $totalResult['total'];
$totalPages = ceil($totalRows / $limit);

/* DATA */
$sql = "
SELECT 
    p.ProductID,
    p.Name,
    p.Price,
    p.IsPromotion,
    p.DiscountPercent,
    p.Stock,
    pi.ImageURL,
    SUM(od.Quantity) AS TotalSold

FROM orderdetails od
JOIN orders o ON od.OrderID = o.OrderID
JOIN products p ON od.ProductID = p.ProductID
LEFT JOIN productimages pi 
    ON p.ProductID = pi.ProductID AND pi.IsMain = 1

WHERE o.Status = 'Done'

GROUP BY p.ProductID

ORDER BY TotalSold DESC

LIMIT $limit OFFSET $offset
";

$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode([
    "products" => $data,
    "currentPage" => $page,
    "totalPages" => $totalPages
]);
?>