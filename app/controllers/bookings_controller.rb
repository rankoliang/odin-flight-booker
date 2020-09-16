class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    @passengers = Array.new(params[:passengers].to_i) { @booking.passengers.build }
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      redirect_to booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.includes(:passengers).find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
