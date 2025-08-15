CREATE TABLE dwh.DimGeography (
    GeographyKey INT IDENTITY(1,1) PRIMARY KEY,
    City NVARCHAR(50),
    State NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Territory NVARCHAR(10)
);
Go

INSERT INTO dwh.DimGeography (City, State, PostalCode, Country, Territory)
SELECT DISTINCT
    City,
    State,
    PostalCode,
    Country,
    Territory
FROM stg.Sales
WHERE City IS NOT NULL AND Country IS NOT NULL;
