class WelcomeController < ApplicationController

  expose(:location_name)  { "City of San Francisco" }
  expose(:location)       { Location.find_by_name(location_name) }
  expose(:population)     { location.population }
  expose(:yearly_revenues) { location.revenues.order('year asc') }
  expose(:revenues)       { yearly_revenues.collect(&:amount).to_json }
  expose(:revenue)        { yearly_revenues.last.amount }
  expose(:your_chunk)     { revenue / population }

  def index
  end
end
