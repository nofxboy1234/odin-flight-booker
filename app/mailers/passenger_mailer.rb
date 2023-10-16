class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(passenger = nil)
    if params && params.has_key?(:passenger)
      @passenger = params[:passenger]
    else
      @passenger = passenger
    end

    @url = 'http://example.com/login'
    mail(to: @passenger.email, subject: 'You have booked your ticket!')
  end
end
