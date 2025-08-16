<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/default/header.jsp" %>

<div class="product-container">
    <h1 class="page-title">Tất cả sản phẩm</h1>
    <a href="http://localhost:8080/FoodandDrink/products" class="btn-back">⬅ Quay lại</a>
    <c:if test="${empty allProducts}">
        <div class="no-product">Chưa có sản phẩm nào trong hệ thống.</div>
    </c:if>

    <div class="product-grid">
        <c:forEach var="p" items="${allProducts}">
            <div class="product-card">
                <c:if test="${not empty p.imageUrl}">
                    <img src="${p.imageUrl}" alt="${p.name}" class="product-image"/>
                </c:if>
                <div class="product-info">
                    <h2 class="product-name">${p.name}</h2>
                    <p class="product-price">${p.price} VNĐ</p>
                    <p class="product-stock">Số lượng: ${p.stockQuantity}</p>

                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="/default/footer.jsp" %>

<style>
    /* Reset mặc định */
    body {
        margin: 0;
        padding: 0;
    }

    /* Khu vực sản phẩm */
    .product-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
        background: #fafafa;
        min-height: 80vh;
        box-sizing: border-box;
    }

    .page-title {
        text-align: center;
        font-size: 30px;
        font-weight: 700;
        color: #2c3e50;
        margin-bottom: 35px;
    }

    /* Khi không có sản phẩm */
    .no-product {
        text-align: center;
        background: #fff3cd;
        color: #856404;
        padding: 15px;
        border-radius: 8px;
        font-size: 16px;
        max-width: 400px;
        margin: 0 auto 30px auto;
    }

    /* Grid layout */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 25px;
    }

    /* Card style */
    .product-card {
        background: #ffffff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .product-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    /* Image */
    .product-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    /* Info */
    .product-info {
        padding: 18px;
        text-align: center;
    }

    .product-name {
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 12px;
        color: #2c3e50;
        height: 48px;
        overflow: hidden;
    }

    .product-price {
        font-size: 16px;
        font-weight: bold;
        color: #e74c3c;
        margin-bottom: 6px;
    }

    .product-stock {
        font-size: 14px;
        color: #555;
        margin-bottom: 15px;
    }

    /* Nút */
    .btn-detail {
        display: inline-block;
        padding: 8px 16px;
        background: #3498db;
        color: #fff;
        font-size: 14px;
        font-weight: 500;
        border-radius: 8px;
        text-decoration: none;
        transition: background 0.3s;
    }

    .btn-detail:hover {
        background: #2980b9;
    }

    /* Header */
    header {
        width: 100vw;
        background: #2c3e50;
        color: #fff;
        padding: 15px 20px;
        border-bottom: 3px solid #3498db;
        box-sizing: border-box;
        margin: 0;
    }

    /* Footer */
    footer {
        width: 100vw;
        background: #2c3e50;
        color: #fff;
        padding: 20px;
        text-align: center;
        border-top: 3px solid #3498db;
        box-sizing: border-box;
        margin: 0;
    }
/* Nút quay lại */
.btn-back {
    display: inline-block;
    margin-bottom: 20px;
    padding: 8px 16px;
    background: #95a5a6;
    color: #fff;
    font-size: 14px;
    font-weight: 500;
    border-radius: 8px;
    text-decoration: none;
    transition: background 0.3s;
}

.btn-back:hover {
    background: #7f8c8d;
}

</style>
