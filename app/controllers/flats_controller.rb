class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit 
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to @flat_path
    else
      render :edit
    end
  end
  
  def show
    @flat = Flat.find(params[:id])
    @bookings = Booking.where(flat: @flat)
  end

private
  
  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
