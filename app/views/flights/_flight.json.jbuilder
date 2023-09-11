json.extract! flight, :id, :date, :number_of_passengers, :departure_airport_id, :arrival_airport_id, :booking_id, :created_at, :updated_at
json.url flight_url(flight, format: :json)
