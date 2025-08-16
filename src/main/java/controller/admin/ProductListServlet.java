package controller.admin;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductListServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        String search = request.getParameter("search");

        // Nếu có yêu cầu xóa
        if ("delete".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    productDAO.deleteProduct(id);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            // Sau khi xóa thì redirect để tránh lỗi refresh form
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        // Lấy danh sách sản phẩm (có filter)
        List<Product> products = productDAO.getAllProducts(category, status, search);

        request.setAttribute("products", products);
        request.setAttribute("category", category);
        request.setAttribute("status", status);
        request.setAttribute("search", search);

        request.getRequestDispatcher("/admin/ProductList.jsp").forward(request, response);
    }
}
