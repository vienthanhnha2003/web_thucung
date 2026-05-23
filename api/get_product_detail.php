<?php
include("../db.php");

$id = $_GET['id'];

$sql = "
SELECT 
    p.*,
    c.CategoryName
FROM products p
LEFT JOIN categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductID = $id
";

$result = $conn->query($sql);

$product = $result->fetch_assoc();

$imageSql = "
SELECT * 
FROM productimages
WHERE ProductID = $id
ORDER BY IsMain DESC
";

$imageResult = $conn->query($imageSql);

$images = [];

while($row = $imageResult->fetch_assoc()){
    $images[] = $row;
}

$product['images'] = $images;

echo json_encode($product);
?>