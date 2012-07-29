class CompareController < ApplicationController
  expose(:location_name)  { "City of San Francisco" }
  expose(:location)       { Location.find_by_name(location_name) }
  expose(:city_expenditures) { ([['Name','Amount']] + Expenditure.find_by_sql("select f.name, sum(e.amount) as total from expenditures as e join programs as p on p.id = e.budgetable_id join departments as d on d.id = p.department_id join functions as f on f.id = d.function_id where e.budgetable_type = 'Program' and e.year = 2012 group by f.name;").collect{|p| [p.name, p.total.to_i]}).to_json }
  expose(:user_expenditures) { ([['Name','Amount']] + Expenditure.find_by_sql("select f.name, sum(e.amount) as total from expenditures as e join programs as p on p.id = e.program_id join departments as d on d.id = p.department_id join functions as f on f.id = d.function_id where e.budgetable_type = 'User' group by f.name;").collect{|p| [p.name, p.total.to_i]}).to_json }

  def index

  end
end
