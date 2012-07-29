class Expenditure < ActiveRecord::Base
  belongs_to :budgetable, :polymorphic => true
  # attr_accessible :title, :body
end
