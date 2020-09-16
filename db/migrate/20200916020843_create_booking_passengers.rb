class CreateBookingPassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_passengers, id: false do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
