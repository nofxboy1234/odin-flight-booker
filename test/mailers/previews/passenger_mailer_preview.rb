# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    PassengerMailer.with(passenger: Passenger.first).welcome_email
  end
end
