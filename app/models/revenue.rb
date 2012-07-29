# == Schema Information
#
# Table name: revenues
#
#  id         :integer          not null, primary key
#  amount     :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Revenue < ActiveRecord::Base
  attr_accessible :amount, :year
end
