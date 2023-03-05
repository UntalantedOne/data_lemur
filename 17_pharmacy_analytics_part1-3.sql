-- p1 https://datalemur.com/questions/top-profitable-drugs
-- p2 https://datalemur.com/questions/non-profitable-drugs
-- p3 https://datalemur.com/questions/total-drugs-sales
-- CVS Health
-- Diff: Easy

-- p1:

select drug,
total_sales - cogs as total_profit
from pharmacy_sales
order by 2 desc
limit 3;

-- p2:
-- Highly unoptimised, had to use CTE just to filter the items with net loss, as using 1 query seemed suboptimal to me
with loss_drugs as (
select drug,
manufacturer,
cogs,
total_sales
from pharmacy_sales
where cogs > total_sales)
select ld.manufacturer,
count(ld.drug) as drug_count,
sum(ld.cogs - ld.total_sales) as total_loss
from pharmacy_sales ps
inner join loss_drugs ld
on ps.drug = ld.drug
and ps.manufacturer = ld.manufacturer
group by 1
order by 3 desc


-- p3:
select manufacturer,
concat('$', round(sum(total_sales) / 1000000, 0), ' million') as sale
from pharmacy_sales
group by 1
order by sum(total_sales) desc
