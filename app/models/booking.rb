class Booking < ApplicationRecord
  has_many :passengers
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: lambda { |attributes| attributes[:name].blank? || attributes[:email].blank? }
end
