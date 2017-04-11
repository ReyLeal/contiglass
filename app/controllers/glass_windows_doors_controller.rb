class GlassWindowsDoorsController < ApplicationController
  def index
    @email = Email.new
    @all_photos = GlassPhoto.first.glass_windows_doors.paginate(:page => params[:page], :per_page => 30)
  end
end
