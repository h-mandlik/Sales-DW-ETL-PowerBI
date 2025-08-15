USE master;
GO

-- Drop database if exists
IF DB_ID('SalesDW') IS NOT NULL
    DROP DATABASE SalesDW;
GO

-- Create database
CREATE DATABASE SalesDW;
GO

USE SalesDW;
GO

-- Create schemas
IF SCHEMA_ID('raw') IS NOT NULL DROP SCHEMA raw;
IF SCHEMA_ID('stg') IS NOT NULL DROP SCHEMA stg;
IF SCHEMA_ID('dwh') IS NOT NULL DROP SCHEMA dwh;
GO

CREATE SCHEMA raw;
CREATE SCHEMA stg;
CREATE SCHEMA dwh;
GO
