class Location < ActiveRecord::Base
  has_many :revenues
  attr_accessible :name, :population
end
