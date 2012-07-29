# == Schema Information
#
# Table name: expenditures
#
#  id              :integer          not null, primary key
#  year            :integer
#  amount          :integer
#  budgetable_type :string(255)
#  budgetable_id   :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Expenditure < ActiveRecord::Base
  belongs_to :budgetable, :polymorphic => true
  attr_accessible :year, :amount, :budgetable_type, :budgetable_id, :program_id
end
