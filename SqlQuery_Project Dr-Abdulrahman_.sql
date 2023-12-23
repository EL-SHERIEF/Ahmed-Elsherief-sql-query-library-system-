CREATE DATABASE LibrarySystem;
USE LibrarySystem;
GO

-- عملت تيبول للكتب الاول(علي حسب اي دي و الاسم والمؤلف والنوع وسعر الشراء وتاريخ الشراء):
CREATE TABLE Books (
    id_book INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    category NVARCHAR(50),
    purchase_price DECIMAL(10, 2),
    date_purchased DATE
);

-- وبعدها تيبول لليوزرز(اي دي والاسم و العنوان  ورقم التليفون والايميل)
CREATE TABLE Users (
    id_user INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255),
    phone_number NVARCHAR(20),
    email NVARCHAR(100) NOT NULL
);

-- وكذالك للاستعارة(اي دي يوزر و اي دي كتب و اي دي استعارة و تاريخ الاستعارة وتاريخ التسليم)
CREATE TABLE Transactions (
    id_transaction INT PRIMARY KEY IDENTITY(1,1),
    id_book INT,
    id_user INT,
    borrow_date DATE,
    return_date DATE,
    status NVARCHAR(20),
    FOREIGN KEY (id_book) REFERENCES Books(id_book),
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

-- حطيت بيانات وهمية لشوية كتب وبتتعرف علي حسب: الكتاب,المؤلف,النوع,السعر,تاريخ الشراء
INSERT INTO Books (title, author, category, purchase_price, date_purchased)
VALUES
('Book1', 'Author1', 'Category1', 20.99, '2023-01-01'),
('Book2', 'Author2', 'Category2', 15.50, '2023-02-15'),
('Book3', 'Author3', 'Category1', 30.00, '2023-03-20');

-- حطيت بيانات وهمية لشوية يوزرز وبيتعرفو علي حسب: الاسم,العنوان,رقم الهاتف,الايميل
INSERT INTO Users (name, address, phone_number, email)
VALUES
('User1', 'Address1', '01012345678', 'user1@example.com'),
('User2', 'Address2', '01123456789', 'user2@example.com'),
('User3', 'Address3', '01234567890', 'user3@example.com');

-- وكذالك للاستعارات بس علي حسب (اي دي الكتاب- اي دي اليوزر - تاريخ الاستعارة - تاريخ التسليم)
INSERT INTO Transactions (id_book, id_user, borrow_date, return_date, status)
VALUES
(1, 1, '2023-01-05', '2023-01-15', 'Returned'),
(2, 2, '2023-02-10', NULL, 'Borrowed'),
(3, 3, '2023-03-15', NULL, 'Borrowed');


SELECT * FROM Books;
SELECT * FROM Users;
SELECT * FROM Transactions;
