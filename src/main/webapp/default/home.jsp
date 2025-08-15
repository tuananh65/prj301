<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuầyBán - Hệ thống POS thực phẩm & đồ uống</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Include Header -->
<%@ include file="/default/header.jsp" %>


    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h2 class="hero-title">Hệ thống POS chuyên nghiệp</h2>
            <p class="hero-subtitle">Quản lý bán hàng thực phẩm & đồ uống hiệu quả cho nhân viên và quản lý</p>
            <button class="cta-button">Bắt đầu bán hàng</button>
        </div>
        <div class="hero-image">
            <img src="/placeholder.svg?height=400&width=600" alt="POS System Interface" />
        </div>
    </section>

    <!-- Product Categories -->
    <section class="categories" id="products">
        <div class="container">
            <h2 class="section-title">Danh mục sản phẩm</h2>
            <div class="category-grid">
                <div class="category-card">
                    <img src="/placeholder.svg?height=200&width=300" alt="Trái cây & Rau củ" />
                    <h3>Trái cây & Rau củ</h3>
                    <p>Tươi ngon từ trang trại</p>
                    <button class="category-btn">Xem thêm</button>
                </div>
                <div class="category-card">
                    <img src="/placeholder.svg?height=200&width=300" alt="Thịt & Hải sản" />
                    <h3>Thịt & Hải sản</h3>
                    <p>Chất lượng cao, an toàn</p>
                    <button class="category-btn">Xem thêm</button>
                </div>
                <div class="category-card">
                    <img src="/placeholder.svg?height=200&width=300" alt="Đồ uống" />
                    <h3>Đồ uống</h3>
                    <p>Giải khát mọi lúc</p>
                    <button class="category-btn">Xem thêm</button>
                </div>
                <div class="category-card">
                    <img src="/placeholder.svg?height=200&width=300" alt="Sữa & Trứng" />
                    <h3>Sữa & Trứng</h3>
                    <p>Dinh dưỡng hàng ngày</p>
                    <button class="category-btn">Xem thêm</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products -->
    <section class="featured-products">
        <div class="container">
            <h2 class="section-title">Sản phẩm nổi bật</h2>
            <div class="products-grid">
                <div class="product-card">
                    <img src="/placeholder.svg?height=250&width=200" alt="Táo hữu cơ" />
                    <div class="product-info">
                        <h4>Táo hữu cơ</h4>
                        <p class="product-price">45.000đ/kg</p>
                        <button class="add-to-cart">Thêm vào giỏ</button>
                    </div>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=250&width=200" alt="Cá hồi tươi" />
                    <div class="product-info">
                        <h4>Cá hồi tươi</h4>
                        <p class="product-price">280.000đ/kg</p>
                        <button class="add-to-cart">Thêm vào giỏ</button>
                    </div>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=250&width=200" alt="Nước cam tươi" />
                    <div class="product-info">
                        <h4>Nước cam tươi</h4>
                        <p class="product-price">35.000đ/chai</p>
                        <button class="add-to-cart">Thêm vào giỏ</button>
                    </div>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=250&width=200" alt="Sữa hữu cơ" />
                    <div class="product-info">
                        <h4>Sữa hữu cơ</h4>
                        <p class="product-price">25.000đ/hộp</p>
                        <button class="add-to-cart">Thêm vào giỏ</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Special Offers -->
    <section class="special-offers">
        <div class="container">
            <div class="offer-banner">
                <h2>📊 Thống kê hôm nay</h2>
                <p>Doanh thu: 2.450.000đ | Đơn hàng: 47 | Khách hàng: 38</p>
                <button class="offer-btn">Xem chi tiết</button>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="/default/footer.jsp" %>
</body>
</html>
