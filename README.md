# Sales Data Warehouse & BI Dashboard

![Power BI Dashboard](dashboard-screenshot.png) <!-- Optional: Add screenshot -->

A complete end-to-end data analytics project that transforms raw sales data into actionable insights using SQL Server for ETL and Power BI for visualization.

---

## 📌 Problem Statement

The dataset provided is a single flat file containing sales records with inconsistent, unstructured, and dirty data — including missing values, incorrect formats, duplicate entries, and mixed text cases. This makes direct analysis unreliable and inefficient.

**Objective**:  
Build a reliable data pipeline to:
- Clean and structure raw sales data
- Model a star schema for analytical performance
- Enable business intelligence reporting and dashboards
- Support decision-making with accurate, timely insights

This project simulates real-world scenarios faced by data analysts and engineers in retail or e-commerce environments.

---

## 🛠️ Steps Followed

### 1. **Data Acquisition**
- Dataset sourced from Kaggle: [Sample Sales Data](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data)
- Single CSV file ingested into SQL Server using Import Wizard

### 2. **Database & Schema Design**
- Created database: `SalesDW`
- Implemented layered architecture:
  - `raw` – for initial ingestion
  - `stg` – for cleaned and standardized data
  - `dwh` – for dimensional modeling (star schema)

### 3. **Data Cleaning (SQL Server)**
Key cleaning operations:
- Standardized `ORDERDATE` using `TRY_CONVERT(DATE, ORDERDATE)`
- Cleaned phone numbers: removed special characters (`-`, `.`, `(`, `)`, spaces)
- Fixed inconsistent text: `USA` → `United States`, `NYC` → `New York`, etc.
- Applied proper case for names and addresses
- Handled NULLs and invalid entries

### 4. **Star Schema Modeling**
Built in `dwh` schema:
- **Fact Table**: `FactSales` (measures: Sales, Quantity, Price)
- **Dimension Tables**:
  - `DimCustomer`
  - `DimProduct`
  - `DimGeography`
  - `DimDate`

All tables linked via surrogate keys.

### 5. **BI Visualization (Power BI)**
- Connected Power BI to `SalesDW`
- Modeled relationships between fact and dimension tables
- Created key DAX measures:
  - `Total Sales`, `Total Orders`, `Average Sale`, `Total Customers`
- Built interactive dashboard with slicers and drill-down capability

### 6. **Deployment & Documentation**
- Published dashboard to Power BI Service
- All SQL scripts saved in `.sql` files (organized by phase)
- This documentation added to GitHub repo

---

## 💡 Insights

- **Sales Trend**: Declining sales over time — indicates need for marketing or product review.
- **Top Markets**: United States and Australia are leading contributors to revenue.
- **Product Performance**: Classic Cars and Motorcycles generate the highest sales.
- **Deal Size**: Medium deals dominate volume, but large deals contribute significantly to total revenue.
- **Geographic Spread**: Strong presence across multiple territories, with room for growth in EMEA.

These insights help identify growth opportunities, optimize inventory, and improve customer targeting.

---

Sales-DW-ETL-PowerBI/
│
├── 1_Setup/
│   └── create_database.sql
│
├── 2_Raw_Staging/
│   ├── create_raw_table.sql
│   ├── create_stg_table.sql
│   └── clean_and_load_staging.sql
│
├── 3_Dimensional_Model/
│   ├── dim_geography.sql
│   ├── dim_customer.sql
│   ├── dim_product.sql
│   ├── dim_date.sql
│   ├── fact_sales.sql
│   └── load_dimensions_and_fact.sql
│
├── 4_PowerBI/
│   └── Sales_Analysis.pbix
│
├── docs/
│   └── dashboard_screenshot.png
│
├── README.md
│
└── .gitignore

---

## 🚀 How to Reproduce

1. Run SQL scripts in order from `01-Setup` to `03-DW`
2. Ensure all tables are populated and relationships built
3. Open `Sales_Analysis.pbix` in Power BI Desktop
4. Refresh data or update connection to your SQL Server instance
5. Explore the dashboard

---

## 🧑‍💻 Built With
- **SQL Server** – Data cleaning & warehousing
- **Power BI** – Visualization & reporting
- **DAX** – Measures and calculations
- **GitHub** – Version control & documentation

---

## 📬 Feedback & Improvements
This project can be extended with:
- Incremental data load patterns
- Automated SSIS/SSAS pipeline
- Predictive analytics (forecasting)
- Row-Level Security (RLS) in Power BI

---

> Prepared by: Junior Data Analyst  
> Date: April 5, 2025  
> Mentor: Data Analyst Manager
