class RemoveFlightIdFromPassengers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :passengers, :flight, index: true, foreign_key: true
  end
end
