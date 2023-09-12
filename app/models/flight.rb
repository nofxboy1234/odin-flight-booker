class Flight < ApplicationRecord
  scope :dates_with_flights, -> { Flight.select(:id, :date).order(:date) }
  
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  # belongs_to :booking

  has_many :passengers

  def date_formatted
    date.strftime("%d/%m/%Y")
  end
end
