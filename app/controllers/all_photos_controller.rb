class AllPhotosController < ApplicationController
  def index
    @email = Email.new
    # @photos = Photo.paginate(:page => params[:page], :per_page => 30)
    photo = Photo.first
    @all_photos = (photo ? photo.all_photos : AllPhoto.none).paginate(:page => params[:page], :per_page => 30)
  end

  def about
    @email = Email.new
  end
end
