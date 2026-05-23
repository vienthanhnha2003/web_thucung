<?php

include "../../db.php";

$id = $_GET['CategoryID'];
$name = $_GET['CategoryName'];

$sql = "UPDATE categories
        SET CategoryName='$name'
        WHERE CategoryID=$id";

if($conn->query($sql)){

    echo json_encode([
        "success" => true,
        "message" => "Cập nhật category thành công"
    ]);

}else{

    echo json_encode([
        "success" => false
    ]);
}
?>