class SpendingController < ApplicationController

  def index
    @functions = Function.all
    @current_city = 'City of San Francisco'
    @current_revenue = Location.find_by_name(@current_city).revenues.order('year asc').last.amount
    @current_population = Location.find_by_name(@current_city).population
    @your_chunk = @current_revenue / @current_population
  end

end
