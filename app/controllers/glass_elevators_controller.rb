class GlassElevatorsController < ApplicationController
  def index
    @all_photos = GlassPhoto.first.glass_elevators.paginate(:page => params[:page], :per_page => 30)

  end
end
