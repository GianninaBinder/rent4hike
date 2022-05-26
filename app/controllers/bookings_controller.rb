class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  # GET /bookings/new
  def new
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new
  end

  # POST /bookings
  def create
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(booking_params)
    @booking.tool = @tool
    @booking.user = current_user
    @booking.save
    redirect_to bookings_path
  end

   # GET /bookings/1/edit
   def edit
   end

  # PATCH/PUT /bookings/1
  def update
      if @booking.update(booking_params)
        redirect_to booking_path(@booking), notice: "Booking was successfully updated."
      else
        render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
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
      params.require(:booking).permit(:start_date, :end_date)
    end
end
