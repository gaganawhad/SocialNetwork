class AlbumsController < ApplicationController
  def index
    @albums = Album.find_all_by_user_id(params[:user_id])
  end
end
