class GlassRailingsController < ApplicationController
  def index
    @all_photos = GlassPhoto.first.glass_railings.paginate(:page => params[:page], :per_page => 30)
  end
end
