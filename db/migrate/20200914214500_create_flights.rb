class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :origin
      t.references :destination
      t.datetime :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
