# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  name       :string(255)
#  population :integer
#

class Location < ActiveRecord::Base
  belongs_to :parent, class_name: 'Location', foreign_key: 'parent_id'
  has_many   :children, class_name: 'Location', foreign_key: 'parent_id'

  has_many :revenues
  has_many :expenditures, :as => :budgetable

  attr_accessible :name, :population
end
