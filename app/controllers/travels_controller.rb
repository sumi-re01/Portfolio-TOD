class TravelsController < ApplicationController

  # user/show内
    def create
      # current_userについては見直し必。繰り返しをまとめる
      travel = Travel.new(travel_params)
      travel.user_id = current_user.id
      if travel.save
        # travels/index.js.erbへ飛んでusers/showのtravel一覧を取得
        @travels = current_user.travels.all
        render :index
      else
        # users/show.html.erbに戻る
        @travels = current_user.travels.all
        render 'users/show'
      end
    end

    def destroy
      travel = Travel.find(params[:id])
      travel.destroy

      @travels = current_user.travels.all
      render 'travels/index'
    end


    def show
      @travel = Travel.find(params[:id])
      @travel_plan = TravelPlan.new
    end

    def update
    end

    private

    def travel_params
       params.require(:travel).permit(:title, :date, :user_id)
    end

end
