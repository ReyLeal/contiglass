class OtherGlassStructuresController < ApplicationController
  def index
    @email = Email.new
    glass_photo = GlassPhoto.first
    @all_photos = (glass_photo ? glass_photo.other_glass_structures : OtherGlassStructure.none).paginate(:page => params[:page], :per_page => 30)
  end
end
