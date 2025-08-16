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
            if (category != null && !category.trim().isEmpty()) {
                jpql += " AND p.categoryName = :category";
            }
            if (status != null && !status.trim().isEmpty()) {
                jpql += " AND p.status = :status";
            }
            if (search != null && !search.trim().isEmpty()) {
                jpql += " AND LOWER(p.name) LIKE :search";
            }

            TypedQuery<Product> query = em.createQuery(jpql, Product.class);
            if (category != null && !category.trim().isEmpty()) {
                query.setParameter("category", category.trim());
            }
            if (status != null && !status.trim().isEmpty()) {
                query.setParameter("status", status.trim());
            }
            if (search != null && !search.trim().isEmpty()) {
                query.setParameter("search", "%" + search.trim().toLowerCase() + "%");
            }

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
    // Xóa product theo ID

    public void deleteProduct(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Product p = em.find(Product.class, id);
            if (p != null) {
                em.remove(p);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
    // Cập nhật product
public void updateProduct(Product product) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction tx = em.getTransaction();
    try {
        tx.begin();
        em.merge(product); // merge sẽ update nếu product đã tồn tại
        tx.commit();
    } catch (Exception e) {
        if (tx.isActive()) tx.rollback();
        e.printStackTrace();
    } finally {
        em.close();
    }
}
public void addProduct(Product product) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction tx = em.getTransaction();
    try {
        tx.begin();
        em.persist(product);
        tx.commit();
    } catch (Exception e) {
        if (tx.isActive()) tx.rollback();
        e.printStackTrace();
    } finally {
        em.close();
    }
}
public boolean existsByName(String name) {
    EntityManager em = emf.createEntityManager();
    try {
        Long count = em.createQuery("SELECT COUNT(p) FROM Product p WHERE p.name = :name", Long.class)
                       .setParameter("name", name)
                       .getSingleResult();
        return count > 0;
    } finally {
        em.close();
    }
}
public List<Product> getProductsWithPaging(String category, String status, String search, int page, int pageSize) {
    EntityManager em = emf.createEntityManager();
    try {
        String jpql = "SELECT p FROM Product p WHERE 1=1";
        if (category != null && !category.trim().isEmpty()) {
            jpql += " AND p.categoryName = :category";
        }
        if (status != null && !status.trim().isEmpty()) {
            jpql += " AND p.status = :status";
        }
        if (search != null && !search.trim().isEmpty()) {
            jpql += " AND LOWER(p.name) LIKE :search";
        }

        TypedQuery<Product> query = em.createQuery(jpql, Product.class);
        if (category != null && !category.trim().isEmpty()) {
            query.setParameter("category", category.trim());
        }
        if (status != null && !status.trim().isEmpty()) {
            query.setParameter("status", status.trim());
        }
        if (search != null && !search.trim().isEmpty()) {
            query.setParameter("search", "%" + search.trim().toLowerCase() + "%");
        }

        // Phân trang
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);

        return query.getResultList();
    } finally {
        em.close();
    }
}
public long countProducts(String category, String status, String search) {
    EntityManager em = emf.createEntityManager();
    try {
        String jpql = "SELECT COUNT(p) FROM Product p WHERE 1=1";
        if (category != null && !category.trim().isEmpty()) {
            jpql += " AND p.categoryName = :category";
        }
        if (status != null && !status.trim().isEmpty()) {
            jpql += " AND p.status = :status";
        }
        if (search != null && !search.trim().isEmpty()) {
            jpql += " AND LOWER(p.name) LIKE :search";
        }

        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
        if (category != null && !category.trim().isEmpty()) {
            query.setParameter("category", category.trim());
        }
        if (status != null && !status.trim().isEmpty()) {
            query.setParameter("status", status.trim());
        }
        if (search != null && !search.trim().isEmpty()) {
            query.setParameter("search", "%" + search.trim().toLowerCase() + "%");
        }

        return query.getSingleResult();
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
                            p.getProductId() + " | "
                            + p.getName() + " | "
                            + p.getCategoryName() + " | "
                            + p.getPrice() + " | "
                            + p.getStockQuantity() + " | "
                            + p.getStatus()
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi kết nối hoặc truy vấn database:");
            e.printStackTrace();
        }
    }
}
