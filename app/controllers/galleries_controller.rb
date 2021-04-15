class GalleriesController < ApplicationController

  def new
    # 紐付けたいtravelを取得
    # @travel = Travel.where(id: params[:gallery][:travel_id])
    @travels = current_user.travels.all
    @gallery = Gallery.new
    @gallery.gallery_images.build
  end

  def create
    gallery = Gallery.new(gallery_params)
    if gallery.save
      redirect_to gallery_path(gallery)
    else
      @travel = current_user.travels.all
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def gallery_params
    params.require(:gallery).permit(:travel_id, :text, :address, :latitude, :longitude, :public_status, gallery_images_images: [])
  end

end
