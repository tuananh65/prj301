<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa sản phẩm</title>
    <link rel="stylesheet" href="css/edit-product.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    
</head>
<body>
    <%@ include file="/default/header.jsp" %>

    <!-- Chỉ bọc form trong container -->
    <div class="page-content">
        <div class="form-card">
            <h1 class="form-title">✏️ Sửa sản phẩm</h1>
            <form method="post" action="${pageContext.request.contextPath}/editProduct">
                <input type="hidden" name="productId" value="${product.productId}" />

                <div class="form-group">
                    <label>Tên sản phẩm:</label>
                    <input type="text" name="name" value="${product.name}" required />
                </div>

                <div class="form-group">
                    <label>Danh mục:</label>
                    <select name="categoryName" required>
                        <option value="Đồ uống" ${product.categoryName == 'Đồ uống' ? 'selected' : ''}>Đồ uống</option>
                        <option value="Đồ ăn" ${product.categoryName == 'Đồ ăn' ? 'selected' : ''}>Đồ ăn</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Giá:</label>
                    <input type="number" step="0.01" name="price" value="${product.price}" required />
                </div>

                <div class="form-group">
                    <label>Trạng thái:</label>
                    <select name="status">
                        <option value="Available" ${product.status == 'Available' ? 'selected' : ''}>Available</option>
                        <option value="Out of Stock" ${product.status == 'Out of Stock' ? 'selected' : ''}>Out of Stock</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Ảnh (URL):</label>
                    <input type="text" name="imageUrl" value="${product.imageUrl}" />
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">💾 Lưu</button>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">❌ Hủy</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="/default/footer.jsp" %>
</body>
</html>
