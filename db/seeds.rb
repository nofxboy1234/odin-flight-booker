# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Passenger.delete_all
Flight.delete_all
Airport.delete_all
Booking.delete_all

2.times do |i|
  Passenger.create(id: i,
                   name: "Passenger #{i}",
                   email: "passenger#{i}@palmboom.com",
                  booking_id: i,
                  flight_id: i)
end

2.times do |i|
  Flight.create(id: i,
                date: Date.today + i,
                departure_airport_id: i,
                arrival_airport_id: i + 1)
end

3.times do |i|
  Airport.create(id: i,
                 code: "Airport #{i}")
end

2.times do |i|
  Booking.create(id: i)
end


