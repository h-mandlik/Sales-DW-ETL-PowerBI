create table dwh.FactSales(
	SalesKey int identity(1,1) Primary Key,
	Order_Number int,
	CustomerKey int,
	ProductKey int,
	DateKey int,
	Quantity_Ordered int,
	Price Decimal(10,2),
	Sales Decimal(10,2),
	DealSize nvarchar(10),
	FOREIGN KEY (CustomerKey) REFERENCES dwh.DimCustomer(CustomerKey),
    FOREIGN KEY (ProductKey) REFERENCES dwh.DimProduct(ProductKey),
    FOREIGN KEY (DateKey) REFERENCES dwh.DimDate(DateKey)
)

INSERT INTO dwh.FactSales (
    Order_Number,
    CustomerKey,
    ProductKey,
    DateKey,
    Quantity_Ordered,
    Price,
    Sales,
    DealSize
)
SELECT 
    s.Order_Number,
    dc.CustomerKey,
    dp.ProductKey,
    dd.DateKey,
    s.Quantity_Ordered,
    s.Price,
    s.Sales,
    s.DealSize
FROM stg.Sales s
JOIN dwh.DimCustomer dc ON s.CustomerName = dc.CustomerName 
    AND s.Phone = dc.Phone
JOIN dwh.DimProduct dp ON s.ProductCode = dp.ProductCode
JOIN dwh.DimDate dd ON s.OrderDate = dd.FullDate;

