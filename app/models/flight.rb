class Flight < ApplicationRecord
  validates :origin, presence: true
  validates :destination, presence: true
  validates :departure_time, presence: true
  validates :duration, presence: true

  belongs_to :origin, class_name: 'Airport', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Airport', foreign_key: 'destination_id'
end
