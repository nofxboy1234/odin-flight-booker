class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @flight_id = Flight.find(params[:selected_flight][:flight_id]).id

    @booking = Booking.new
    number_of_passengers = params[:selected_flight][:number_of_passengers]
    number_of_passengers.to_i.times { @booking.passengers.build }
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    # @flight = Flight.find(params[:flight_id])
    # @flight.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        puts '************** BookingsController#create ************'

        @booking.passengers.each do |passenger|
          PassengerMailer.with(passenger:).confirmation_email.deliver_later
        end

        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    # params.fetch(:booking, {})
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email _destroy])
  end
end
