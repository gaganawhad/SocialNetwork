class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  def edit
    @photo = Photo.find(params[:id])
  end
  def create
    @photo = Photo.new(params[:photo])
    @photo.save
    redirect_to user_album_photo_path(:user_id => params[:user_id], :album_id => params[:album_id], :id => @photo.id)
  end
  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
  end
  def show
    @photo = Photo.find(params[:id])
    @comment = @photo.comments.build
  end
end
