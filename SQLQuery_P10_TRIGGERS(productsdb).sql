/*
CREATE DATABASE productsdb;
*/
USE productsdb;
/*
CREATE TABLE Products
(
	Id INT IDENTITY PRIMARY KEY,
	ProductName NVARCHAR(30) NOT NULL,
	Manufacturer NVARCHAR(20) NOT NULL,
	ProductCount INT DEFAULT 0,
	Price MONEY NOT NULL
);

CREATE TABLE History
(
	Id INT IDENTITY PRIMARY KEY,
	ProductId INT NOT NULL,
	Operation NVARCHAR(200) NOT NULL,
	CreateAt DATETIME NOT NULL DEFAULT GETDATE()
);
*/
--------------------------------------------------------------------------
/*

GO
CREATE TRIGGER Products_INSERT
  ON Products
  AFTER INSERT
  AS 
  INSERT INTO HISTORY(ProductId, Operation)
    SELECT Id, 'Добавлен товар' + ProductName +' фирма' + Manufacturer
	FROM INSERTED;


GO
CREATE OR REPLACE TRIGGER Products_DELETE
ON Products
AFTER DELETE
AS 
INSERT INTO History (ProductId, Operation)
  SELECT id, 'Удален товар '+ ProductName + ' фирма ' + Manufacturer
  FROM DELETED;


GO
CREATE TRIGGER Product_UPDATE
ON Products
AFTER UPDATE
AS
INSERT INTO History (ProductId, Operation)
  SELECT Id, 'Обновлен товар ' + ProductName + ' фирма ' + Manufacturer
  FROM INSERTED;
  */

  /*
GO
CREATE TRIGGER before_INSERT
 ON Products FOR INSERT AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO History(Operation) VALUES('new student was added at history before');
	SELECT * FROM Products;
END;
GO
  */

/*

GO
CREATE TRIGGER Products_INSTEAD_OF_DELETE
ON Products
INSTEAD OF DELETE
AS 
INSERT INTO History (ProductId, Operation)
  SELECT id, 'Нельзя удалить товар '+ ProductName + ' фирма ' + Manufacturer
  FROM Products;


GO
CREATE TRIGGER Product_INSTEAD_UPDATE
ON Products
INSTEAD OF UPDATE
AS
INSERT INTO History (ProductId, Operation)
  SELECT Id, 'Обновление запрещено для товарa ' + ProductName + ' фирма ' + Manufacturer
  FROM Products;

*/



/*
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES ('iPhone 9', 'Apple', '69', 69000);

DELETE FROM Products
WHERE Id = 4

UPDATE Products 
SET ProductName = 'iPhone 8',
    ProductCount = '120',
	Price = 56000;


DELETE FROM Products WHERE Id=3;
*/







--------------------------------------------------------------------

--DISABLE TRIGGER ALL ON Products

--DISABLE TRIGGER Product_INSERT ON Products

---------------------------------------------------------------------