<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Danh mục</th>
        <th>Giá</th>
        <th>Số lượng tồn</th>
        <th>Trạng thái</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.productId}</td>
            <td>${p.name}</td>
            <td>${p.categoryName}</td>
            <td>${p.price}</td>
            <td>${p.stockQuantity}</td>
            <td>${p.status}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
