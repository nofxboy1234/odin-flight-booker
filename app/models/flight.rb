class Flight < ApplicationRecord
  scope :dates_with_flights, -> { Flight.select(:date).distinct.order(:date) }
  scope :flights_matching_search, lambda { |departure_airport_id, arrival_airport_id, date|
    where(departure_airport_id:)
      .where(arrival_airport_id:)
      .where(date:)
  }

  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :bookings

  def date_formatted
    date.strftime('%d/%m/%Y')
  end
end
