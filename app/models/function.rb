# == Schema Information
#
# Table name: functions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reference_code :string(255)
#

class Function < ActiveRecord::Base

  attr_accessible :name

  has_many :departments
  has_many :expences, :as => :budgetable

  def to_s
    name
  end

end
