use bank;


-- Q1: Get the customers for which the loan borrowed amount is higher than the average loan amount.

-- -- step1. getting the average amountof the loan
select avg(amount) from bank.loan;

-- -- step2. main query and parent query
select account_id, amount from bank.loan 
where amount > (select avg(amount) from bank.loan);

-- Q2: Get for each account, the total amount transferred, destination bank and destination account,
-- which are above 10K

-- -- step1. child query
-- total_amount_for_each_account>1000
-- then you first write:

select sum(amount), account_id from bank.order
GROUP BY account_id
having total_amount>10000;

-- -- step2. organize the query

select account_id, account_to, bank_to, sum(amount) as total_amount from bank.order
GROUP BY account_id, account_to, bank_to
having total_amount >10000;


-- -- step3. take all the query as a subquery and select the output from the subquery
select * from
(select account_id, account_to, bank_to, sum(amount) as total_amount from bank.order
GROUP BY account_id, account_to, bank_to) as sub1
where total_amount >10000;

-- -- 

select * from
result_table = (select account_id,account_to,bank_to,sum(amount) as total_amount from bank.order
GROUP BY account_id, account_to, bank_to) as sub1
where total_amount >10000;

select * from result_table where total_amount >10000;


-- Q3: Which transactions of bank.trans are in the list 
-- (In this query we are trying to find the k_symbols based on the average amount from the table order. 
-- The average amount should be more than 3000)

-- -- Child query:

select k_symbol, round(avg(amount),2) as Average from bank.order
where k_symbol not in ('',' ')
group by k_symbol
having Average > 3000;


select * from bank.trans
where k_symbol in("SIPO", "UVER");


select * from bank.trans
where k_symbol in( 
select k_symbol from( 
select k_symbol, round(avg(amount),2) as Average from bank.order
where k_symbol not in ('',' ')
group by k_symbol
having Average > 3000) as sub1
);



