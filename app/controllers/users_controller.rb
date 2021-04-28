class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @travel = @user.travels.new
    @travels = @user.travels.all.page(params[:page])
    @galleries = Gallery.where(user_id: @user.id).all.page(params[:page]).per(2)

    if @user == current_user
      render :show
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
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
