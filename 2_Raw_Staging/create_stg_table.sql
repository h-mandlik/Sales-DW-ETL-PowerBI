--Create table stg.Sales
CREATE TABLE stg.Sales (
    Order_Number INT,
    Quantity_Ordered INT,
    Price DECIMAL(10,2),
    OrderLineNumber INT,
    Sales DECIMAL(10,2),
    OrderDate DATE,
    Status NVARCHAR(20),
    Quarter TINYINT,
    Month TINYINT,
    Year INT,
    ProductLine NVARCHAR(50),
    MSRP INT,
    ProductCode NVARCHAR(20),
    CustomerName NVARCHAR(100),
    Phone NVARCHAR(20),
    AddressLine1 NVARCHAR(100),
    AddressLine2 NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Territory NVARCHAR(10),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DealSize NVARCHAR(10)
)
Go

--upload the data from raw.dataset to stg.Sales 
Insert into stg.Sales
select 
ORDERNUMBER as Order_Number,
QUANTITYORDERED as Quantity_Ordered,
PRICEEACH as Price,
ORDERLINENUMBER as OrderLineNumber,
SALES as Sales,
try_convert(date, ORDERDATE) as OrderDate,
STATUS as Status,	
QTR_ID as Quarter,
MONTH_ID as Month,	
YEAR_ID as Year,
PRODUCTLINE as ProductLine,
MSRP as MSRP,
PRODUCTCODE as ProductCode,
trim(CUSTOMERNAME) as CustomerName,
CASE 
    WHEN PHONE LIKE '%[^0-9]%' 
    THEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PHONE, '-', ''), '.', ''), ' ', ''), '(', ''), ')', '')
    ELSE PHONE 
END AS Phone,
trim(ADDRESSLINE1) as AddressLine1,
case 
	when ADDRESSLINE2 is null then null
	else trim(ADDRESSLINE2)
end as AddressLine2,
CASE CITY
	when 'Aaarhus' then 'Aarhus'
    WHEN 'NYC' THEN 'New York'
    WHEN 'Kobenhavn' THEN 'Copenhagen'
    WHEN 'Gensve' THEN 'Geneva'
    WHEN 'Lule' THEN 'Luleå'
    WHEN 'Minato-ku' THEN 'Tokyo'
    ELSE trim(CITY)
END as City,
CASE 
    WHEN STATE IS NULL AND COUNTRY = 'USA' THEN 'N/A'
    WHEN STATE IS NULL AND COUNTRY = 'Australia' THEN 'N/A'
    WHEN STATE = 'Victoria' AND COUNTRY = 'Australia' THEN 'VIC'
    WHEN STATE = 'NSW' AND COUNTRY = 'Australia' THEN 'NSW'
    WHEN STATE = 'Queensland' AND COUNTRY = 'Australia' THEN 'QLD'
    WHEN STATE = 'BC' AND COUNTRY = 'Canada' THEN 'BC'
    WHEN STATE = 'Quebec' AND COUNTRY = 'Canada' THEN 'QC'
	when State is null then 'N/A'
    ELSE trim(state)
END as State,
ISNULL(Trim(REPLACE(REPLACE(PostalCode, '-', ''), ' ', '')), 'N/A') AS PostalCode,
case country 
	when 'USA' then 'United States' 
	when 'UK' then 'United Kingdom'
	else Trim(Country) 
end as Country,
TERRITORY as Territory,
Trim(Upper(left(contactfirstname,1))+ Lower(Substring(contactfirstname,2,LEN(contactfirstname))))as FirstName,
Trim(Upper(left(contactlastname,1))+Lower(Substring(contactlastname,2,len(contactlastname)))) as LastName,
DEALSIZE as DealSize
from raw.dataset
