class ItinerariesController < ApplicationController

    def create
      # current_userについては見直し必。繰り返しをまとめる
      itinerary = Itinerary.new(itinerary_params)
      itinerary.user_id = current_user.id
      if itinerary.save
        @itineraries = current_user.itineraries.all
        render :index
      else
        @itineraries = current_user.itineraries.all
        render 'users/show'
      end
    end

    def destroy
      itinerary = Itinerary.find(params[:id])
      itinerary.destroy

      @itineraries = current_user.itineraries.all
      render 'itineraries/index'
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
