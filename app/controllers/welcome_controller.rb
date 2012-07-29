class WelcomeController < ApplicationController
  def index
    @current_revenue = Location.find_by_name('City of San Francisco').revenues.order('year asc').last.amount
    @current_population = Location.find_by_name('City of San Francisco').population
    @your_chunk = @current_revenue / @current_population
    @revenues = Location.find_by_name('City of San Francisco').revenues.order('year desc').collect { |r| r.amount }.to_json
  end
end
