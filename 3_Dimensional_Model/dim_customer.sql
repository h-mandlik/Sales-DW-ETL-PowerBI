CREATE TABLE dwh.DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Phone NVARCHAR(20),
    AddressLine1 NVARCHAR(100),
    AddressLine2 NVARCHAR(100),
    GeographyKey INT,
    FOREIGN KEY (GeographyKey) REFERENCES dwh.DimGeography (GeographyKey)
);

INSERT INTO dwh.DimCustomer (
    CustomerName,
    FirstName,
    LastName,
    Phone,
    AddressLine1,
    AddressLine2,
    GeographyKey
)
SELECT DISTINCT
    s.CustomerName,
    s.FirstName,
    s.LastName,
    s.Phone,
    s.AddressLine1,
    s.AddressLine2,
    g.GeographyKey
FROM stg.Sales s
JOIN dwh.DimGeography g
    ON s.City = g.City
    AND s.State = g.State
    AND ISNULL(s.PostalCode, '') = ISNULL(g.PostalCode, '')
    AND s.Country = g.Country
    AND ISNULL(s.Territory, '') = ISNULL(g.Territory, '');
