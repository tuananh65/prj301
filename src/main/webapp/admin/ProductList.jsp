<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Danh sách sản phẩm</title>
        <link rel="stylesheet" href="css/productlist.css">
        
    </head>
    <body>
        <%@ include file="/default/header.jsp" %>

        <main class="main-content">
            <div class="container">
                <div class="page-header">
                    <h1 class="page-title">Danh sách sản phẩm</h1>
                    <div class="page-actions">
                        <button class="btn btn-primary">Thêm sản phẩm</button>
                        <button class="btn btn-secondary">Xuất Excel</button>
                    </div>
                </div>

                <div class="filters-section">
                    <form method="get" action="products">
                        <div class="search-box">
                            <input type="text" name="search" placeholder="Tìm kiếm sản phẩm..." class="search-input" value="${search}">
                            <button type="submit" class="search-btn">Tìm kiếm</button>
                        </div>
                        <div class="filter-options">
                            <select name="category" class="filter-select">
                                <option value="">Tất cả danh mục</option>
                                <option value="Đồ ăn" ${category == 'Đồ ăn' ? 'selected' : ''}>Đồ ăn</option>
                                <option value="Đồ uống" ${category == 'Đồ uống' ? 'selected' : ''}>Đồ uống</option>
                            </select>
                            <select name="status" class="filter-select">
                                <option value="">Tất cả trạng thái</option>
                                <option value="Available" ${status == 'Available' ? 'selected' : ''}>Available</option>
                                <option value="Out of Stock" ${status == 'Out of Stock' ? 'selected' : ''}>Out of Stock</option>
                            </select>
                        </div>
                    </form>
                </div>


                <div class="table-container">
                    <table class="products-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Danh mục</th>
                                <th>Giá</th>
                                <th>Số lượng tồn</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${products}">
                                <tr class="product-row">
                                    <td class="product-id">${p.productId}</td>
                                    <td class="product-name">${p.name}</td>
                                    <td class="product-category">
                                        <span class="category-badge">${p.categoryName}</span>
                                    </td>
                                    <td class="product-price">${p.price} VNĐ</td>
                                    <td class="product-stock">
                                        <span class="stock-quantity ${p.stockQuantity < 10 ? 'low-stock' : ''}">${p.stockQuantity}</span>
                                    </td>
                                    <td class="product-status">
                                        <span class="status-badge ${p.status == 'active' ? 'status-active' : 'status-inactive'}">${p.status}</span>
                                    </td>
                                    <td class="product-actions">
                                        <a href="products?action=delete&id=${p.productId}" 
                                           onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');"
                                           class="action-btn delete-btn">Xóa</a>
                                        <a href="editProduct?id=${p.productId}" class="action-btn edit-btn">Sửa</a>

                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </div>

                <div class="pagination">
                    <button class="page-btn">« Trước</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">Sau »</button>
                </div>
            </div>
        </main>

        <%@ include file="/default/footer.jsp" %>
    </body>
</html>
