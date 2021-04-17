class MarksController < ApplicationController
  before_action :set_gallery, only: [:create, :destroy]

  def create
    Mark.create(user_id: current_user.id, gallery_id: @gallery.id)
    render 'marks/mark'
  end

  def destroy
    mark = @gallery.marks.find_by(user_id: current_user.id, gallery_id: @gallery.id)
    mark.destroy
    render 'marks/mark'
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

end
