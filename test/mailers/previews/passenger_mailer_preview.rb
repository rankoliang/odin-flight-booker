# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def thank_you_email
    booking = Booking.first
    passenger = booking.passengers.first
    PassengerMailer.thank_you_email(booking, passenger)
  end
end
