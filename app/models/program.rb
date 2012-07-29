# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  parent_id      :integer
#  reference_code :string(255)
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Program < ActiveRecord::Base
  attr_accessible :name

  belongs_to :department

end
