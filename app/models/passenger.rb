class Passenger < ApplicationRecord
  validates :name, presence: true

  has_many :booking_passengers
  has_many :bookings, through: :booking_passengers
  has_many :flights, through: :bookings
end
