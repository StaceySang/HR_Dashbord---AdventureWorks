# HR_Dashbord - AdventureWorks
This project explores **HR and compensation data** from the AdventureWorks database using **SQL and Power BI**. A custom SQL view was created by joining key tables from 'HumanResources.Department', 'HumanResources.Employee', 'HumanResources .EmployeeDepartmentHistory', and 'HumanResources.EmployeePayHistory'. The view was then loaded into Power BI, where insights were visualized through interactive dashboards.

### **Key Enhancements & Added Columns**  
To improve analytical depth and reporting accuracy, I added the following columns:  

1️⃣ **Annual Salary (`Rate * 2080`)**  
   - This calculation standardizes salary figures by **multiplying the hourly rate by 2080**, which represents the total working hours in a year (40 hours per week * 52 weeks).  
   - It provides a **consistent metric** for salary comparison across employees.  

2️⃣ **Tenure (Employee Duration)**  
   - Measures **how long each employee has been with the company**, based on their start date and the current date.  
   - Helps identify employee retention trends, turnover rates, and workforce stability.  

3️⃣ **Refresh Date**  
   - Automatically updates to reflect **the last data refresh** in Power BI.  
   - Ensures reports are **up-to-date** and helps track historical changes in salary and tenure over time.  

### **Dashboard Overview**  
The Power BI report consists of **two key pages**:  
📌 **Employee Details** – Displays individual employee attributes, department assignments, and tenure.  
📌 **Compensation Insights** – Showcases salary distributions, historical pay trends, and workforce analytics.  

### **Technologies Used**  
✅ **SQL** – Data extraction & transformation  
✅ **Power BI** – Data modeling & visualization  
✅ **DAX** – Performance calculations  
