class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail_id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
