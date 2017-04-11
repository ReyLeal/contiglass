class GlassWineRoomsController < ApplicationController
  def index
    @email = Email.new
    @all_photos = GlassPhoto.first.glass_wine_rooms.paginate(:page => params[:page], :per_page => 30)
  end
end
