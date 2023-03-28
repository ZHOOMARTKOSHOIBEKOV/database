/*
CREATE DATABASE flower_shop; 
*/

USE flower_shop;
/*


CREATE TABLE flower
(
	id_flower INT IDENTITY PRIMARY KEY,
	name VARCHAR(32) NOT NULL,
	color VARCHAR(32) NOT NULL,
	price MONEY NOT NULL,
	size INT NOT NULL,
);

CREATE TABLE client
(
	id_client INT IDENTITY PRIMARY KEY,
	first_name NVARCHAR(64) NOT NULL,
	last_name NVARCHAR(64) NOT NULL
);


CREATE TABLE flower_order
(
	id_flower_order INT IDENTITY PRIMARY KEY,
	order_type NVARCHAR(64) NOT NULL,
	order_price INT NOT NULL,
	id_flower INT FOREIGN KEY REFERENCES flower(id_flower),
	id_client INT FOREIGN KEY REFERENCES client(id_client)
);

*/

/*
BEGIN TRANSACTION;
DECLARE @a INT, @b INT, @c INT;
SET @a = 10;
SET @b = 15;
SET @c = 0;
IF @c >= 0
  BEGIN
  SELECT @a + @b + @c;
  END;
ELSE
  ROLLBACK TRANSACTION;
COMMIT TRANSACTION;
*/

--------------------------------------------------------------------
/*
CREATE TRIGGER client_insert_trigger
ON client
AFTER INSERT
AS
BEGIN
IF EXISTS (SELECT 1 FROM INSERTED WHERE last_name = '')
BEGIN
RAISERROR ('last_name cannot be blank', 16, 1);
ROLLBACK TRANSACTION;
END


BEGIN TRANSACTION;

INSERT INTO client (last_name, first_name)
VALUES('pp', 'Хорош');

COMMIT TRANSACTION
*/

--------------------------------------------------------------------

BEGIN TRANSACTION;
IF (SELECT isPaid FROM flower_order WHERE id_client = 2) = 0
  ROLLBACK TRANSACTION;
ELSE
  INSERT INTO flower_order VALUES ('это мой заказ', '3000', 4, 4, 0);
COMMIT TRANSACTION;

