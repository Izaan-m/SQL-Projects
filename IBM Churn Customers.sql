create database ibm;

use ibm;

select * from churned;

-- Query 1: Considering the top 5 groups with the highest average monthly charges among churned customers, how can personalized offers be tailored based on age, gender, and contract type to potentially improve customer retention rates?

alter table churned
rename column`Monthly Charge` to monthly_charge;

alter table churned
rename column`Customer Status` to `Customer_Status`;

select offer, avg(monthly_charge) as "Average Montly Charge for Churned",
avg(age) as "Average Age",
count(case when Gender = 'Male' then 1 end) as "Male count",
count(case when Gender = 'Female' then 1 end) "Female count",
contract
from churned
where Customer_Status = 'churned'
group by offer, contract
order by avg(monthly_charge) desc
limit 5;



-- What are the feedback or complaints from those churned customers
alter table churned
rename column`Churn Category` to Churn_Category;

alter table churned
rename column`Churn Reason` to Churn_Reason;

select Churn_Category,count(*) as count, Churn_Reason from churned
where customer_status = 'Churned'
group by Churn_Category, Churn_Reason
order by Churn_Category desc , Churn_Reason desc;


-- How does the payment method influence churn behavior?
select payment_method,
count(*) as "Total Customers",
count(case when Customer_Status = 'Churned' then 1 end) as 'Churned Customer',
count(case when Customer_Status = 'Churned' then 1 end)/count(*) * 100 as 'Churned Rate'
from churned
group by payment_method
