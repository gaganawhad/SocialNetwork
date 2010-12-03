class AlbumsController < ApplicationController
  def index
    @albums = Album.find_all_by_user_id(params[:user_id])
  end
  def show
    @album = Album.find(params[:id])
  end
  def new
    @album = current_user.albums.build
  end
  def edit
    @album = Album.find(params[:id])
  end
  def create
    @album = current_user.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Album was created successfully"
    else
      flash[:error] = "Album was not created"
    end
    redirect_to user_path(current_user)
  end
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "Album was updated successfully"
    else
      flash[:error] = "Album was not updateed"
    end
    redirect_to user_path(current_user)
  end
end
