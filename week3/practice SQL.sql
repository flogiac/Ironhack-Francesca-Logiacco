use bank;
-- select * from account.  ->> to open a database from the folder. 
-- or you write only directly:    select * from bank.account

select amount, payments, amount-payments AS "balance of account" from loan 
-- select difference amount - payments from loan. 
-- AS to change the title in the table.
-- if you put also   *,   after select, you get also all the other data from the table.

where amount >1000 and payments >1000
order by payments DESC
limit 10

select * from loan where duration %2 =0
-- to filter data ( % is the mode)

select * from loan where duration >20
loan[loan['duration']>20]]['amount']
-- loan[loan['duration']>20]]   ->  is the way that you would use in pandas.
-- select difference amount - payments from loan. 



 