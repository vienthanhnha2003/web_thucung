<?php
$id = $_GET['id'];
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="container py-5">

    <div class="row">

        <!-- IMAGE -->
        <div class="col-md-5">

            <div class="main-image">
                <img id="mainImage" src="" class="img-fluid rounded shadow">
            </div>

            <div class="d-flex mt-3 gap-2" id="thumbnailList">

            </div>

        </div>

        <!-- INFO -->
        <div class="col-md-7">

            <h2 id="productName"></h2>

            <div class="mb-3 text-warning">
                ★★★★☆
            </div>

            <div class="mb-3">
                <span class="old-price" id="oldPrice"></span>

                <span class="new-price" id="newPrice"></span>
            </div>

            <div class="mb-3">
                Danh mục:
                <strong id="categoryName"></strong>
            </div>

            <div class="mb-3">
                Kho:
                <span id="stock"></span>
            </div>

            <div class="mb-4">
                <p id="description"></p>
            </div>

            <div class="d-flex gap-3">

                <input type="number" min="1" value="1"
                       class="form-control w-25" id="qty">

                <button class="btn btn-primary px-4" id="addCart">
                    🛒 Thêm vào giỏ
                </button>

                <button class="btn btn-outline-danger">
                    ❤
                </button>

            </div>

        </div>

    </div>

    <!-- TAB -->
    <div class="mt-5">

        <ul class="nav nav-tabs">

            <li class="nav-item">
                <button class="nav-link active"
                        data-bs-toggle="tab"
                        data-bs-target="#desc">
                    Mô tả
                </button>
            </li>

            <li class="nav-item">
                <button class="nav-link"
                        data-bs-toggle="tab"
                        data-bs-target="#review">
                    Đánh giá
                </button>
            </li>

        </ul>

        <div class="tab-content border p-4">

            <div class="tab-pane fade show active"
                 id="desc">

                <p id="detailDescription"></p>

            </div>

            <div class="tab-pane fade"
                 id="review">

                <h5>Khách hàng đánh giá</h5>

                <div class="border rounded p-3 mt-3">
                    Sản phẩm rất tốt ❤️
                </div>

            </div>

        </div>

    </div>

    <!-- RELATED -->
    <div class="mt-5">

        <h3 class="mb-4">
            Sản phẩm tương tự
        </h3>

        <div class="row" id="relatedProducts">

        </div>

    </div>

</div>

<script>
const productID = <?php echo $id; ?>;
</script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/detail.js"></script>

</body>
</html>