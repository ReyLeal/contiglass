class GlassStairsController < ApplicationController
  def index
    @email = Email.new
    glass_photo = GlassPhoto.first
    @all_photos = (glass_photo ? glass_photo.glass_stairs : GlassStair.none).paginate(:page => params[:page], :per_page => 30)
  end
end
