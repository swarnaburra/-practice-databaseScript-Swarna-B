/*-- Start transaction
START TRANSACTION;

-- Drop tables if they already exist

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

-- CREATE TABLE Orders

CREATE TABLE Orders (
                        OrderID INT PRIMARY KEY,
                        CustomerID INT NOT NULL,
                        OrderDate DATE NOT NULL
) ENGINE=InnoDB;

-- INSERT INTO Orders table

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
                                                        (1, 101, '2024-01-05'),
                                                        (2, 102, '2024-01-10'),
                                                        (3, 101, '2024-01-15');

-- CREATE TABLE Products

CREATE TABLE Products (
                          ProductID INT PRIMARY KEY,
                          ProductName VARCHAR(100) NOT NULL,
                          Price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- INSERT INTO Products table

INSERT INTO Products (ProductID, ProductName, Price) VALUES
                                                         (1, 'Sachet Bag', 850.00),
                                                         (2, 'Bag Charms', 25.50),
                                                         (3, 'Custom Logo', 45.00),
                                                         (4, 'Perfume', 220.00);

-- CREATE TABLE OrderDetails with foreign keys

CREATE TABLE OrderDetails (
                              DetailID INT PRIMARY KEY,
                              OrderID INT NOT NULL,
                              ProductID INT NOT NULL,
                              Quantity INT NOT NULL,
                              FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
                              FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ENGINE=InnoDB;

-- INSERT INTO OrderDetails

INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES
                                                                      (1, 1, 1, 1),
                                                                      (2, 1, 2, 2),
                                                                      (3, 2, 3, 1),
                                                                      (4, 2, 4, 1),
                                                                      (5, 3, 2, 1),
                                                                      (6, 3, 3, 1);

-- Commit transaction
COMMIT;
