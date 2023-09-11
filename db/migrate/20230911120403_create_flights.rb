class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :number_of_passengers
      t.belongs_to :departure_airport, null: false, foreign_key: false
      t.belongs_to :arrival_airport, null: false, foreign_key: false
      # t.belongs_to :booking, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
