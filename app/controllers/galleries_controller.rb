class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:edit, :update, :show, :destroy]
  before_action :set_own_travels, only: [:new, :update]


  def new
    # 紐付けたいtravelを取得
    # @travel = Travel.where(id: params[:gallery][:travel_id])
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.new(gallery_params)
    gallery.user_id = current_user.id
    if gallery.save
      redirect_to gallery_path(gallery)
    else
      @travels = current_user.travels.all
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @gallery.user_id = current_user.id
      @gallery.destroy
      redirect_to user_path(current_user)
    else
      redirect_to gallery_path(@gallery)
    end
  end

  def show
    @user = @gallery.travel.user
  end

  def index
    @galleries = Gallery.all
  end


  private

  def set_own_travels
    @travels = current_user.travels.all
  end

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:travel_id, :text, :address, :latitude, :longitude, :public_status, { images: [] })
  end

end
