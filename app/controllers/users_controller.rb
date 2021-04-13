class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @itinerary = @user.itineraries.new
    @itineraries = @user.itineraries.all
  end

  def edit
    if @user == current_user
    else
      render to user_path(current_user.id)
    end
  end

  def update
    user = User.find(params[:id])
    if user == current_user
      user.update(user_params)
      redirect_to user_path(user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
