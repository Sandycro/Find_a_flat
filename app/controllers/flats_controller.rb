class FlatsController < ApplicationController

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @restaurant.save
      redirect_to flat_path(@flat)
    else
      render :new
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :user)
  end
end
