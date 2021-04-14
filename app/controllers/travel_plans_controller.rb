class TravelPlansController < ApplicationController

  def create
    @travel = Travel.find(params[:travel_id])
    travel_plan = @travel.travel_plans.create(travel_plan_params)
    travel_plan.save

    render 'travels/plans'
  end

  def update
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
    TravelPlan.find_by(id: params[:id], travel_id: params[:travel_id]).destroy

    render 'travels/plans'
  end

  private

  def travel_plan_params
    params.require(:travel_plan).permit(:text, :position)
  end

end
