class GlassStairsController < ApplicationController
  def index
    @all_photos = GlassPhoto.first.glass_stairs.all.paginate(:page => params[:page], :per_page => 30)
  end
end
