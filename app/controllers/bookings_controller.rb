class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  def index
    # Show only current user's reservation
    @bookings = current_user.bookings
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_user.bookings.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    # Create reservation
    @booking = current_user.bookings.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_path, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Set the booking using the current user's bookings
    def set_booking
      @booking = current_user.bookings.find(params[:id])
    end

    # Permit only trusted parameters. Note: :user_id is omitted because it is set automatically
    def booking_params
      params.require(:booking).permit(:route_id, :status, :booked_at)
    end
end
