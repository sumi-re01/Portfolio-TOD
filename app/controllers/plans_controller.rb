class PlansController < ApplicationController

  def create
    @itinerary = Itinerary.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:text, :position)
  end

end
