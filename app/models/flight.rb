class Flight < ApplicationRecord
  validates :origin, presence: true
  validates :destination, presence: true
  validates :departure_time, presence: true
  validates :duration, presence: true

  belongs_to :origin, class_name: 'Airport', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Airport', foreign_key: 'destination_id'

  scope :departure_dates, lambda {
                            select(:departure_time)
                              .where('departure_time > ?', DateTime.now)
                              .order(:departure_time)
                          }

  def departure_date_formatted
    departure_time.strftime('%m-%d-%Y')
  end

  def departure_date
    departure_time.to_date
  end
end
