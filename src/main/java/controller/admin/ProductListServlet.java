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

        // Lấy filter từ request
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        String search = request.getParameter("search");

        // Gọi DAO để lấy danh sách
       List<Product> products = productDAO.getAllProducts(null, null, null);
System.out.println("Số sản phẩm lấy ra: " + products.size()); // Debug

request.setAttribute("products", products);
request.getRequestDispatcher("/admin/ProductList.jsp").forward(request, response);

        
    }
    
}
