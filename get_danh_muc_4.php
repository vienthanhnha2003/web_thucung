<?php
include "db.php";

$sql = "SELECT CategoryID, CategoryName FROM categories";

$result = $conn->query($sql);

$categories = [];

while ($row = $result->fetch_assoc()) {
    $categories[] = $row;
}

echo json_encode($categories);
?>