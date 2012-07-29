# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  reference_code :string(255)
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  department_id  :integer
#

class Program < ActiveRecord::Base

  attr_accessible :name

  belongs_to :department
  has_many :expences, :as => :budgetable

  def to_s
    name
  end

end
