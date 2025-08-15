create table dwh.DimProduct(
	ProductKey int identity(1,1) Primary Key,
	ProductCode nvarchar(20),
	ProductLine nvarchar(50),
	MSRP int ,
	Price Decimal(10,2)
)
Go

INSERT INTO dwh.DimProduct (ProductCode, ProductLine, MSRP, Price)
SELECT DISTINCT 
    ProductCode,
    ProductLine,
    MSRP,
    Price
FROM stg.Sales
WHERE ProductCode IS NOT NULL;
