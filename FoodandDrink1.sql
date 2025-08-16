-- ===============================
-- 1. Tạo database
-- ===============================
CREATE DATABASE  FoodandDrink3;
    

-- Sử dụng database vừa tạo
USE FoodandDrink3;

-- ===============================
-- ===============================

-- ===============================
-- 2. Bảng User
-- ===============================
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Role VARCHAR(10) NOT NULL CHECK (Role IN ('Admin','Staff')),
    Status VARCHAR(10) NOT NULL CHECK (Status IN ('Active','Inactive')),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    LastLogin DATETIME NULL
);
GO

-- ===============================
-- 3. Bảng DiningTable
-- ===============================
CREATE TABLE DiningTable (
    TableID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TableName NVARCHAR(50) NOT NULL,
    Status VARCHAR(10) NOT NULL CHECK (Status IN ('Available','Occupied'))
);
GO

-- ===============================
-- 4. Bảng Product
-- ===============================
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    ImageURL VARCHAR(255) NULL,
    StockQuantity INT NOT NULL DEFAULT 0,
    Status VARCHAR(15) NOT NULL CHECK (Status IN ('Available','Out of Stock')),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- ===============================
-- 5. Bảng Inventory
-- ===============================
CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Inventory_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- ===============================
-- 6. Bảng OrderTable
-- ===============================
CREATE TABLE OrderTable (
    OrderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    TableID INT NOT NULL,
    OrderTime DATETIME NOT NULL DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(10) NOT NULL CHECK (PaymentMethod IN ('Cash','Card','E-Wallet')),
    Status VARCHAR(10) NOT NULL CHECK (Status IN ('Paid','Unpaid','Cancelled')),
    CONSTRAINT FK_Order_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_Order_Table FOREIGN KEY (TableID) REFERENCES DiningTable(TableID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO

-- ===============================
-- 7. Bảng OrderItem
-- ===============================
CREATE TABLE OrderItem (
    OrderItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    SubTotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_OrderItem_Order FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_OrderItem_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO



-- ===============================
-- ===============================
-- 1. Thêm dữ liệu User
-- ===============================
INSERT INTO [User] (Username, Password, FullName, Role, Status)
VALUES 
('admin1', '123456', 'Nguyen Van A', 'Admin', 'Active'),
('staff1', '123456', 'Tran Thi B', 'Staff', 'Active'),
('staff2', '123456', 'Le Van C', 'Staff', 'Active');
GO

-- ===============================
-- 2. Thêm dữ liệu DiningTable
-- ===============================
INSERT INTO DiningTable (TableName, Status)
VALUES
('Bàn 1', 'Available'),
('Bàn 2', 'Available'),
('Bàn 3', 'Occupied'),
('Bàn 4', 'Available'),
('Bàn 5', 'Occupied'),
('Bàn 6', 'Available'),
('Bàn 7', 'Available'),
('Bàn 8', 'Occupied'),
('Bàn 9', 'Available'),
('Bàn 10','Available');
GO

-- ===============================
-- 3. Thêm dữ liệu Product
-- ===============================
INSERT INTO Product (CategoryName, Name, Price, StockQuantity, Status)
VALUES
(N'Đồ uống', N'Cà phê sữa', 20000, 50, 'Available'),
(N'Đồ uống', N'Trà đá', 10000, 100, 'Available'),
(N'Đồ ăn', N'Bánh mì thịt', 25000, 30, 'Available'),
(N'Đồ ăn', N'Bánh ngọt', 15000, 40, 'Available'),
(N'Đồ uống', N'Sinh tố bơ', 30000, 20, 'Available'),
(N'Đồ uống', N'Nước ép cam', 25000, 25, 'Available'),
(N'Đồ ăn', N'Xúc xích', 18000, 50, 'Available'),
(N'Đồ ăn', N'Gỏi cuốn', 22000, 40, 'Available'),
(N'Đồ ăn', N'Pizza mini', 45000, 15, 'Available'),
(N'Đồ uống', N'Trà sữa', 35000, 30, 'Available'),
(N'Đồ uống', N'Cà phê đen', 18000, 60, 'Available'),
(N'Đồ ăn', N'Bánh bao', 12000, 50, 'Available');
GO


-- ===============================
-- 4. Thêm dữ liệu Inventory
-- ===============================
INSERT INTO Inventory (ProductID, Quantity)
VALUES
(1, 50),
(2, 100),
(3, 30),
(4, 40),
(5, 20),
(6, 25),
(7, 50),
(8, 40),
(9, 15),
(10,30),
(11,60),
(12,50);
GO

-- ===============================
-- 5. Thêm dữ liệu OrderTable
-- ===============================
INSERT INTO OrderTable (UserID, TableID, TotalAmount, PaymentMethod, Status)
VALUES
(2, 3, 45000, 'Cash', 'Unpaid'),
(3, 1, 35000, 'Card', 'Paid'),
(2, 2, 55000, 'Cash', 'Unpaid'),
(3, 4, 30000, 'Card', 'Paid'),
(2, 5, 70000, 'E-Wallet', 'Paid'),
(3, 6, 45000, 'Cash', 'Unpaid'),
(2, 7, 60000, 'Card', 'Paid'),
(3, 8, 35000, 'E-Wallet', 'Unpaid');
GO

-- ===============================
-- 6. Thêm dữ liệu OrderItem
-- ===============================
INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice, SubTotal)
VALUES
(1, 1, 1, 20000, 20000),
(1, 3, 1, 25000, 25000),
(2, 2, 2, 10000, 20000),
(2, 4, 1, 15000, 15000),
-- Order 5
(5, 9, 1, 45000, 45000),
(5, 10, 1, 35000, 35000),
-- Order 6
(6, 11, 2, 18000, 36000),
(6, 12, 1, 12000, 12000),
-- Order 7
(7, 1, 2, 20000, 40000),
(7, 8, 1, 22000, 22000),
-- Order 8
(8, 2, 1, 10000, 10000),
(8, 6, 1, 25000, 25000);
GO

