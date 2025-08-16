package model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "Product")
public class Product {

   @Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "ProductID", nullable = false)
private Integer productId;


    @Column(name = "CategoryName", nullable = false, length = 100)
    private String categoryName;

    @Column(name = "Name", nullable = false, length = 100)
    private String name;

    @Column(name = "Price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "ImageURL", length = 255)
    private String imageUrl;

    @Column(name = "StockQuantity", nullable = false)
    private Integer stockQuantity = 0;

    @Column(name = "Status", nullable = false, length = 15)
    private String status; // Available / Out of Stock

    @Column(name = "CreatedAt", nullable = false)
    private LocalDateTime createdAt;

    public Product() {
    }

    // Getters và Setters
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
