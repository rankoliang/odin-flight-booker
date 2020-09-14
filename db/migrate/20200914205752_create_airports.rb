class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :code

      t.timestamps
      t.index :code, unique: true
    end
  end
end
