<?php

include "../../db.php";
$name = $_GET['CategoryName'];

$sql = "INSERT INTO categories(CategoryName)
        VALUES('$name')";

if($conn->query($sql)){

    echo json_encode([
        "success" => true,
        "message" => "Thêm category thành công"
    ]);

}else{

    echo json_encode([
        "success" => false
    ]);
}
?>