-- Location expenditure
select f.name, sum(e.amount) as total
from expenditures as e
join programs as p on p.id = e.budgetable_id
join departments as d on d.id = p.program_id
join functions as f on f.id= d.function_id
where e.budgetable_type = 'Program'
and e.year = 2012
group by f.name;

-- User expenditure
select f.name, sum(e.amount) as total
from expenditures as e
join programs as p on p.id = e.budgetable_id
join departments as d on d.id = p.program_id
join functions as f on f.id= d.function_id
where e.budgetable_type = 'User'
and e.year = 2012
group by f.name;
