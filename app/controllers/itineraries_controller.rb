class ItinerariesController < ApplicationController

    def create
      itinerary = Itinerary.new(itinerary_params)
      itinerary.user_id = current_user.id
      if itinerary.save
        redirect_to user_path(current_user)
      else
        @user = User.find(params[:id])
        @itineraries = @user.itineraries.all
        render 'users/show'
      end
    end

    def show
    end

    def update
    end

    private

    def itinerary_params
       params.require(:itinerary).permit(:title, :date, :user_id)
    end

end
