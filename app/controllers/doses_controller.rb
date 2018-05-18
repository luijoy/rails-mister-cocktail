class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully created.' }
      else
        @dose
        format.html { render :new }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
