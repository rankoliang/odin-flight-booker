class PassengerMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def thank_you_email(booking, passenger)
    @booking = booking
    @passenger = passenger
    @flight = @booking.flight
    mail(to: @passenger.email, subject: 'Thank you for booking your flight!')
  end
end
