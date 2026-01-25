class MetalRailingsController < ApplicationController
  def index
    @email = Email.new
    metal_photo = MetalPhoto.first
    @all_photos = (metal_photo ? metal_photo.metal_railings : MetalRailing.none).paginate(:page => params[:page], :per_page => 30)
  end
end
