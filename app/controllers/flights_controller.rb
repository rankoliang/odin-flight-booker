class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @departure_dates = Flight.departure_dates.map(&:departure_date).uniq
  end
end
