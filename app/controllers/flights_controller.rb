class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @departure_dates = Flight.departure_dates.map(&:departure_date).uniq

    return unless params[:passengers]

    @passengers = params[:passengers]
    @flight_results = Flight.includes(:origin, :destination)
                            .where(locations)

    unless params[:departure_date].blank?
      same_day = 'julianday(flights.departure_time) - julianday(?) between 0 and 1'
      @flight_results = @flight_results
                        .where(same_day, params[:departure_date])
    end
  end

  private

  def locations
    { origin_id: params[:origin_id],
      destination_id: params[:destination_id] }
      .reject { |_, field| field.blank? }
  end

  def flight_results; end
end
