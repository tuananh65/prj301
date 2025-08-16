<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Header -->
<header class="header">
    <div class="header-inner">
        <div class="nav-brand">
            <h1 class="logo">🍽️ QuầyBán</h1>
        </div>
        <nav class="nav-menu">
            <ul>
                <li><a href="#home" class="nav-link active">Trang chủ</a></li>
                <li><a href="#products" class="nav-link">Sản phẩm</a></li>
                <li><a href="#orders" class="nav-link">Đơn hàng</a></li>
                <li><a href="#reports" class="nav-link">Báo cáo</a></li>
                <li><a href="#settings" class="nav-link">Cài đặt</a></li>
            </ul>
        </nav>
        <div class="nav-actions">
            <div class="auth-buttons">
               <a href="${pageContext.request.contextPath}/default/SignIn.jsp" class="custom-btn btn btn-outline-light me-2">Đăng nhập</a>
                
            </div>
            <button class="cart-btn">🛒 Giỏ hàng (0)</button>
        </div>
    </div>
</header>
<style>
    

/* Header Styles */.header {
  background: linear-gradient(135deg, #1e40af 0%, #3b82f6 100%);
  padding: 1rem 0;
  box-shadow: 0 4px 20px rgba(30, 64, 175, 0.3);
  position: sticky;
  top: 0;
  z-index: 100;
  width: 100%; /* full width */
}

.header-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  max-width: 1200px; /* căn giữa nội dung */
  margin: 0 auto;
  padding: 0 20px;
}


.logo {
  font-size: 1.8rem;
  font-weight: 900;
  color: #ffffff;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

.nav-menu ul {
  display: flex;
  list-style: none;
  gap: 2rem;
}

.nav-actions {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.auth-buttons {
  display: flex;
  gap: 0.5rem;
}

.login-btn {
  background-color: transparent;
  color: #ffffff;
  border: 2px solid #ffffff;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.login-btn:hover {
  background-color: #ffffff;
  color: #1e40af;
}

.register-btn {
  background-color: #f59e0b;
  color: #ffffff;
  border: 2px solid #f59e0b;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.register-btn:hover {
  background-color: #d97706;
  border-color: #d97706;
}

.nav-link {
  text-decoration: none;
  color: #e5e7eb;
  font-weight: 600;
  transition: all 0.3s ease;
  padding: 0.5rem 1rem;
  border-radius: 0.375rem;
}

.nav-link:hover,
.nav-link.active {
  color: #ffffff;
  background-color: rgba(255, 255, 255, 0.1);
}

.cart-btn {
  background-color: #10b981;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 0.5rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
}

.cart-btn:hover {
  background-color: #059669;
  transform: translateY(-1px);
}

/* Responsive Design */
@media (max-width: 768px) {
  .header .container {
    flex-direction: column;
    gap: 1rem;
  }

  .nav-menu ul {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
  }

  .nav-actions {
    flex-direction: column;
    gap: 1rem;
    width: 100%;
  }

  .auth-buttons {
    justify-content: center;
  }
}

</style>