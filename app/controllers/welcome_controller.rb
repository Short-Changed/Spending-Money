class WelcomeController < ApplicationController

  expose(:location_name)  { "City of San Francisco" }
  expose(:location)       { Location.find_by_name(location_name) }
  expose(:population)     { location.population }
  expose(:yearly_revenues) { location.revenues.order('year asc') }
  expose(:revenues)       { yearly_revenues.collect{|r| [r.year.to_s, r.amount]}.to_json }
  expose(:revenue)        { yearly_revenues.last.amount }
  expose(:your_chunk)     { (revenue / population) - User.find(1).expenditures.sum(:amount) }

  def index
  end
end
