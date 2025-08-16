<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
    <link rel="stylesheet" href="css/addnewproduct.css">
</head>
<body>
    <%@ include file="/default/header.jsp" %>

    <main class="main-content">
        <div class="container">
            <h1>Thêm sản phẩm mới</h1>

            <!-- Thông báo lỗi -->
            <c:if test="${not empty error}">
                <div class="error-msg">${error}</div>
            </c:if>

            <!-- Thông báo thành công -->
            <c:if test="${not empty success}">
                <div class="success-msg">${success}</div>
            </c:if>

            <form method="post" action="addProduct" class="product-form">
                <div class="form-group">
                    <label>Tên sản phẩm:</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Danh mục:</label>
                    <select name="categoryName" required>
                        <option value="Đồ ăn">Đồ ăn</option>
                        <option value="Đồ uống">Đồ uống</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Giá:</label>
                    <input type="number" step="0.01" name="price" required>
                </div>
                <div class="form-group">
                    <label>Ảnh URL:</label>
                    <input type="text" name="imageUrl">
                </div>
                <div class="form-group">
                    <label>Trạng thái:</label>
                    <select name="status" required>
                        <option value="Available">Available</option>
                        <option value="Out of Stock">Out of Stock</option>
                    </select>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="products" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </div>
    </main>

    <%@ include file="/default/footer.jsp" %>
</body>
</html>
