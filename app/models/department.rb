# == Schema Information
#
# Table name: departments
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  reference_code :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  function_id    :integer
#

class Department < ActiveRecord::Base
  attr_accessible :name, :reference_code

  belongs_to :function
  has_many :programs
  has_many :expenditure, :as => :budgetable

  def to_s
    name
  end

end
