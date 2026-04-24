# Predictive Health Monitoring for Jet Engines (NASA C-MAPSS)

![Status](https://img.shields.io/badge/Status-Complete-success)
![Tools](https://img.shields.io/badge/Tools-SQL%20|%20Python%20|%20Power%20BI-blue)
![ML](https://img.shields.io/badge/Model-Random%20Forest%20Regressor-green)

## Project Overview
Unplanned jet engine failure in the aerospace industry is catastrophic and costly. This project transitions from **Reactive** to **Predictive** maintenance by leveraging the NASA Turbofan (C-MAPSS) dataset. By predicting the **Remaining Useful Life (RUL)** of engines, this solution aims to increase operational efficiency by **25%**.

## Business Impact
- **Optimization:** Moved maintenance from rigid schedules to data-driven interventions.
- **Accuracy:** Achieved an 11-cycle precision window for engine servicing.
- **Safety:** Identified a "Failure Signature" to flag critical assets before breakdown.

---

## 🛠️ Technical Stack
* **Data Cleaning:** Excel (Initial schema structuring)
* **Data Engineering:** MySQL (Window Functions, Feature Selection)
* **Machine Learning:** Python (Scikit-Learn, Random Forest Regressor)
* **Business Intelligence:** Power BI (DAX, Star Schema Modeling)

---

## Workflow & Methodology

### 1. Data Engineering (SQL)
Transformed 20,632 rows of raw telemetry into a high-integrity database.
* **Target Engineering:** Used SQL `WINDOW FUNCTIONS` partitioned by `unit_id` to calculate the **Remaining Useful Life (RUL)**.
* **Signal Cleaning:** Removed zero-volatility sensor columns to eliminate noise.

### 2. Machine Learning (Python)
Implemented a **Random Forest Regressor** to capture non-linear wear-and-tear patterns.
* **Performance:**
    * **$R^2$ Score:** 0.95
    * **Mean Absolute Error (MAE):** 11.88 Cycles
* **Synthesis:** Exported AI predictions merged with original telemetry for dashboard integration.

### 3. Business Intelligence (Power BI)
Designed a "Command Center" dashboard with a **Midnight Navy (#020617)** and **Emerald Green (#10B981)** theme.
* **Star Schema:** Established relationships between `Fact_Engines`, `Dim_Engines`, and a custom `Dim_Calendar`.
* **Temporal Analytics:** Converted engine "cycles" into specific "calendar dates" for logistical planning.

---

##  Key Insights
* **The Failure Signature:** Discovered that **Turbine Temperature (S4)** and **Pressure (S11)** converge at a critical threshold (approx. 1425 and 48 respectively) near **Cycle 271**.
* **Maintenance Trigger:** Established a proactive **20-cycle safety buffer** for the fleet.
