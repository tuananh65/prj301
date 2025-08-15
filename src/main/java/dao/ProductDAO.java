package dao;

import jakarta.persistence.*;
import java.util.List;
import model.Product;

public class ProductDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("FoodAndDrinkPU");

    // Lấy tất cả product với filter category, status, search
   public List<Product> getAllProducts(String category, String status, String search) {
    EntityManager em = emf.createEntityManager();
    try {
        String jpql = "SELECT p FROM Product p WHERE 1=1";
        if (category != null && !category.trim().isEmpty()) jpql += " AND p.categoryName = :category";
        if (status != null && !status.trim().isEmpty()) jpql += " AND p.status = :status";
        if (search != null && !search.trim().isEmpty()) jpql += " AND LOWER(p.name) LIKE :search";

        TypedQuery<Product> query = em.createQuery(jpql, Product.class);
        if (category != null && !category.trim().isEmpty()) query.setParameter("category", category.trim());
        if (status != null && !status.trim().isEmpty()) query.setParameter("status", status.trim());
        if (search != null && !search.trim().isEmpty()) query.setParameter("search", "%" + search.trim().toLowerCase() + "%");

        return query.getResultList();
    } finally {
        em.close();
    }
}

    // Lấy 1 product theo ID
    public Product getProductById(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }

    // Test DAO
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println("==== Test kết nối JPA và lấy danh sách Product ====");

        try {
            List<Product> products = dao.getAllProducts(null, null, null); // Lấy tất cả
            if (products.isEmpty()) {
                System.out.println("Chưa có sản phẩm nào trong database.");
            } else {
                for (Product p : products) {
                    System.out.println(
                        p.getProductId() + " | " + 
                        p.getName() + " | " + 
                        p.getCategoryName() + " | " + 
                        p.getPrice() + " | " + 
                        p.getStockQuantity() + " | " + 
                        p.getStatus()
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi kết nối hoặc truy vấn database:");
            e.printStackTrace();
        }
    }
}
