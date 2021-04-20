class TravelPlansController < ApplicationController
  before_action :set_travel, only: [:create,:update, :destroy]

  def create
    @travel_plan = @travel.travel_plans.create(travel_plan_params)
    @travel_plan.save
    # index.js.erbからplans.htmlを更新
    @selector = "#plans_index"
    @url = "travels/plans"
    render 'travels/index'
  end

  def update
    @travel_plan = TravelPlan.find_by(id: params[:id], travel_id: params[:travel_id])
    @travel_plan.update(travel_plan_params)
  end

  def destroy
    TravelPlan.find_by(id: params[:id], travel_id: params[:travel_id]).destroy

    # createと同じくindex.js→plans.htmlの更新
    @selector = "#plans_index"
    @url = "travels/plans"
    render 'travels/index'
  end

  private

  def set_travel
    @travel = Travel.find(params[:travel_id])
  end

  def travel_plan_params
    params.require(:travel_plan).permit(:text, :position)
  end

end
