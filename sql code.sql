CREATE TABLE Delivery_Boy
(
  DeliveryBoy_ID INT NOT NULL,
  ContactNumber INT NOT NULL,
  Name VARCHAR(32) NOT NULL,
  PRIMARY KEY (DeliveryBoy_ID),
  UNIQUE (ContactNumber)
);

CREATE TABLE Area
(
  AreaName VARCHAR(32) NOT NULL,
  City VARCHAR(32) NOT NULL,
  road INT NOT NULL,
  area_code INT NOT NULL,
  house INT NOT NULL,
  DeliveryBoy_ID INT NOT NULL,
  PRIMARY KEY (area_code),
  FOREIGN KEY (DeliveryBoy_ID) REFERENCES Delivery_Boy(DeliveryBoy_ID)
);

CREATE TABLE Customer
(
  CustomerID INT NOT NULL,
  CustomerName VARCHAR(32) NOT NULL,
  PhoneNumber INT NOT NULL,
  PRIMARY KEY (CustomerID),
  UNIQUE (PhoneNumber)
);

CREATE TABLE Discount
(
  DiscountID INT NOT NULL,
  DiscountAmount NUMERIC(6,2) NOT NULL,
  DiscountDate DATE NOT NULL,
  DiscountTime NUMERIC(4,2) NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (DiscountID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CustomerAddress
(
  area_name VARCHAR(32) NOT NULL,
  road INT NOT NULL,
  house INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (CustomerID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Ordering_food
(
  order_id INT NOT NULL,
  order_date DATE NOT NULL,
  time NUMERIC(4,2) NOT NULL,
  Deliv_Boy_ID INT NOT NULL,
  Custo_ID INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (Deliv_Boy_ID) REFERENCES Delivery_Boy(DeliveryBoy_ID),
  FOREIGN KEY (Custo_ID) REFERENCES Customer(CustomerID)
);

CREATE TABLE payment
(
  payment_id INT NOT NULL,
  netprice NUMERIC(8,2) NOT NULL,
  CashPaid NUMERIC(8,2) NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (order_id) REFERENCES Ordering_food(order_id)
);

CREATE TABLE Catalog
(
  catalog_id INT NOT NULL,
  catalog_type VARCHAR(32) NOT NULL,
  cat_order_id INT NOT NULL,
  PRIMARY KEY (catalog_id),
  FOREIGN KEY (cat_order_id) REFERENCES Ordering_food(order_id)
);

CREATE TABLE Food
(
  quantity INT NOT NULL,
  price NUMERIC(6,2) NOT NULL,
  food_name VARCHAR(32) NOT NULL,
  cat_id INT NOT NULL,
  PRIMARY KEY (food_name),
  FOREIGN KEY (cat_id) REFERENCES Catalog(catalog_id)
);

CREATE TABLE Beverage
(
  beverage_name VARCHAR(32) NOT NULL,
  price NUMERIC(6,2) NOT NULL,
  quantity INT NOT NULL,
  cat_id INT NOT NULL,
  PRIMARY KEY (beverage_name),
  FOREIGN KEY (cat_id) REFERENCES Catalog(catalog_id)
);