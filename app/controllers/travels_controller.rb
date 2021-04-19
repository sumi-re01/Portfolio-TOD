class TravelsController < ApplicationController
  before_action :set_travel, only: [:destroy, :show, :sort]

# user/show内

  def create
    travel = Travel.new(travel_params)
    travel.user_id = current_user.id

    if travel.save
      # travels/index.js.erbへ飛んでusers/showのtravel一覧を取得
      @travels = current_user.travels.all
      render 'users/travels/index'
    else
      # users/show.html.erbに戻る
      @travels = current_user.travels.all
      render 'users/show'
    end
  end

  def destroy
    @travel.destroy

    # index.js.erbへ
    @travels = current_user.travels.all
    render 'users/travels/index'
  end


# travels/show内

  def show
    @travel_plan = TravelPlan.new
  end

  # travels/_plansのposition更新
  def sort
    travel_plan = @travel.travel_plans[params[:from].to_i]
    travel_plan.insert_at(params[:to].to_i + 1)
    head :ok
  end


  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:title, :date, :user_id)
  end

end
