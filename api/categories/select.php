<?php

include "../../db.php";

$sql = "SELECT * FROM categories";

$result = $conn->query($sql);

$data = [];

while($row = $result->fetch_assoc()){

    $data[] = $row;
}

echo json_encode($data);
?>