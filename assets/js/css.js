
<style>

h1 {
  color: white;
  text-align: center;
}

p {
  font-family: verdana;
  font-size: 20px;
}
body{
    background:#f5f5f5;
}

.main-image img{
    width:100%;
    height:500px;
    object-fit:cover;
}

.thumb-image{
    width:90px;
    height:90px;
    object-fit:cover;
    border-radius:10px;
    cursor:pointer;
    border:2px solid #ddd;
    transition:0.3s;
}

.thumb-image:hover{
    transform:scale(1.05);
    border-color:#0d6efd;
}

.old-price{
    text-decoration: line-through;
    color:gray;
    font-size:20px;
    margin-right:10px;
}

.new-price{
    color:red;
    font-size:32px;
    font-weight:bold;
}

.product-card{
    border:none;
    border-radius:15px;
    overflow:hidden;
    transition:0.3s;
}

.product-card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

.product-card img{
    height:220px;
    object-fit:cover;
}
</style>
