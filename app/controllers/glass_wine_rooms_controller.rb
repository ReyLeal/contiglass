class GlassWineRoomsController < ApplicationController
  def index
    @email = Email.new
    glass_photo = GlassPhoto.first
    @all_photos = (glass_photo ? glass_photo.glass_wine_rooms : GlassWineRoom.none).paginate(:page => params[:page], :per_page => 30)
  end
end
