class Booking < ApplicationRecord
  validates :flight, presence: true

  belongs_to :flight
  has_many :booking_passengers, inverse_of: :booking
  has_many :passengers, through: :booking_passengers
  accepts_nested_attributes_for :booking_passengers, :passengers

  def send_thank_you_emails
    passengers.each do |passenger|
      PassengerMailer.thank_you_email(self, passenger)
                     .deliver_now
    end
  end
end
