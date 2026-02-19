use Fingertips;

select * from account_fact

select * from acustomer_dim

-- q1. show all customers with their country and balance
select 
    d.customer_id,
    d.country,
    f.balance
from account_fact f
join acustomer_dim d
    on f.customer_id = d.customer_id;


-- q2. display customers who have a credit card
select *
from account_fact
where credit_card = 1;


-- q3. count total number of customers
select count(*) as total_customers
from acustomer_dim;


-- q4. average balance by country (only countries having more than 50 customers)
select 
    d.country,
    avg(f.balance) as avg_balance,
    count(*) as total_customers
from account_fact f
join acustomer_dim d
    on f.customer_id = d.customer_id
group by d.country
having count(*) > 50;


-- q5. gender-wise average credit score (only active members)
select 
    d.gender,
    avg(f.credit_score) as avg_credit_score
from account_fact f
join acustomer_dim d
    on f.customer_id = d.customer_id
where f.active_member = 1
group by d.gender;


-- q6. find number of churned customers
select count(*) as churned_customers
from account_fact
where churn = 1;


-- q7. find average credit score of active members
select avg(credit_score) as avg_credit_score
from account_fact
where active_member = 1;


-- q8. find customers whose balance is higher than average balance
select *
from account_fact
where balance > (select avg(balance) from account_fact);


-- q9. country-wise churn count and average balance (churn count > 10)
select 
    d.country,
    sum(f.churn) as churn_count,
    avg(f.balance) as avg_balance
from account_fact f
join acustomer_dim d
    on f.customer_id = d.customer_id
group by d.country
having sum(f.churn) > 10;


-- q10. country-wise average balance greater than overall average balance
select 
    d.country,
    avg(f.balance) as avg_balance
from account_fact f
join acustomer_dim d
    on f.customer_id = d.customer_id
group by d.country
having avg(f.balance) > (select avg(balance) from account_fact);