class GlassStairsController < ApplicationController
  def index
    @email = Email.new
    @all_photos = GlassPhoto.first.glass_stairs.paginate(:page => params[:page], :per_page => 30)
  end
end
