<?php

include "../../db.php";

if(!isset($_GET['CategoryID'])){

    echo json_encode([
        "success" => false,
        "message" => "Thiếu CategoryID"
    ]);

    exit();
}

$id = $_GET['CategoryID'];

$sql = "DELETE FROM categories
        WHERE CategoryID = $id";

if($conn->query($sql)){

    echo json_encode([
        "success" => true,
        "message" => "Xóa category thành công"
    ]);

}else{

    echo json_encode([
        "success" => false,
        "message" => "Xóa thất bại"
    ]);
}
?>