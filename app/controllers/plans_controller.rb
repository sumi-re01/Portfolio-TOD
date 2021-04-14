class PlansController < ApplicationController

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    itinerary_plan = @itinerary.plans.create(plan_params)
    itinerary_plan.save

    render 'itineraries/plans'
  end

  def update
  end

  def destroy
    @itinerary = Itineraryl.find(params[:itinerary_id])
    Plan.find_by(id: params[:id], itinerary_id: params[:itinerary_id]).destroy

    render 'itineraries/plans'
  end

  private

  def plan_params
    params.require(:plan).permit(:text, :position, :itinerary_id)
  end

end
