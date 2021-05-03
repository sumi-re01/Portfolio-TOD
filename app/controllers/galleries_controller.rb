class GalleriesController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]
  before_action :set_gallery, only: [:edit, :update, :show, :destroy]
  before_action :if_not_user_eq, only: [:edit, :update]
  before_action :set_own_travels, only: [:new, :update, :edit]


  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      @travels = current_user.travels.all
      render :new
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery.id)
    else
      render :edit
    end
  end

  def destroy
    if @gallery.user_id = current_user.id
      @gallery.destroy
      redirect_to user_path(current_user)
    else
      redirect_to gallery_path(@gallery)
    end
  end

  def marks
    user_marks = Mark.where(user_id: current_user).all
    @marks = user_marks.pluck(:gallery_id)
    @mark_galleries = Gallery.where(id: @marks).all.page(params[:page]).per(9)
  end

  def show
    @travel_plans = @gallery.travel.travel_plans.all
    @user = @gallery.travel.user
  end

  def index
    @galleries = Gallery.where(public_status: true).all.page(params[:page]).per(9)
  end


  private

  def set_own_travels
    @travels = current_user.travels.all
  end

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def if_not_user_eq
    if @gallery.user_id != current_user.id
      redirect_to gallery_path(@gallery)
    end
  end

  def gallery_params
    params.require(:gallery).permit(:travel_id, :text, :address, :latitude, :longitude, :public_status, { images: [] })
  end

end
