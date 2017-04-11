class OtherGlassStructuresController < ApplicationController
  def index
    @email = Email.new
    @all_photos = GlassPhoto.first.other_glass_structures.paginate(:page => params[:page], :per_page => 30)
  end
end
