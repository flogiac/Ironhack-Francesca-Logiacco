use bank;
select * from bank.account as acc inner join bank.loan as ln using(account_id);

select * from bank.account as acc left join bank.loan as ln using(account_id);

select count(*) from bank.account as acc inner join bank.loan as ln using(account_id);

select count(*) from bank.account as acc right join bank.loan as ln using(account_id);


-- RIGHT JOIN:
select acc.account_id, loan_id from bank.account as acc 
right join bank.loan as ln on acc.account_id=ln.account_id
where ln.amount>100000;
-- NOTEs: -- you add acc.account at the beginning before to define it because you have also another different account_id and it get confused.
          -- to join 2 data set with the right join and select only the people that have the same account_id from the right and the left data set.
          
  
  
-- FULL JOIN:
select * from bank.account as acc     
left join bank.loan as ln on acc.account_id=ln.account_id
union
select * from bank.account as acc  
right join bank.loan as ln on acc.account_id=ln.account_id;


