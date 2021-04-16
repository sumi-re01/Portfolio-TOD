class GalleriesController < ApplicationController

  def new
    # 紐付けたいtravelを取得
    # @travel = Travel.where(id: params[:gallery][:travel_id])
    @travels = current_user.travels.all
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.new(gallery_params)
    gallery.user_id = current_user.id
    if gallery.save
      redirect_to gallery_path(gallery)
    else
      @travel = current_user.travels.all
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(patams[:id])
  end

  def update
  end

  def destroy
  end

  def show
    @gallery = Gallery.find(params[:id])
    @user = @gallery.travel.user
  end

  def index
  end

  private

  def gallery_params
    params.require(:gallery).permit(:travel_id, :text, :address, :latitude, :longitude, :public_status, { images: [] })
  end

end
