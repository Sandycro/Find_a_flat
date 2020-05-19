class FlatsController < ApplicationController
  def edit 
    @flat = Flat.find(params[:id])
  end

  def update 
    @flat = Flat.find(params[:id])
    if @flat.save 
      redirect_to @flat_path
    else 
      render :edit
    end
  end
end
