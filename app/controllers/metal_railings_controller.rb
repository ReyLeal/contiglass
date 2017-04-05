class MetalRailingsController < ApplicationController
  def index
    @all_photos = MetalPhoto.first.metal_railings.paginate(:page => params[:page], :per_page => 30)
  end
end
