<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Shop sản phẩm</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #f5f5fa;
    font-family: 'Segoe UI', sans-serif;
}

/* HEADER */
.header {
    background: #1a94ff;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-weight: bold;
    font-size: 18px;
}

.actions {
    display: flex;
    gap: 20px;
    align-items: center;
}

.cart {
    position: relative;
}

.cart-badge {
    position: absolute;
    top: -5px;
    right: -10px;
    background: red;
    color: white;
    font-size: 12px;
    border-radius: 50%;
    padding: 2px 6px;
}

/* SIDEBAR */
.sidebar {
    background: white;
    padding: 15px;
    border-radius: 8px;
}

.category-item {
    padding: 8px;
    cursor: pointer;
    border-radius: 5px;
}

.category-item:hover {
    background: #e6f2ff;
    color: #1a94ff;
}

.category-item.active {
    background: #dbeafe;
    font-weight: bold;
}

/* PRODUCT */
.product-card {
    border-radius: 10px;
    height: 100%;
}

.product-card:hover {
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.badge-sale {
    position: absolute;
    top: 10px;
    left: 10px;
    background: red;
    color: white;
    padding: 3px 8px;
    border-radius: 5px;
}

.price {
    color: #ff424e;
    font-weight: bold;
}

.old-price {
    text-decoration: line-through;
    color: gray;
    font-size: 13px;
}

/* FOOTER */
.footer {
    margin-top: 40px;
    background: #0b74e5;
    color: white;
    text-align: center;
    padding: 20px;
}
.product-img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">🐾 Pet Shop</div>

    <div class="actions">
        <div>👤 Tài khoản</div>
        <div class="cart">
            🛒 Giỏ hàng
            <span class="cart-badge">3</span>
        </div>
    </div>
</div>

<div class="container mt-3">
    <div class="row">

        <!-- SIDEBAR -->
        <div class="col-md-3">
            <div class="sidebar">

                <h6>Danh mục</h6>
                <div id="category-list"></div>

                <hr>

                <input type="text" id="search" class="form-control mb-2" placeholder="🔍 Tìm sản phẩm...">

                <h6 class="mt-3">Lọc theo giá</h6>
                <input type="number" id="minPrice" class="form-control mb-2" placeholder="Giá từ">
                <input type="number" id="maxPrice" class="form-control" placeholder="Đến">

            </div>
        </div>

       <div class="col-md-9">
        <div class="row" id="product-list"></div>
       
    </div>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Shop thú cưng
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
let isLoading = false;
let allProducts = [];
let currentCategory = "";
let currentPage = 1;
let totalPages = 1;

$(document).ready(function () {
    loadData(1, true);
    loadDataDanhMuc();

    $("#search").on("keyup", filterProducts);
    $("#minPrice, #maxPrice").on("input", filterProducts);

   $(window).scroll(function () {

    if (isLoading) return;

    // Khi scroll gần cuối trang
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {

        if (currentPage < totalPages) {
            isLoading = true;
            loadData(currentPage + 1, false);
        }
    }
});
});


function loadDataDanhMuc() {
    $.get("get_danh_muc.php", function (data) {
        allProducts = JSON.parse(data);

        renderCategories(allProducts);
        
    });
}
function loadData(page = 1, reset = false) {
    $.get("get_products.php?page=" + page, function (data) {
        let res = JSON.parse(data);

        let newProducts = res.products;

        totalPages = res.totalPages;
        currentPage = res.currentPage;

        if (reset) {
            allProducts = newProducts;
            $("#product-list").html("");
        } else {
            allProducts = allProducts.concat(newProducts);
        }

        renderProducts(allProducts);

        isLoading = false;
    });
}
function renderCategories(products) {
    let categories = [...new Set(products.map(p => p.CategoryName))];

    let html = `<div class="category-item active" data-value="">Tất cả</div>`;

    categories.forEach(c => {
        html += `<div class="category-item" data-value="${c}">${c}</div>`;
    });

    $("#category-list").html(html);

    $(".category-item").click(function () {
        $(".category-item").removeClass("active");
        $(this).addClass("active");

        currentCategory = $(this).data("value");
        filterProducts();
    });
}

function filterProducts() {
    let keyword = $("#search").val().toLowerCase();
    let min = parseFloat($("#minPrice").val()) || 0;
    let max = parseFloat($("#maxPrice").val()) || Infinity;

    let filtered = allProducts.filter(p => {

        let price = parseFloat(p.Price);

        if (p.IsPromotion == 1) {
            price = price - (price * p.DiscountPercent / 100);
        }

        return (
            p.Name.toLowerCase().includes(keyword) &&
            (currentCategory === "" || p.CategoryName === currentCategory) &&
            price >= min &&
            price <= max
        );
    });

    renderProducts(filtered);
}

function renderProducts(products) {
    let html = "";

    if (products.length === 0) {
        html = `<p class="text-center">Không có sản phẩm</p>`;
    }

    products.forEach(p => {

        let price = parseFloat(p.Price);
        let finalPrice = price;

        if (p.IsPromotion == 1) {
            finalPrice = price - (price * p.DiscountPercent / 100);
        }
        let anh='';
        if(p.ImageURL==null){
            anh="images/noimages.jpg"
        }else{
            anh="images/"+p.ImageURL
        }
        html += `
        <div class="col-md-4 mb-3">
            <div class="card product-card position-relative">

                ${p.IsPromotion == 1 ? `<div class="badge-sale">-${p.DiscountPercent}%</div>` : ""}
  <!-- HÌNH ẢNH -->
                <img src="${anh}" class="product-img" alt="No Images">
                <div class="card-body">
                    <div>
                        <h6>${p.Name}</h6>
                        <small>${p.CategoryName}</small>

                        <div class="mt-2">
                        ${
                            p.IsPromotion == 1 ?
                            `<span class="old-price">${price.toLocaleString()} đ</span><br>
                             <span class="price">${finalPrice.toLocaleString()} đ</span>`
                            :
                            `<span class="price">${price.toLocaleString()} đ</span>`
                        }
                        </div>

                        <small>📦 ${p.Stock}</small>
                    </div>

                    <button class="btn btn-primary btn-sm mt-2 w-100">
                        Thêm vào giỏ
                    </button>
                </div>
            </div>
        </div>
        `;
    });

    $("#product-list").html(html);
}
</script>

</body>
</html>