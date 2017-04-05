class AllPhotosController < ApplicationController
  def index
    # @photos = Photo.paginate(:page => params[:page], :per_page => 30)
    @all_photos = Photo.first.all_photos.paginate(:page => params[:page], :per_page => 30)
  end
end
