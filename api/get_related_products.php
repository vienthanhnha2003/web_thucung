<?php
include("../db.php");

$id = $_GET['id'];

$getCategory = "
SELECT CategoryID 
FROM products 
WHERE ProductID = $id
";

$categoryResult = $conn->query($getCategory);
$category = $categoryResult->fetch_assoc()['CategoryID'];

$sql = "
SELECT *
FROM products
WHERE CategoryID = $category
AND ProductID != $id
LIMIT 8
";

$result = $conn->query($sql);

$data = [];

while($row = $result->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);
?>