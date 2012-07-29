-- Location expenditure
select f.name, sum(e.amount) as total
from expenditures as e
join programs as p on p.reference_code = e.program_id::text
join departments as d on d.reference_code = p.program_id::text
join functions as f on f.reference_code = d.function_id::text
where e.budgetable_type = 'Location'
and e.year = 2012
group by f.name;

-- User expenditure
select f.name, sum(e.amount) as total
from expenditures as e
join programs as p on p.reference_code = e.program_id::text
join departments as d on d.reference_code = p.program_id::text
join functions as f on f.reference_code = d.function_id::text
where e.budgetable_type = 'User'
and e.year = 2012
group by f.name;
