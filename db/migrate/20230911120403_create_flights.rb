class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :number_of_passengers
      t.belongs_to :departure_airport, null: false, foreign_key: true
      t.belongs_to :arrival_airport, null: false, foreign_key: true
      t.belongs_to :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
