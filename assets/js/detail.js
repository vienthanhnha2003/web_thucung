$(document).ready(function(){

    loadProduct();
    loadRelated();

});

function loadProduct(){

    $.ajax({
        url: 'api/get_product_detail.php',
        method: 'GET',
        data: {
            id: productID
        },
        success: function(res){

            let p = JSON.parse(res);

            $("#productName").text(p.Name);

            $("#description").text(p.Description);

            $("#detailDescription").text(p.Description);

            $("#categoryName").text(p.CategoryName);

            $("#stock").text(p.Stock);

            let finalPrice = p.Price;

            if(p.IsPromotion == 1){

                let discount =
                    p.Price * p.DiscountPercent / 100;

                finalPrice = p.Price - discount;

                $("#oldPrice").html(
                    p.Price + ' đ'
                );

            }

            $("#newPrice").html(
                finalPrice + ' đ'
            );

            // IMAGE

            if(p.images.length > 0){
        let anhdau = p.images[0].ImageURL ? "images/" + p.images[0].ImageURL : "images/noimages.jpg";
                $("#mainImage").attr(
                    "src",
                    anhdau
                );

                let html = "";

                p.images.forEach(img => {
let anhketiep = img.ImageURL ? "images/" + img.ImageURL : "images/noimages.jpg";
                    html += `
                    <img src="${anhketiep}"
                         class="thumb-image"
                         onclick="
                         changeImage('${anhketiep}')
                         ">
                    `;

                });

                $("#thumbnailList").html(html);

            }

        }
    });

}

function changeImage(src){

    $("#mainImage").attr("src", src);

}

function loadRelated(){

    $.ajax({

        url: 'api/get_related_products.php',

        method: 'GET',

        data: {
            id: productID
        },

        success: function(res){

            let data = JSON.parse(res);

            let html = "";

            data.forEach(p => {

                let price = p.Price;

                if(p.IsPromotion == 1){

                    price = p.Price -
                    (p.Price * p.DiscountPercent / 100);

                }

                html += `
                <div class="col-md-3 mb-4">

                    <div class="card product-card h-100">

                        <img src="https://placehold.co/300x250"
                             class="card-img-top">

                        <div class="card-body">

                            <h6>${p.Name}</h6>

                            <div class="text-danger fw-bold">
                                ${price} đ
                            </div>

                            <a href="product-detail.php?id=${p.ProductID}"
                               class="btn btn-primary w-100 mt-3">
                               Xem chi tiết
                            </a>

                        </div>

                    </div>

                </div>
                `;

            });

            $("#relatedProducts").html(html);

        }

    });

}