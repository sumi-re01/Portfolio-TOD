class TravelPlansController < ApplicationController
  before_action :set_travel, only: [:create, :destroy]

  def create
    @travel = Travel.find(params[:travel_id])
    travel_plan = @travel.travel_plans.create(travel_plan_params)
    if travel_plan.save

      # 非同期で表示。でindex.js.erb→plans.htmlの更新
      @selector = "#plans_index"
      @url = "travels/plans"
      render 'travels/index'
    else
      # 日程表パーツの作成ができなかった場合→show.html.erb
      @travel = Travel.find(params[:travel_id])
      render 'travels/show'
    end
  end

  def update
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
