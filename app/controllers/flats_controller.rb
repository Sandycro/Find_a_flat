class FlatsController < ApplicationController
   skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @flats = Flat.search_by_name_and_address(params[:query])
    else
      @flats = Flat.all
    end
    @flats_map = Flat.geocoded
    @markers = @flats_map.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
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
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @bookings = Booking.where(flat: @flat)
    @markers=[{
        lat: @flat.latitude,
        lng: @flat.longitude
      }]
  end

private

  def flat_params
    params.require(:flat).permit(:name, :address, :price, :description, photos: [])
  end
end
