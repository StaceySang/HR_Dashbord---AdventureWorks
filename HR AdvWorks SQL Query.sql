--Understand data
use AdventureWorks2019
SELECT * FROM [HumanResources].[Department] --It lists the departments (PK - DepartmentID). 16 departments
SELECT * FROM [HumanResources].[Employee] --Lists employee details (PK - BusinessEntityID). 290 employees
SELECT * FROM [HumanResources].[EmployeeDepartmentHistory] --Shows the no. of shifts per employee
--(BusinessEntityID, DepartmentID). 296 rows
SELECT * FROM [HumanResources].[EmployeePayHistory] --Shows employee pay (BusinessEntityID). 316 rows

--Create view
CREATE VIEW vw_HumanResources AS 
SELECT 
    e.BusinessEntityID,
    e.NationalIDNumber,
    e.LoginID,
    e.JobTitle,
    e.BirthDate,
    e.MaritalStatus,
    e.Gender,
    e.HireDate,
    e.SalariedFlag,
    e.VacationHours,
    e.SickLeaveHours,
    d.Name AS DepartmentName,
    edh.ShiftID,
    edh.StartDate AS DeptStartDate,
    edh.EndDate AS DeptEndDate,
    eph.RateChangeDate,
    eph.Rate,
    eph.PayFrequency,

    -- New calculated columns
    eph.Rate * 2080 AS AnnualSalary,
    DATEDIFF(YEAR, e.HireDate, GETDATE()) AS Tenure,
    CAST(GETDATE() AS DATE) AS RefreshDate

FROM [HumanResources].[Employee] e
LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] edh
    ON e.BusinessEntityID = edh.BusinessEntityID
LEFT JOIN [HumanResources].[Department] d
    ON edh.DepartmentID = d.DepartmentID
LEFT JOIN [HumanResources].[EmployeePayHistory] eph
    ON e.BusinessEntityID = eph.BusinessEntityID;

SELECT * FROM vw_HumanResources--334 employees

--To identify duplicates
SELECT *
FROM vw_HumanResources
WHERE BusinessEntityID IN (
    SELECT BusinessEntityID
    FROM vw_HumanResources
    GROUP BY BusinessEntityID
    HAVING COUNT(*) > 1
);-- 57 employees
