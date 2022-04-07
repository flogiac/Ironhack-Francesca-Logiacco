-- from presentation about architecture of data system: week3 day 4.

-- Get the total sales in Germany for REWE (look at slide ... of ppt):
select total sales from FACT
group by country_id
having country_id=1;

