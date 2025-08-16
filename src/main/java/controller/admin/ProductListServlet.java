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

        // Xử lý xóa sản phẩm
        if ("delete".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    productDAO.deleteProduct(id);
                    // Thêm thông báo thành công
                    request.getSession().setAttribute("message", "Xóa sản phẩm thành công!");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    request.getSession().setAttribute("message", "Xóa sản phẩm thất bại!");
                }
            }
            // Redirect để tránh refresh xóa lại
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        // Xử lý phân trang
        int pageSize = 10; // mỗi trang 10 sản phẩm
        int currentPage = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            try {
                currentPage = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        // Lấy danh sách phân trang
        List<Product> products = productDAO.getProductsWithPaging(category, status, search, currentPage, pageSize);
        long totalProducts = productDAO.countProducts(category, status, search);
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
// Nếu không có sản phẩm nào
        if (products.isEmpty()) {
            request.setAttribute("noProductsMessage", "Không tìm thấy sản phẩm nào phù hợp với tiêu chí tìm kiếm.");
        }
        if ("viewAll".equals(action)) {
    List<Product> allProducts = productDAO.getAllProducts(null, null, null); // Lấy tất cả sản phẩm
    request.setAttribute("allProducts", allProducts);
    request.getRequestDispatcher("/admin/ProductDetailView.jsp").forward(request, response);
    return;
}
        // Gửi dữ liệu sang JSP
        request.setAttribute("products", products);
        request.setAttribute("category", category);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/admin/ProductList.jsp").forward(request, response);
    }
}
