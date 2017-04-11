class MetalFabricationsController < ApplicationController
  def index
    @email = Email.new
    @all_photos = MetalPhoto.first.metal_fabrications.paginate(:page => params[:page], :per_page => 30)
  end
end
