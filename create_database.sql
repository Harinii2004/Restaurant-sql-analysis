-- Step 1: Create the Database
DROP DATABASE IF EXISTS Restaurant_DB;
CREATE DATABASE Restaurant_DB;
USE Restaurant_DB;

-- Step 2: Create all the tables. The order is based on the tables' dependencies. 

-- Create Items table
CREATE TABLE Items (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_category VARCHAR(100) NOT NULL,
    item_size VARCHAR(10) NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL
);

-- Create Ingredients table
CREATE TABLE Ingredients (
    ingredient_id VARCHAR(10) PRIMARY KEY,
    ingredient_name VARCHAR(200) NOT NULL,
    measurement VARCHAR(20) NOT NULL,
    ingredient_price DECIMAL(5, 2) NOT NULL
);

-- Create ItemIngredients table
CREATE TABLE ItemIngredients (
    item_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    quantity_required INT NOT NULL,
    PRIMARY KEY (item_id, ingredient_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);
-- Create Orders table
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    placement_date DATETIME NOT NULL
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10),
    item_id VARCHAR(10),
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

-- Create Inventory table
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

-- Insert data into the following tabels 

-- Insert Items
INSERT INTO Items  (item_id, item_name, item_category, item_size, item_price) VALUES
('ITM001', 'Cheeseburger', 'Burger', 'Medium', 5.99),
('ITM002', 'Veggie Burger', 'Burger', 'Medium', 5.49),
('ITM003', 'Chicken Sandwich', 'Sandwich', 'Medium', 6.49),
('ITM004', 'Fries', 'Side', 'Small', 2.49),
('ITM005', 'Fries', 'Side', 'Large', 3.49),
('ITM006', 'Coke', 'Beverage', 'Small', 1.49),
('ITM007', 'Coke', 'Beverage', 'Large', 2.49),
('ITM008', 'Salad', 'Side', 'Medium', 4.49),
('ITM009', 'Chocolate Shake', 'Beverage', 'Medium', 3.99),
('ITM010', 'Milkshake', 'Beverage', 'Large', 4.99),
('ITM011', 'Hot Dog', 'Burger', 'Medium', 4.99),
('ITM012', 'Onion Rings', 'Side', 'Medium', 2.99),
('ITM013', 'Apple Pie', 'Dessert', 'Medium', 3.49),
('ITM014', 'Lemonade', 'Beverage', 'Medium', 2.99),
('ITM015', 'Chicken Nuggets', 'Side', 'Large', 4.49);

-- Insert Ingredients
INSERT INTO Ingredients (ingredient_id, ingredient_name, measurement, ingredient_price) VALUES
('ING001', 'Beef Patty', 'Each', 1.50),
('ING002', 'Burger Bun', 'Each', 0.50),
('ING003', 'Lettuce', 'Leaf', 0.10),
('ING004', 'Tomato', 'Slice', 0.20),
('ING005', 'Cheese', 'Slice', 0.30),
('ING006', 'Chicken Fillet', 'Each', 1.20),
('ING007', 'Potato', 'Gram', 0.02),
('ING008', 'Coke Syrup', 'ml', 0.01),
('ING009', 'Milk', 'ml', 0.05),
('ING010', 'Chocolate Syrup', 'ml', 0.10),
('ING011', 'Hot Dog Sausage', 'Each', 1.00),
('ING012', 'Onion', 'Slice', 0.15),
('ING013', 'Apple', 'Each', 0.50),
('ING014', 'Lemon', 'Each', 0.25),
('ING015', 'Chicken Nugget', 'Piece', 0.25);


-- Insert ItemIngredients
INSERT INTO ItemIngredients (item_id, ingredient_id, quantity_required) VALUES
('ITM001', 'ING001', 1),  -- Cheeseburger needs 1 Beef Patty
('ITM001', 'ING002', 1),  -- Cheeseburger needs 1 Burger Bun
('ITM001', 'ING003', 2),  -- Cheeseburger needs 2 Lettuce Leaves
('ITM001', 'ING004', 2),  -- Cheeseburger needs 2 Tomato Slices
('ITM001', 'ING005', 1),  -- Cheeseburger needs 1 Cheese Slice
('ITM002', 'ING002', 1),  -- Veggie Burger needs 1 Burger Bun
('ITM002', 'ING003', 2),  -- Veggie Burger needs 2 Lettuce Leaves
('ITM002', 'ING004', 2),  -- Veggie Burger needs 2 Tomato Slices
('ITM002', 'ING005', 1),
('ITM003', 'ING006', 1),
('ITM003', 'ING002', 1),
('ITM004', 'ING007', 100),
('ITM005', 'ING007', 200),
('ITM006', 'ING008', 330),
('ITM007', 'ING008', 500),
('ITM009', 'ING009', 200),
('ITM009', 'ING010', 50),
('ITM010', 'ING009', 250),
('ITM010', 'ING010', 100),
('ITM011', 'ING011', 1),
('ITM011', 'ING002', 1),
('ITM012', 'ING012', 5),
('ITM013', 'ING013', 1),
('ITM013', 'ING014', 1),
('ITM014', 'ING009', 300),
('ITM014', 'ING014', 1),
('ITM015', 'ING006', 3);


-- Insert Orders
INSERT INTO Orders (order_id, placement_date) VALUES
('ORD001', '2024-08-01 12:15:00'),
('ORD002', '2024-08-01 12:20:00'),
('ORD003', '2024-08-01 12:25:00'),
('ORD004', '2024-08-01 12:30:00'),
('ORD005', '2024-08-01 12:35:00'),
('ORD006', '2024-08-01 12:40:00'),
('ORD007', '2024-08-01 12:45:00'),
('ORD008', '2024-08-01 12:50:00'),
('ORD009', '2024-08-01 13:00:00'),
('ORD010', '2024-08-01 13:10:00'),
('ORD011', '2024-08-01 13:20:00'),
('ORD012', '2024-08-01 13:30:00'),
('ORD013', '2024-08-01 13:40:00'),
('ORD014', '2024-08-01 13:50:00'),
('ORD015', '2024-08-01 14:00:00'),
('ORD016', '2024-08-01 14:10:00'),
('ORD017', '2024-08-01 14:20:00'),
('ORD018', '2024-08-01 14:30:00'),
('ORD019', '2024-08-01 14:40:00'),
('ORD020', '2024-08-01 14:50:00'),
('ORD021', '2024-08-01 15:00:00'),
('ORD022', '2024-08-01 15:10:00'),
('ORD023', '2024-08-01 15:20:00'),
('ORD024', '2024-08-01 15:30:00'),
('ORD025', '2024-08-01 15:40:00'),
('ORD026', '2024-08-01 15:50:00'),
('ORD027', '2024-08-01 16:00:00'),
('ORD028', '2024-08-01 16:10:00'),
('ORD029', '2024-08-01 16:20:00'),
('ORD030', '2024-08-01 16:30:00'),
('ORD031', '2024-08-01 16:40:00'),
('ORD032', '2024-08-01 16:50:00'),
('ORD033', '2024-08-01 17:00:00'),
('ORD034', '2024-08-01 17:10:00'),
('ORD035', '2024-08-01 17:20:00'),
('ORD036', '2024-08-01 17:30:00'),
('ORD037', '2024-08-01 17:40:00'),
('ORD038', '2024-08-01 17:50:00'),
('ORD039', '2024-08-01 18:00:00'),
('ORD040', '2024-08-01 18:10:00'),
('ORD041', '2024-08-01 18:20:00'),
('ORD042', '2024-08-01 18:30:00'),
('ORD043', '2024-08-01 18:40:00'),
('ORD044', '2024-08-01 18:50:00'),
('ORD045', '2024-08-01 19:00:00'),
('ORD046', '2024-08-01 19:10:00'),
('ORD047', '2024-08-01 19:20:00'),
('ORD048', '2024-08-01 19:30:00'),
('ORD049', '2024-08-01 19:40:00'),
('ORD050', '2024-08-02 14:00:00');


INSERT INTO OrderItems (order_item_id, order_id, item_id, quantity, item_price) VALUES
(1, 'ORD001', 'ITM001', 1, 5.99),  -- Cheeseburger in order ORD001
(2, 'ORD001', 'ITM004', 1, 2.49),  -- Small Fries in order ORD001
(3, 'ORD001', 'ITM006', 1, 1.49),  -- Small Coke in order ORD001
(4, 'ORD002', 'ITM002', 1, 5.49),  -- Veggie Burger in order ORD002
(5, 'ORD002', 'ITM005', 1, 3.49),  -- Large Fries in order ORD002
(6, 'ORD002', 'ITM007', 1, 2.49),  -- Large Coke in order ORD002
(7, 'ORD003', 'ITM003', 1, 6.49),  -- Chicken Sandwich in order ORD003
(8, 'ORD003', 'ITM009', 1, 3.99),  -- Chocolate Shake in order ORD003
(9, 'ORD004', 'ITM008', 1, 4.49),
(10, 'ORD004', 'ITM004', 1, 2.49),
(11, 'ORD005', 'ITM005', 2, 3.49),
(12, 'ORD005', 'ITM007', 1, 2.49),
(13, 'ORD006', 'ITM003', 1, 6.49),
(14, 'ORD006', 'ITM006', 1, 1.49),
(15, 'ORD007', 'ITM007', 2, 2.49),
(16, 'ORD007', 'ITM009', 1, 3.49),
(17, 'ORD008', 'ITM002', 1, 5.49),
(18, 'ORD008', 'ITM001', 1, 5.49),
(19, 'ORD008', 'ITM009', 1, 3.49),
(20, 'ORD009', 'ITM008', 1, 4.49),
(21, 'ORD050', 'ITM001', 2, 5.99),
(22, 'ORD050', 'ITM004', 2, 2.49);


-- Insert Inventory
INSERT INTO Inventory (inventory_id, item_id, ingredient_id, quantity) VALUES
(1, 'ITM001', NULL, 100),  -- 100 Cheeseburgers in stock
(2, 'ITM002', NULL, 50),   -- 50 Veggie Burgers in stock
(3, 'ITM003', NULL, 70),   -- 70 Chicken Sandwiches in stock
(4, 'ITM004', NULL, 200),  -- 200 Small Fries in stock
(5, 'ITM005', NULL, 150),  -- 150 Large Fries in stock
(6, 'ITM006', NULL, 300),  -- 300 Small Cokes in stock
(7, 'ITM007', NULL, 250),  -- 250 Large Cokes in stock
(8, 'ITM008', NULL, 100),  -- 100 Salads in stock
(9, 'ITM009', NULL, 80),   -- 80 Chocolate Shakes in stock
(10, NULL, 'ING001', 200), -- 200 Beef Patties in stock
(11, NULL, 'ING002', 500), -- 500 Burger Buns in stock
(12, NULL, 'ING003', 1000), -- 1000 Lettuce Leaves in stock
(13, NULL, 'ING004', 500), -- 500 Tomato Slices in stock
(14, NULL, 'ING005', 400), -- 400 Cheese Slices in stock
(15, NULL, 'ING006', 150), -- 150 Chicken Fillets in stock
(16, NULL, 'ING007', 10000), -- 10,000g Potatoes in stock
(17, NULL, 'ING008', 10000), -- 10,000ml Coke Syrup in stock
(18, NULL, 'ING009', 5000), -- 5,000ml Milk in stock
(19, NULL, 'ING010', 2000); -- 2,000ml Chocolate Syrup in stock
