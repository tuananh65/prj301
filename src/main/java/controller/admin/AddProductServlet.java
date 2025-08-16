package controller.admin;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    // Hiển thị form thêm mới
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addnewproduct.jsp").forward(request, response);
    }

    // Xử lý khi submit form
   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        String name = request.getParameter("name");
        String category = request.getParameter("categoryName");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        String status = request.getParameter("status");

        // ✅ Kiểm tra trùng tên
        if (productDAO.existsByName(name)) {
            request.setAttribute("error", "Tên sản phẩm đã tồn tại, vui lòng chọn tên khác!");
            request.getRequestDispatcher("/admin/addnewproduct.jsp").forward(request, response);
            return; // dừng lại, không insert nữa
        }

        Product p = new Product();
        p.setName(name);
        p.setCategoryName(category);
        p.setPrice(price);
        p.setImageUrl(imageUrl);
        p.setStatus(status);
        p.setCreatedAt(LocalDateTime.now());
        p.setStockQuantity(0); // mặc định 0 khi thêm mới

        productDAO.addProduct(p);

        request.setAttribute("success", "Thêm sản phẩm thành công!");
        request.getRequestDispatcher("/admin/addnewproduct.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
        request.getRequestDispatcher("/admin/addnewproduct.jsp").forward(request, response);
    }
}

}
