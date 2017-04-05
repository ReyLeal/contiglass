class GlassFloorsController < ApplicationController
  def index
    @all_photos = GlassPhoto.first.glass_floors.paginate(:page => params[:page], :per_page => 30)
  end
end
