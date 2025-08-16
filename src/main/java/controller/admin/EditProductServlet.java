package controller.admin;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy ID từ param
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Product product = productDAO.getProductById(id);
                if (product != null) {
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/admin/edit-product.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        // Nếu không tìm thấy -> quay về danh sách
        response.sendRedirect(request.getContextPath() + "/products");
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int id = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String category = request.getParameter("categoryName");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String status = request.getParameter("status");
        String imageUrl = request.getParameter("imageUrl");

        // Lấy product từ DB
        Product product = productDAO.getProductById(id);
        if (product != null) {
            product.setName(name);
            product.setCategoryName(category);
            product.setPrice(price);
            product.setStatus(status);
            product.setImageUrl(imageUrl);
            product.setCreatedAt(product.getCreatedAt() != null ? product.getCreatedAt() : LocalDateTime.now());

            productDAO.updateProduct(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect(request.getContextPath() + "/products");
}
}
