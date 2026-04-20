SELECT * FROM `practical-3-on-15-april-2026.Retail_Sales.Data` LIMIT 1000; 
---Question 1: Filter all transactions that occurred in the year 2023.---
SELECT *
FROM `practical-3-on-15-april-2026.Retail_Sales.Data`
Where Date Between  '2023-01-01' AND '2023-12-31';

---Question 2: Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.-

SELECT *
 FROM `practical-3-on-15-april-2026.Retail_Sales.Data`
 Where `Total Amount` > (SELECT AVG(`Total Amount`)
 FROM `practical-3-on-15-april-2026.Retail_Sales.Data`);

---Question 3: Calculate the total revenue (sum of Total Amount). Expected Output: Total_Revenue---
SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `practical-3-on-15-april-2026.Retail_Sales.Data`;

---Question 4:Display all distinct Product Categories in the dataset. Expected Output: Product_Category---
Select DISTINCT `Product Category`
FROM `practical-3-on-15-april-2026.Retail_Sales.Data`;

---Question 5: For each Product Category, calculate the total quantity sold. Expected Output: Product_Category, Total_Quantity---
Select `Product Category`, Sum(Quantity) AS Total_Quantity_Sold
FROM `practical-3-on-15-april-2026.Retail_Sales.Data`
GROUP BY`Product Category`;

---Question 6: Create a column called Age_Group that classifies customers as: – 'Youth' (<30) 'Adult' (30–59) – 'Senior' (60+) Expected Output: Customer_ID, Age, Age_Group ---
Select `Customer ID`, Age,
  Case
      When Age < 30 Then 'Youth'
      When Age Between 30 AND 59 Then 'Adult'
      When Age > 60 Then 'Senior'
  End AS Age_Group
From `practical-3-on-15-april-2026.Retail_Sales.Data`;

---Question 7: For each Gender, count how many high-value transactions occurred (where Total Amount > 500). 
---Expected Output: Gender, High_Value_Transactions--
Select Gender, Count(`Transaction ID`) AS High_Value_Transactions
FROM `practical-3-on-15-april-2026.Retail_Sales.Data`
WHERE `Total Amount` >500
GROUP BY Gender;

---Question 8:For each Product Category, show only those categories where the total revenue exceeds 5,000. Expected Output: Product_Category, Total_Revenue---
Select `Product Category`, Sum(`Total Amount`) AS Total_Revenue
From `practical-3-on-15-april-2026.Retail_Sales.Data`
GROUP BY `Product Category`
HAVING TOTAL_REVENUE > 5000;

---Question 9: Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200 Expected Output: Transaction_ID, Price_per_Unit, Unit_Cost_Category---

Select `Transaction ID`, `Price Per Unit`,
   CASE
      When `Price per Unit` < 50 then 'Cheap'
      When `Price per Unit` Between 50 AND 200 then 'Moderate'
      When `Price per Unit` > 200 then 'Expensive'
  END AS Unit_Cost_Categpry
From `practical-3-on-15-april-2026.Retail_Sales.Data`;

---Question 10: Display all transactions from customers aged 40 or older and add a column Spending_Level showing: – 'High' if Total Amount > 1000 – 'Low' otherwise Expected Output: Customer_ID, Age, Total_Amount, Spending_Level---
 SELECT `Customer ID`, Age, `Total Amount`,
     CASE
        WHEN `Total Amount` > 1000 THEN 'High'
       ELSE 'Low'
     END AS Spending_Level
 From `practical-3-on-15-april-2026.Retail_Sales.Data`
 Where Age >= 40;





