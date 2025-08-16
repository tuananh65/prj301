<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style>
@font-face {
    font-family: 'Inter';
    src: url('<c:url value="/fonts/Inter-Regular.woff2"/>' ) format('woff2'),
         url('<c:url value="/fonts/Inter-Regular.woff"/>' ) format('woff');
    font-weight: 400;
}
@font-face {
    font-family: 'Inter';
    src: url('<c:url value="/fonts/Inter-SemiBold.woff2"/>' ) format('woff2'),
         url('<c:url value="/fonts/Inter-SemiBold.woff"/>' ) format('woff');
    font-weight: 600;
}

.footer {
    background: linear-gradient(135deg, #1e3a8a 0%, #1e40af 100%);
    color: white;
    font-family: 'Inter', sans-serif;
    margin-top: auto;
}

.footer-top {
    padding: 1rem 0;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.contact-info {
    display: flex;
    gap: 2rem;
    flex-wrap: wrap;
    align-items: center;
}

.contact-info i {
    margin-right: 0.5rem;
}

.footer-main {
    padding: 2rem 0;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 2rem;
}

.footer-section h3 {
    font-weight: 600;
    margin-bottom: 1rem;
    font-size: 1.2rem;
    border-bottom: 2px solid #fbbf24;
    display: inline-block;
    padding-bottom: 0.25rem;
}

.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section ul li {
    margin-bottom: 0.5rem;
}

.footer-section ul li a {
    color: rgba(255,255,255,0.85);
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-section ul li a:hover {
    color: #fbbf24;
}

.footer-bottom {
    padding: 1rem 0;
    text-align: center;
    font-size: 0.9rem;
    background: rgba(0,0,0,0.1);
}
</style>

<footer class="footer">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <div class="footer-top">
        <div class="container">
            <div class="contact-info">
                <span><i class="fa fa-phone"></i> 0123 456 789</span>
                <span><i class="fa fa-envelope"></i> support@possystem.com</span>
                <span><i class="fa fa-map-marker-alt"></i> Hà Nội, Việt Nam</span>
            </div>
        </div>
    </div>

    <div class="footer-main">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Giới thiệu</h3>
                    <p>Hệ thống QuầyBán POS giúp quản lý bán hàng nhanh chóng, tiện lợi, và hiệu quả.</p>
                </div>

                <div class="footer-section">
                    <h3>Chức năng chính</h3>
                    <ul>
                        <li><a href="#">Quản lý sản phẩm</a></li>
                        <li><a href="#">Quản lý đơn hàng</a></li>
                        <li><a href="#">Báo cáo doanh thu</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Hỗ trợ kỹ thuật</h3>
                    <ul>
                        <li><a href="#">Hướng dẫn sử dụng</a></li>
                        <li><a href="#">Câu hỏi thường gặp</a></li>
                        <li><a href="#">Liên hệ hỗ trợ</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="container">
            <p>&copy; 2025 <strong style="color: #fbbf24;">QuầyBán POS System</strong>. Phát triển bởi FPT University Team.</p>
        </div>
    </div>
</footer>
