class GlassShowerDoorsController < ApplicationController
  def index
    @all_photos = GlassPhoto.first.glass_shower_doors.paginate(:page => params[:page], :per_page => 30)
  end
end
