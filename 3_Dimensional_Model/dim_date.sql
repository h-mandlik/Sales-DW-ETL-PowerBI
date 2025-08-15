CREATE TABLE dwh.DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Day TINYINT,
    Month TINYINT,
    MonthName NVARCHAR(10),
    Quarter TINYINT,
    Year SMALLINT,
    DayOfWeek TINYINT,
    DayName NVARCHAR(10),
    WeekOfYear TINYINT
);
Go 

INSERT INTO dwh.DimDate
SELECT DISTINCT
    CONVERT(INT, FORMAT(OrderDate, 'yyyyMMdd')) AS DateKey,
    OrderDate AS FullDate,
    DAY(OrderDate) AS Day,
    MONTH(OrderDate) AS Month,
    FORMAT(OrderDate, 'MMMM') AS MonthName,
    Quarter AS Quarter,
    Year AS Year,
    DATEPART(WEEKDAY, OrderDate) AS DayOfWeek,
    FORMAT(OrderDate, 'dddd') AS DayName,
    DATEPART(WK, OrderDate) AS WeekOfYear
FROM stg.Sales
WHERE OrderDate IS NOT NULL;
