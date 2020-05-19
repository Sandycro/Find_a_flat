class FlatsController < ApplicationController

  
  def edit 
    @flat = Flat.find(params[:id])
  end

  def update 
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :name, :user)
  end
end
